#include "Ast.hpp"

extern FILE *yyout;
int Node::counter = 0;

void Node::SetSibling(Node *sibling_node)
{
    sibling = sibling_node;
}

void Ast::output()
{
    fprintf(yyout, "program\n");
    if (root != nullptr)
        root->output(4);
}

void UnaryExpr::output(int level)
{
    std::string op_str;
    switch (op)
    {
    case ADD:
        op_str = "positive";
        break;
    case SUB:
        op_str = "negative";
        break;
    case NOT:
        op_str = "not";
        break;
    }
    fprintf(yyout, "%*cUnaryExpr\top: %s\n", level, ' ', op_str.c_str());
    expr->output(level + 4);
}

void BinaryExpr::output(int level)
{
    std::string op_str;
    switch (op)
    {
    case ADD:
        op_str = "add";
        break;
    case SUB:
        op_str = "sub";
        break;
    case MUL:
        op_str = "mul";
        break;
    case DIV:
        op_str = "div";
        break;
    case MOD:
        op_str = "mod";
        break;
    case OR:
        op_str = "or";
        break;
    case AND:
        op_str = "and";
        break;
    case LESS:
        op_str = "less";
        break;
    case LESSEQ:
        op_str = "less_equal";
        break;
    case GREATER:
        op_str = "greater";
        break;
    case GREATEREQ:
        op_str = "greater_equal";
        break;
    case EQ:
        op_str = "equal";
        break;
    case NOTEQ:
        op_str = "not_equal";
        break;
    }
    fprintf(yyout, "%*cBinaryExpr\top: %s\n", level, ' ', op_str.c_str());
    expr1->output(level + 4);
    expr2->output(level + 4);
}

void Constant::output(int level)
{
    std::string type, value;
    type = symbolEntry->getType()->toStr();
    value = symbolEntry->toStr();
    fprintf(yyout, "%*cIntegerLiteral\tvalue: %s\ttype: %s\n", level, ' ',
            value.c_str(), type.c_str());
}

void Id::output(int level)
{
    std::string name, type;
    int scope;
    name = symbolEntry->toStr();
    type = symbolEntry->getType()->toStr();
    scope = dynamic_cast<IdentifierSymbolEntry *>(symbolEntry)->getScope();
    fprintf(yyout, "%*cId\tname: %s\tscope: %d\ttype: %s\n", level, ' ',
            name.c_str(), scope, type.c_str());
}

void CompoundStmt::output(int level)
{
    fprintf(yyout, "%*cCompoundStmt\n", level, ' ');
    stmt->output(level + 4);
}

void SeqNode::output(int level)
{
    /*
    fprintf(yyout, "%*cSequence\n", level, ' ');
    stmt1->output(level + 4);
    stmt2->output(level + 4);
    */
    stmt1->output(level);
    stmt2->output(level);
}

void DeclStmt::output(int level)
{
    fprintf(yyout, "%*cDeclStmt\n", level, ' ');
    id->output(level + 4);
    if (initval != nullptr)
        initval->output(level + 4);
    if (HaveSibling())
    {
        DeclStmt *sibdeclstmt = dynamic_cast<DeclStmt *>(GetSibling());
        sibdeclstmt->output(level);
    }
}

void IfStmt::output(int level)
{
    fprintf(yyout, "%*cIfStmt\n", level, ' ');
    cond->output(level + 4);
    thenStmt->output(level + 4);
}

void IfElseStmt::output(int level)
{
    fprintf(yyout, "%*cIfElseStmt\n", level, ' ');
    cond->output(level + 4);
    thenStmt->output(level + 4);
    elseStmt->output(level + 4);
}

void ReturnStmt::output(int level)
{
    fprintf(yyout, "%*cReturnStmt\n", level, ' ');
    if (retValue != nullptr)
        retValue->output(level + 4);
}

void AssignStmt::output(int level)
{
    fprintf(yyout, "%*cAssignStmt\n", level, ' ');
    lval->output(level + 4);
    expr->output(level + 4);
}

void FunctionDef::output(int level)
{
    std::string name, type;
    name = se->toStr();
    type = se->getType()->toStr();
    fprintf(yyout, "%*cFunctionDefine function name: %s, type: %s\n", level, ' ',
            name.c_str(), type.c_str());
    if (fparam != nullptr)
        fparam->output(level + 4);
    stmt->output(level + 4);
}

void FuncFParam::output(int level)
{
    fprintf(yyout, "%*cFuncFParam\n", level, ' ');
    id->output(level + 4);
    if (HaveSibling())
    {
        FuncFParam *sibfparam = dynamic_cast<FuncFParam *>(GetSibling());
        sibfparam->output(level);
    }
}

void ExprStmt::output(int level)
{
    fprintf(yyout, "%*cExprStmt\n", level, ' ');
    expr->output(level + 4);
}

void WhileStmt::output(int level)
{
    fprintf(yyout, "%*cWhileStmt\n", level, ' ');
    cond->output(level + 4);
    stmt->output(level + 4);
}

void FunctionCall::output(int level)
{
    std::string name, type;
    name = symbolEntry->toStr();
    type = symbolEntry->getType()->toStr();
    fprintf(yyout, "%*cFunctionCall function name: %s, type: %s\n", level, ' ',
            name.c_str(), type.c_str());
    if (rparam != nullptr)
    {
        rparam->output(level + 4);
        if (rparam->HaveSibling())
        {
            ExprNode *next_rparam = rparam;
            while (next_rparam->GetSibling() != nullptr)
            {
                next_rparam = dynamic_cast<ExprNode *>(next_rparam->GetSibling());
                next_rparam->output(level + 4);
            }
        }
    }
}

void NullStmt::output(int level)
{
    fprintf(yyout, "%*cNullStmt\n", level, ' ');
}