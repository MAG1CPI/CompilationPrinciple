%{
    /****Get suffix expression****/
    #include<iostream>
    #include<cstring>
    #include<cctype>
    using namespace std;

    #ifndef YYSTYPE
    #define YYSTYPE string
    #endif
    extern YYSTYPE yylval;

    string expr_str;
    string str;

    int yylex();
    extern int yyparse();
    FILE* yyin;
    void yyerror(const char* s);
%}

%token ADD SUB MUL DIV NUMBER ID

%left ADD SUB
%left MUL DIV
%right UMINUS

%%

lines   :   lines expr ';'              { cout<<$2<<endl; }
        |   lines ';'
        |
        ;

expr    :   expr ADD expr               { $$ = $1 + $3 + "+ "; }
        |   expr SUB expr               { $$ = $1 + $3 + "- "; }
        |   expr MUL expr               { $$ = $1 + $3 + "* "; }
        |   expr DIV expr               { $$ = $1 + $3 + "/ "; }
        |   '(' expr ')'                { $$ = $2; }
        |   SUB expr    %prec UMINUS    { $$ = "-" + $2; }
        |   NUMBER                      { $$ = $1 + " "; }
        |   ID                          { $$ = $1 + " "; }

%%


int yylex()
{
    int t;
    while(1)
    {
        t = getchar();
        if(t == ' '|| t == '\t' || t == '\n'){                                      // blank character
            /* do nothing */;
        }
        else if(isdigit(t)){                                                        // digit
            yylval = "";
            do{
                yylval += t;
                t = getchar();
            }while(isdigit(t));

			ungetc(t , stdin);
			return NUMBER;
		}
		else if (t >='a' && t <='z' || t >='A' && t <='Z' || t == '_')              // id
        {
            yylval="";
            do{
                yylval += t;
                t = getchar();
            }while((t >= 'a' && t <= 'z') || ( t >= 'A' && t <= 'Z') || (t == '_') || ( t >= '0' && t <= '9'));

			ungetc(t, stdin);
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
                default:
                    return t;
            }
        }
    }
}

int main(void)
{
    yyin = stdin;
    do{
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