#include <string>

#include "Ast.hpp"


int AstNode::counter = 0;



void AstNode::output(int level) const
{
    
}


void Ast::output()
{
    fprintf(yyout, "program\n");
    if(root != nullptr)
        root->output(4);
}