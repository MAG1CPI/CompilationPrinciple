%{
    /****Expression evaluation with symbol table****/
    #include<iostream>
    #include<cstring>
    #include<cctype>
    #include<vector>
    using namespace std;

    struct symbol{
        string id;
        double val;
    };
    vector<symbol> symbol_table;
    string id;

    //#ifndef YYSTYPE
    //#define YYSTYPE double
    //#endif
    //extern YYSTYPE yylval;

    int yylex();
    extern int yyparse();
    FILE* yyin;
    void yyerror(const char* s);
%}

%union
{
    double val;
    int id_num;
}

%type <val> expr

%token ASSIGN
%token ADD SUB MUL DIV
%token <val> NUMBER
%token <id_num> ID

%right ASSIGN
%left ADD SUB
%left MUL DIV
%right UMINUS

%%

lines   :   lines expr ';'                  { cout << $2 << endl; }
        |   lines ';'
        |
        ;

expr    :   ID ASSIGN expr                  { $$ = symbol_table[$1].val = $3; }
        |   expr ADD expr                   { $$ = $1 + $3; }
        |   expr SUB expr                   { $$ = $1 - $3; }
        |   expr MUL expr                   { $$ = $1 * $3; }
        |   expr DIV expr                   { $$ = $1 / $3; }
        |   '('expr')'                      { $$ = $2; }
        |   SUB expr    %prec UMINUS        { $$ = -$2; }
        |   NUMBER                          { $$ = $1; }
        |   ID                              { $$ = symbol_table[$1].val; }
        ;


%%

int find(){
    for(int i=0;i<symbol_table.size();i++)
        if(id == symbol_table[i].id)
            return i;
    return -1;
}

int yylex(){
    int t;
    while(1){
        t = getchar();
        if(t == ' '|| t == '\t' || t == '\n'){                                      // blank character
            /* do nothing */;
        }
        else if(isdigit(t)){                                                        // digit
            yylval.val = 0;
            while(isdigit(t)){
                yylval.val = yylval.val * 10 + t - '0';
                t = getchar();
            }
            // roll back a character
            ungetc(t,stdin);
            return NUMBER;
        }
        else if((t >= 'a' && t <= 'z') || ( t>= 'A' && t <= 'Z') || t == '_'){      // id
            // get id
            id="";
            do{
                id += t;
                t = getchar();
            }while((t >= 'a' && t <= 'z') || ( t >= 'A' && t <= 'Z') || (t == '_') || ( t >= '0' && t <= '9'));
            // is new id?
            int id_num = find();
            if(id_num == -1){   //new id
                yylval.id_num = symbol_table.size();
                symbol s;
                s.id=id;
                s.val=0;
                symbol_table.push_back(s);
                cout<<"new id:"<<id<<endl;
            }
            else{               //old id
                yylval.id_num = id_num;
            }
            // roll back a character
            ungetc(t,stdin);
            return ID;
        }
        else{                                                                       // sign
            switch(t){
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

int main(void){
    yyin = stdin;
    do{
        yyparse();
    }while(!feof(yyin));
    return 0;
}

void yyerror(const char* s)
{
    fprintf(stderr, "Parse error:%s\n", s);
    exit(1);
}