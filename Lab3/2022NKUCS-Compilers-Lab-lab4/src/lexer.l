%option noyywrap

%top{
    #include <ostream>
    #include <fstream>
    #include <string>
    #include <cmath>
    #include <map>
    #include <vector>

    #define YY_NO_UNPUT
    #define YY_NO_INPUT

    using namespace std;

    extern FILE *yyin;
    extern FILE *yyout;

    struct Scope
    {
        int parent_id;
        map<string,string> symbol_table;
        Scope(int parent_id):parent_id(parent_id){}
    };
    vector<Scope> scope_list;
    Scope func_scope(0);
    int scope_id = 0;

    void Output(string token, string lexeme, int lineno, int offset, string addr, string type = "")
    {
        fprintf(yyout,"%10s%20s%10d%10d%30s%10s\n",token.c_str(),lexeme.c_str(),lineno,offset,addr.c_str(),type.c_str());
        return;
    }

    void InsertSymbol(int ident_scope, string ident)
    {
        string ident_addr = "S"+to_string(ident_scope)+"_"+ident+"_addr";
        scope_list[ident_scope].symbol_table[ident] = ident_addr;
        return;
    }

    int FindSymbol(int ident_scope, string ident, int mode = 0)
    {
        switch (mode)
        {
        case 0:
            return scope_list[ident_scope].symbol_table.count(ident);
        case 1:
            while(ident_scope > -1 && scope_list[ident_scope].symbol_table.count(ident) == 0)
            {
                ident_scope = scope_list[ident_scope].parent_id;
            }
            return ident_scope;
        default:
            return -1;
        }
    }
    int offset = 0;
    // 变量声明锁
    bool declare_x1 = false;
    // 括号锁
    char declare_x2 = 127;
    // 函数锁
    bool declare_x3 = false;

}

Decimial            ([1-9][0-9]*|0)
Octonary            (0[oO]?[0-7]+)
Hexadecimal         (0[xX][0-9A-Fa-f]+)
Float               (([0-9]*(\.[0-9]+)|[0-9]+\.?)([eE][+-]?[0-9]+)?)

Ident               ([a-zA-Z_][a-zA-Z_0-9]*)

EndLine             (\r\n|\n|\r)
BlankChar           ([ \t\v])

BlockCommentBegin   (\/\*)
BlockCommentEnd     (\*\/)
LineCommentBegin    (\/\/)
CommentBody         ([^\r\n|\n|\r])

%x BLOCKCOMMENT
%x LINECOMMENT

%%
{LineCommentBegin} {
    BEGIN LINECOMMENT;
}
<LINECOMMENT>{CommentBody} {
    /*do nothing*/
}
<LINECOMMENT>{EndLine} {
    yylineno++;
    offset=0;
    BEGIN INITIAL;
}
{BlockCommentBegin} {
    BEGIN BLOCKCOMMENT;
}
<BLOCKCOMMENT>{CommentBody} {
    /*do nothing*/
}
<BLOCKCOMMENT>{EndLine} {
    yylineno++;
    offset=0;
}
<BLOCKCOMMENT>{BlockCommentEnd} {
    BEGIN INITIAL;
}
{BlankChar} {
    offset++;
}
{EndLine} {
    yylineno++;
    offset=0;
}
"int" {
    declare_x1=true;
    if(declare_x2==1)
    {
        declare_x3=true;
    }
    else
    {
        declare_x2=0;
    }
    Output("INT","int",yylineno,offset,"");
    offset+=3;
}
"float" {
    declare_x1=true;
    if(declare_x2==1)
    {
        declare_x3=true;
    }
    else
    {
        declare_x2=0;
    }
    Output("FLOAT","float",yylineno,offset,"");
    offset+=5;
}
"void" {
    declare_x1=true;
    declare_x2=0;
    Output("VOID","void",yylineno,offset,"");
    offset+=4;
}
"const" {
    Output("CONST","const",yylineno,offset,"");
    offset+=5;
}
"if" {
    Output("IF","if",yylineno,offset,"");
    offset+=2;
}
"else" {
    Output("ELSE","else",yylineno,offset,"");
    offset+=4;
}
"while" {
    Output("WHILE","while",yylineno,offset,"");
    offset+=5;
}
"break" {
    Output("BREAK","break",yylineno,offset,"");
    offset+=5;
}
"continue" {
    Output("CONTINUE","continue",yylineno,offset,"");
    offset+=8;
}
"return" {
    Output("RETURN","return",yylineno,offset,"");
    offset+=6;
}
"||" {
    Output("OR","||",yylineno,offset,"");
    offset+=2;
}
"&&" {
    Output("AND","&&",yylineno,offset,"");
    offset+=2;
}
"==" {
    Output("EQ","==",yylineno,offset,"");
    offset+=2;
}
"!=" {
    Output("NE","!=",yylineno,offset,"");
    offset+=2;
}
"<=" {
    Output("LE","<=",yylineno,offset,"");
    offset+=2;
}
">=" {
    Output("GE","<=",yylineno,offset,"");
    offset+=2;
}
"<" {
    Output("L","<",yylineno,offset,"");
    offset+=1;
}
">" {
    Output("G",">",yylineno,offset,"");
    offset+=1;
}
"=" {
    Output("ASSGIN","=",yylineno,offset,"");
    offset+=1;
}
"+" {
    Output("ADD","+",yylineno,offset,"");
    offset+=1;
}
"-" {
    Output("SUB","-",yylineno,offset,"");
    offset+=1;
}
"*" {
    Output("MUL","*",yylineno,offset,"");
    offset+=1;
}
"/" {
    Output("DIV","/",yylineno,offset,"");
    offset+=1;
}
"%" {
    Output("MOD","%",yylineno,offset,"");
    offset+=1;
}
"!" {
    Output("NOT","!",yylineno,offset,"");
    offset+=1;
}
";" {
    declare_x1=false;
    declare_x2=127;
    declare_x3=false;
    Output("SEMI",";",yylineno,offset,"");
    offset+=1;
}
"," {
    declare_x1 = !declare_x2;
    declare_x3 = false;
    Output("COMMA",",",yylineno,offset,"");
    offset+=1;
}
"(" {
    declare_x2++;
    if(declare_x2==1)
    {
        declare_x3=true;
    }
    Output("L_PAREN",")",yylineno,offset,"");
    offset+=1;
}
")" {
    declare_x2--;
    Output("R_PAREN",")",yylineno,offset,"");
    offset+=1;
}
"[" {
    Output("L_SQUARE","[",yylineno,offset,"");
    offset+=1;
}
"]" {
    Output("R_SQUARE","]",yylineno,offset,"");
    offset+=1;
}
"{" {
    scope_list.push_back(Scope(scope_id));
    scope_id = scope_list.size()-1;
    Output("L_BRACE","{",yylineno,offset,"");
    if(declare_x3)
    {
        declare_x1=false;
        declare_x2=127;
        declare_x3=false;
        for(auto &item : func_scope.symbol_table)
        {
            scope_list[scope_id].symbol_table[item.first]=item.second;
            //fprintf(yyout,"%10s\n",item.second.c_str());
        }
        func_scope.symbol_table.clear();
    }
    declare_x2++;
    offset+=1;
}
"}" {
    declare_x2--;
    scope_id = scope_list[scope_id].parent_id;
    Output("R_BRACE","}",yylineno,offset,"");
    offset+=1;
}
{Decimial} {
    Output("INT_NUM",string(yytext),yylineno,offset,"");
    offset += yyleng;
}
{Octonary} {
    int num;
    sscanf(yytext, "%o", &num);
    Output("INT_NUM",to_string(num),yylineno,offset,"");
    offset += yyleng;

}
{Hexadecimal} {
    int num;
    sscanf(yytext, "%x", &num);
    Output("INT_NUM",to_string(num),yylineno,offset,"");
    offset += yyleng;
}
{Float} {
    float num;
    sscanf(yytext, "%f", &num);
    Output("FLOAT_NUM",to_string(num),yylineno,offset,"");
    offset += yyleng;
}
{Ident} {
    string ident = string(yytext);
    string ident_addr;
    // 声明
    if(declare_x1)
    {
        declare_x1 = false;
        if(declare_x3) // 形参声明
        {
            string ident_addr = "S"+to_string(scope_list.size())+"_"+ident+"_addr";
            func_scope.symbol_table[ident] = ident_addr;
            Output("ID",ident,yylineno,offset,ident_addr,"fparam");
        }
        else if(FindSymbol(scope_id,ident)) //重复声明
        {
            Output("ID",ident,yylineno,offset,"duplicate defined!");
        }
        else //新声明
        {
            InsertSymbol(scope_id,ident);
            ident_addr = scope_list[scope_id].symbol_table[ident];
            Output("ID",ident,yylineno,offset,ident_addr,"declare");
        }
    }
    else //引用
    {
        int ident_scope = FindSymbol(scope_id,ident,1);
        if(ident_scope == -1) //未声明
        {
            Output("ID",ident,yylineno,offset,"undefined!");
            InsertSymbol(scope_id,ident);
        }
        else //已声明
        {
            ident_addr = scope_list[ident_scope].symbol_table[ident];
            Output("ID",ident,yylineno,offset,ident_addr,"use");
        }
    }
    offset += yyleng;
}


%%
int main(int argc, char **argv)
{
    if(argc != 5)
    {
        fprintf(stderr, "Argument Not Enough");
        exit(EXIT_FAILURE);
    }
    if(!(yyin = fopen(argv[1], "r")))
    {
        fprintf(stderr, "No such file or directory: %s", argv[1]);
        exit(EXIT_FAILURE);
    }
    if(!(yyout = fopen(argv[3], "w")))
    {
        fprintf(stderr, "No such file or directory: %s", argv[3]);
        exit(EXIT_FAILURE);
    }
    scope_list.push_back(Scope(-1));

    fprintf(yyout,"%10s%20s%10s%10s%30s\n","token","lexeme","lineno","offset","address");

    yylex();
    return 0;
}