%{

#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#include<string.h>

#define SYMBOL_TABLE_SIZE 128

struct symbol_table_entry
{
    char *id;
    char *addr;
} symbol_table[SYMBOL_TABLE_SIZE];

struct code_block
{
    char *code;
    char *addr;
};

char idStr[50];
char numStr[50];
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
    struct code_block *assembly;
    struct symbol_table_entry *ident;
}

%type <assembly> assignstmt
%type <assembly> expr

%token ADD SUB MUL DIV ASSIGN
%token <assembly> NUMBER
%token <ident> ID

%right ASSIGN
%left ADD SUB
%left MUL DIV
%right UMINUS

%%

lines : lines expr ';' { printf("%s", $2->code); }
      | lines assignstmt ';' { printf("%s", $2->code); }
      | lines ';'
      |
      ;

assignstmt : ID ASSIGN assignstmt { $$ = (struct code_block *)malloc(sizeof(struct code_block));
                                    $$->addr = (char *)malloc(50 * sizeof(char)); strcpy($$->addr, $3->addr);
                                    $$->code = (char *)malloc(500 * sizeof(char)); strcpy($$->code, $3->code);
                                    strcat($$->code, "LDR  R1, "); strcat($$->code, $1->addr); strcat($$->code, "\n");
                                    strcat($$->code, "STR  R2, [R1]\n"); }

           | ID ASSIGN expr { $$ = (struct code_block *)malloc(sizeof(struct code_block));
                              $$->addr = (char *)malloc(50 * sizeof(char)); strcpy($$->addr, $3->addr);
                              $$->code = (char *)malloc(500 * sizeof(char)); strcpy($$->code, $3->code);
                              strcat($$->code, "LDR  R0, "); strcat($$->code, $3->addr); strcat($$->code, "\n");
                              strcat($$->code, "LDR  R1, "); strcat($$->code, $1->addr); strcat($$->code, "\n");
                              strcat($$->code, "LDR  R2, [R0]\n");
                              strcat($$->code, "STR  R2, [R1]\n"); }
           ;

expr : expr ADD expr { $$ = (struct code_block *)malloc(sizeof(struct code_block));
                       $$->addr = (char *)malloc(50 * sizeof(char)); strcpy($$->addr, "addr_add-result");
                       $$->code = (char *)malloc(500 * sizeof(char)); strcpy($$->code, $1->code); strcat($$->code, $3->code);
                       strcat($$->code, "LDR  R0, "); strcat($$->code, $1->addr); strcat($$->code, "\n");
                       strcat($$->code, "LDR  R1, "); strcat($$->code, $3->addr); strcat($$->code, "\n");
                       strcat($$->code, "LDR  R2, [R0]\n");
                       strcat($$->code, "LDR  R3, [R1]\n");
                       strcat($$->code, "ADD  R2, R2, R3\n");
                       strcat($$->code, "LDR  R0, "); strcat($$->code, $$->addr); strcat($$->code, "\n");
                       strcat($$->code, "STR  R2, [R0]\n"); }

     | expr SUB expr { $$ = (struct code_block *)malloc(sizeof(struct code_block));
                       $$->addr = (char *)malloc(50 * sizeof(char)); strcpy($$->addr, "addr_sub-result");
                       $$->code = (char *)malloc(500 * sizeof(char)); strcpy($$->code, $1->code); strcat($$->code, $3->code);
                       strcat($$->code, "LDR  R0, "); strcat($$->code, $1->addr); strcat($$->code, "\n");
                       strcat($$->code, "LDR  R1, "); strcat($$->code, $3->addr); strcat($$->code, "\n");
                       strcat($$->code, "LDR  R2, [R0]\n");
                       strcat($$->code, "LDR  R3, [R1]\n");
                       strcat($$->code, "SUB  R2, R2, R3\n");
                       strcat($$->code, "LDR  R0, "); strcat($$->code, $$->addr); strcat($$->code, "\n");
                       strcat($$->code, "STR  R2, [R0]\n"); }

     | expr MUL expr { $$ = (struct code_block *)malloc(sizeof(struct code_block));
                       $$->addr = (char *)malloc(50 * sizeof(char)); strcpy($$->addr, "addr_mul-result");
                       $$->code = (char *)malloc(500 * sizeof(char)); strcpy($$->code, $1->code); strcat($$->code, $3->code);
                       strcat($$->code, "LDR  R0, "); strcat($$->code, $1->addr); strcat($$->code, "\n");
                       strcat($$->code, "LDR  R1, "); strcat($$->code, $3->addr); strcat($$->code, "\n");
                       strcat($$->code, "LDR  R2, [R0]\n");
                       strcat($$->code, "LDR  R3, [R1]\n");
                       strcat($$->code, "MUL  R2, R2, R3\n");
                       strcat($$->code, "LDR  R0, "); strcat($$->code, $$->addr); strcat($$->code, "\n");
                       strcat($$->code, "STR  R2, [R0]\n"); }

     | expr DIV expr { $$ = (struct code_block *)malloc(sizeof(struct code_block));
                       $$->addr = (char *)malloc(50 * sizeof(char)); strcpy($$->addr, "addr_div-result");
                       $$->code = (char *)malloc(500 * sizeof(char)); strcpy($$->code, $1->code); strcat($$->code, $3->code);
                       strcat($$->code, "LDR  R0, "); strcat($$->code, $1->addr); strcat($$->code, "\n");
                       strcat($$->code, "LDR  R1, "); strcat($$->code, $3->addr); strcat($$->code, "\n");
                       strcat($$->code, "LDR  R2, [R0]\n");
                       strcat($$->code, "LDR  R3, [R1]\n");
                       strcat($$->code, "SDIV R2, R2, R3\n");
                       strcat($$->code, "LDR  R0, "); strcat($$->code, $$->addr); strcat($$->code, "\n");
                       strcat($$->code, "STR  R2, [R0]\n"); }

     | '(' expr ')' { $$ = (struct code_block *)malloc(sizeof(struct code_block));
                      $$->addr = $2->addr;
                      $$->code = $2->code; }

     | SUB expr %prec UMINUS { $$ = (struct code_block *)malloc(sizeof(struct code_block));
                               $$->addr = (char *)malloc(50 * sizeof(char)); strcpy($$->addr, "addr_neg-result");
                               $$->code = (char *)malloc(500 * sizeof(char)); strcpy($$->code, $2->code);
                               strcat($$->code, "LDR  R0, "); strcat($$->code, $2->addr); strcat($$->code, "\n");
                               strcat($$->code, "LDR  R1, [R0]\n");
                               strcat($$->code, "MOV  R2, #0x00\n");
                               strcat($$->code, "SUB  R1, R2, R1\n"); 
                               strcat($$->code, "LDR  R0, "); strcat($$->code, $$->addr); strcat($$->code, "\n");
                               strcat($$->code, "STR  R2, [R0]\n"); }
     
     | NUMBER { $$ = (struct code_block *)malloc(sizeof(struct code_block));
                $$->addr = (char *)malloc(50 * sizeof(char)); strcpy($$->addr, $1->addr);
                $$->code = (char *)malloc(50 * sizeof(char)); strcpy($$->code, ""); }

     | ID { $$ = (struct code_block *)malloc(sizeof(struct code_block));
            $$->addr = (char *)malloc(50 * sizeof(char)); strcpy($$->addr, $1->addr);
            $$->code = (char *)malloc(50 * sizeof(char)); strcpy($$->code, ""); }
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
            //fprintf(stdout, "find id no:%d id:%s addr:%s\n", i + 1, symbol_table[i].id, symbol_table[i].addr);
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

    symbol_table[entry_num].addr = (char *)malloc(50 * sizeof(char)); 
    strcpy(symbol_table[entry_num].addr, "addr_");
    strcat(symbol_table[entry_num].addr, string);

    entry_num++;
    //fprintf(stdout, "new id no:%d id:%s addr:%s\n", entry_num, symbol_table[entry_num - 1].id, symbol_table[entry_num - 1].addr);
    return entry_num;
}

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
        else if (t >= '0' && t <= '9')
        {
			int ti = 0;
			while (t >= '0' && t <= '9')
            {
				numStr[ti] = t;
				t = getchar();
				ti++;
			}
			numStr[ti] = '\0';
            yylval.assembly = (struct code_block *)malloc(sizeof(struct code_block));
            yylval.assembly->addr = (char *)malloc(50 * sizeof(char)); 
            strcpy(yylval.assembly->addr, "addr_");
            strcat(yylval.assembly->addr, numStr);
            yylval.assembly->code = "";
            //fprintf(stdout, "new number number:%s addr:%s\n", numStr, yylval.assembly->addr);
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