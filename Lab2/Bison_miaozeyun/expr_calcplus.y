%{

#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#include<string.h>

#define SYMBOL_TABLE_SIZE 128

struct symbol_table_entry
{
    char *id;
    double value;
} symbol_table[SYMBOL_TABLE_SIZE];

char idStr[50];
int lookup_symtab(char *string);
int insert_symtab_entry(char *string);
int entry_num = 0;

//#ifndef YYSTYPE
//#define YYSTYPE double
//#endif

int yylex();
extern int yyparse();
//extern YYSTYPE yylval;
FILE* yyin;
void yyerror(const char* s);

%}

%union
{
    double number;
    struct symbol_table_entry *ident;
}

%type <number> assignstmt
%type <number> expr

%token ADD SUB MUL DIV ASSIGN
%token <number> NUMBER
%token <ident> ID

%right ASSIGN
%left ADD SUB
%left MUL DIV
%right UMINUS

%%

lines : lines expr ';' { printf("%f\n", $2); }
      | lines assignstmt ';' { printf("%f\n", $2); }
      | lines ';'
      |
      ;

assignstmt : ID ASSIGN assignstmt { $$ = $1->value = $3; }
           | ID ASSIGN expr { $$ = $1->value = $3; }
           ;

expr : expr ADD expr { $$ = $1 + $3; }
     | expr SUB expr { $$ = $1 - $3; }
     | expr MUL expr { $$ = $1 * $3; }
     | expr DIV expr { $$ = $1 / $3; }
     | '(' expr ')' { $$ = $2; }
     | SUB expr %prec UMINUS { $$ = -$2; }
     | NUMBER { $$ = $1; }
     | ID { $$ = $1->value; }
     ;

%%

// programs section
//返回字符串string对应表项的索引，若未找到，返回0
int lookup_symtab(char *string)
{
    for(int i = 0; i < entry_num; i++)
    {
        if(strcmp(symbol_table[i].id, string) == 0)
        {
            //fprintf(stdout, "find id no:%d id:%s value:%f\n", i + 1, symbol_table[i].id, symbol_table[i].value);
            return i + 1;
        }
    }
    return 0;
}

//将表达式string（字符串）插入符号表，返回其索引
int insert_symtab_entry(char *string)
{
    if(entry_num >= SYMBOL_TABLE_SIZE)
    {
        fprintf(stderr, "The number of symbols exceeds 128!\n");
        exit(1);
    }

    symbol_table[entry_num].id = (char *)malloc(50 * sizeof(char));
    strcpy(symbol_table[entry_num].id, string);
    symbol_table[entry_num].value = 0;
    entry_num++;
    //fprintf(stdout, "new id no:%d id:%s value:%f\n", entry_num, symbol_table[entry_num - 1].id, symbol_table[entry_num - 1].value);
    return entry_num;
}

/*
int symbol_table_check(char *string)
{
    if(entry_num >= SYMBOL_TABLE_SIZE)
    {
        fprintf(stderr, "The number of symbols exceeds 128!\n");
        exit(1);
    }
    for(int i = 0; i < entry_num; i++)
    {
        if(strcmp(symbol_table[i].id, string) == 0)
        {
            //fprintf(stdout, "find id no:%d id:%s value:%f\n", i, symbol_table[i].id, symbol_table[i].value);
            return i;
        }
    }
    symbol_table[entry_num].id = (char *)malloc(50 * sizeof(char)); 
    strcpy(symbol_table[entry_num].id, string);
    symbol_table[entry_num].value = 0;
    entry_num++;
    //fprintf(stdout, "new id no:%d id:%s value:%f\n", entry_num - 1, symbol_table[entry_num - 1].id, symbol_table[entry_num - 1].value);
    return entry_num - 1;
}
*/

int yylex()
{
    // place your token retrieving code here
    int t;
    while(1)
    {
        t = getchar();
        if(t == ' ' || t == '\t' || t == '\n')
        {
            //do nothing;
        }
        else if(isdigit(t))
        {
            yylval.number = 0;
            while(isdigit(t))
            {
                yylval.number = yylval.number * 10 + t - '0';
                t = getchar();
            }
            ungetc(t, stdin);
            return NUMBER;
        }
        else if(t >='a' && t <='z' || t >='A' && t <='Z' || t == '_')
        {
			int ti = 0;
			while (t >='a' && t <='z' || t >='A' && t <='Z' || t == '_' || t >= '0' && t <= '9')
            {
				idStr[ti] = t;
				ti++;
				t = getchar();
			}
			idStr[ti]='\0';
            //int no = symbol_table_check(idStr);
            int no = lookup_symtab(idStr);
            if(no == 0)
            {
                no = insert_symtab_entry(idStr);
            }
            yylval.ident = &symbol_table[no - 1];
			ungetc(t, stdin);
			return ID;
		}
        else
        {
            switch(t)
            {
                case '+':
                    return ADD;
                case '-':
                    return SUB;
                case '*':
                    return MUL;
                case '/':
                    return DIV;
                case '=':
                    return ASSIGN;
                default:
                    return t;
            }
        }
    }
}

int main(void)
{
    yyin = stdin;
    struct symbol_table_entry *symbol_table = (struct symbol_table_entry *)malloc(SYMBOL_TABLE_SIZE * sizeof(struct symbol_table_entry));
    do
    {
        yyparse();
    }
    while(!feof(yyin));
    return 0;
}

void yyerror(const char* s)
{
    fprintf(stderr, "Parse error:%s\n", s);
    exit(1);
}