%{
    /****Get assembly code****/
    #include<iostream>
    #include<vector>
    #include<cstring>
    #include<cctype>
    using namespace std;

    struct symbol{
        string id;
        string addr;
    };
    struct code_block{
        string code;
        string addr;
    };

    vector<symbol> symbol_table;
    string id;
    string num;
    code_block code;
    
    int yylex();
    extern int yyparse();
    FILE* yyin;
    void yyerror(const char* s);
%}

%union
{
    int id_num;
    struct code_block *code;
}

%type <code> expr

%token <id_num> ID
%token <code> NUMBER
%token ADD SUB MUL DIV
%token ASSIGN

%right ASSIGN
%left ADD SUB
%left MUL DIV
%right UMINUS

%%

lines   :   lines expr ';'                  { cout << $2->code << endl; }
        |   lines ';'
        |
        ;

expr    :   expr ADD expr                   { $$ = new code_block;
                                              $$->addr = "add_result_addr";
                                              $$->code = $1->code 
                                                       + $3->code
                                                       + "LDR R1, "+$1->addr+"\n"
                                                       + "LDR R2, "+$3->addr+"\n"
                                                       + "ADD R1, R1, R2\n"
                                                       + "STR R1, "+$$->addr+"\n";
                                              delete $1;
                                              delete $3;
                                              }
        |   expr SUB expr                   { $$ = new code_block;
                                              $$->addr = "sub_result_addr";
                                              $$->code = $1->code 
                                                       + $3->code
                                                       + "LDR R1, "+$1->addr+"\n"
                                                       + "LDR R2, "+$3->addr+"\n"
                                                       + "SUB R1, R1, R2\n"
                                                       + "STR R1, "+$$->addr+"\n";
                                              delete $1;
                                              delete $3; }
        |   expr MUL expr                   { $$ = new code_block;
                                              $$->addr = "mul_result_addr";
                                              $$->code = $1->code 
                                                       + $3->code
                                                       + "LDR R1, "+$1->addr+"\n"
                                                       + "LDR R2, "+$3->addr+"\n"
                                                       + "MUL R1, R1, R2\n"
                                                       + "STR R1, "+$$->addr+"\n";
                                              delete $1;
                                              delete $3; }
        |   expr DIV expr                   { $$ = new code_block;
                                              $$->addr = "div_result_addr";
                                              $$->code = $1->code 
                                                       + $3->code
                                                       + "LDR R1, "+$1->addr+"\n"
                                                       + "LDR R2, "+$3->addr+"\n"
                                                       + "SDIV R1, R1, R2\n"
                                                       + "STR R1, "+$$->addr+"\n";
                                              delete $1;
                                              delete $3; }
        |   ID ASSIGN expr                  { $$ = new code_block;
                                              $$->addr = symbol_table[$1].addr;
                                              $$->code = $3->code
                                                       + "LDR, R0 "+$3->addr+"\n"
                                                       + "STR, R0 "+symbol_table[$1].addr+"\n";
                                              delete $3; }
        |   '('expr')'                      { $$ = new code_block;
                                              $$->addr = $2->addr;
                                              $$->code = $2->code;
                                              delete $2; }
        |   SUB expr    %prec UMINUS        { $$ = new code_block;
                                              $$->addr = "uminus_result_addr";
                                              $$->code = $2->code
                                                       + "LDR R1, "+$2->addr+"\n"
                                                       + "ADD R2, R0, R0\n"
                                                       + "SUB R1, R2, R1\n"
                                                       + "STR R1, "+$$->addr+"\n";
                                              delete $2; }
        |   NUMBER                          { $$ = new code_block;
                                              $$->addr = $1->addr;
                                              $$->code = "";
                                              delete $1; }
        |   ID                              { $$ = new code_block;
                                              $$->addr = symbol_table[$1].addr; 
                                              $$->code = ""; }
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
            num="";
            do{
                num += t;
                t = getchar();
            }while(isdigit(t));
            yylval.code=new code_block;
            yylval.code->addr = "=" + num;
            yylval.code->code = "";

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
                s.addr=id+"_addr";
                symbol_table.push_back(s);
                //cout<<"new id:"<<id<<endl;
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
    yyin=stdin;
    do{
        yyparse();
    }while(!feof(yyin));
    return 0;
}

void yyerror(const char* s){
    fprintf(stderr,"Parse error:%s\n",s);
    exit(1);
}