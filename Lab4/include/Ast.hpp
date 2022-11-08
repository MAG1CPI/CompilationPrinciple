#ifndef __AST_H__
#define __AST_H__

#include <fstream>
#include <string>

#include "SymbolTable.hpp"

class Node
{
private:
    static int counter;
    int seq;
    Node *sibling;

public:
    Node()
        : seq(counter++), sibling(nullptr) {}

    bool HaveSibling() const { return sibling != nullptr; }
    int getSeq() const { return seq; }
    Node *GetSibling() const { return sibling; }

    void SetSibling(Node *sibling_node);
    virtual void output(int level) = 0;
};

class ExprNode : public Node
{
protected:
    SymbolEntry *symbolEntry;

public:
    ExprNode(SymbolEntry *symbolEntry) : symbolEntry(symbolEntry){};
};

class UnaryExpr : public ExprNode
{
private:
    int op;
    ExprNode *expr;

public:
    enum
    {
        ADD,
        SUB,
        NOT
    };
    UnaryExpr(SymbolEntry *se, int op, ExprNode *expr) : ExprNode(se), op(op), expr(expr){};
    void output(int level);
};

class BinaryExpr : public ExprNode
{
private:
    int op;
    ExprNode *expr1, *expr2;

public:
    enum
    {
        ADD,
        SUB,
        MUL,
        DIV,
        MOD,
        OR,
        AND,
        LESS,
        LESSEQ,
        GREATER,
        GREATEREQ,
        EQ,
        NOTEQ
    };
    BinaryExpr(SymbolEntry *se, int op, ExprNode *expr1, ExprNode *expr2) : ExprNode(se), op(op), expr1(expr1), expr2(expr2){};
    void output(int level);
};

class Constant : public ExprNode
{
public:
    Constant(SymbolEntry *se) : ExprNode(se){};
    void output(int level);
};

class Id : public ExprNode
{
public:
    Id(SymbolEntry *se) : ExprNode(se){};
    void output(int level);
};

class StmtNode : public Node
{
};

class CompoundStmt : public StmtNode
{
private:
    StmtNode *stmt;

public:
    CompoundStmt(StmtNode *stmt) : stmt(stmt){};
    void output(int level);
};

class SeqNode : public StmtNode
{
private:
    StmtNode *stmt1, *stmt2;

public:
    SeqNode(StmtNode *stmt1, StmtNode *stmt2) : stmt1(stmt1), stmt2(stmt2){};
    void output(int level);
};

class DeclStmt : public StmtNode
{
private:
    Id *id;
    ExprNode *initval;

public:
    DeclStmt(Id *id, ExprNode *initval) : id(id), initval(initval){};
    DeclStmt(Id *id) : id(id), initval(nullptr){};
    void output(int level);
};

class IfStmt : public StmtNode
{
private:
    ExprNode *cond;
    StmtNode *thenStmt;

public:
    IfStmt(ExprNode *cond, StmtNode *thenStmt) : cond(cond), thenStmt(thenStmt){};
    void output(int level);
};

class IfElseStmt : public StmtNode
{
private:
    ExprNode *cond;
    StmtNode *thenStmt;
    StmtNode *elseStmt;

public:
    IfElseStmt(ExprNode *cond, StmtNode *thenStmt, StmtNode *elseStmt) : cond(cond), thenStmt(thenStmt), elseStmt(elseStmt){};
    void output(int level);
};

class ReturnStmt : public StmtNode
{
private:
    ExprNode *retValue;

public:
    ReturnStmt(ExprNode *retValue) : retValue(retValue){};
    ReturnStmt() : retValue(nullptr){};
    void output(int level);
};

class AssignStmt : public StmtNode
{
private:
    ExprNode *lval;
    ExprNode *expr;

public:
    AssignStmt(ExprNode *lval, ExprNode *expr) : lval(lval), expr(expr){};
    void output(int level);
};

class FunctionDef : public StmtNode
{
private:
    SymbolEntry *se;
    StmtNode *fparam;
    StmtNode *stmt;

public:
    FunctionDef(SymbolEntry *se, StmtNode *fparam, StmtNode *stmt) : se(se), fparam(fparam), stmt(stmt){};
    FunctionDef(SymbolEntry *se, StmtNode *stmt) : se(se), fparam(nullptr), stmt(stmt){};
    void output(int level);
};

class FuncFParam : public StmtNode
{
private:
    Id *id;

public:
    FuncFParam(Id *id) : id(id){};
    void output(int level);
};

class ExprStmt : public StmtNode
{
private:
    ExprNode *expr;

public:
    ExprStmt(ExprNode *expr) : expr(expr){};
    void output(int level);
};

class WhileStmt : public StmtNode
{
private:
    ExprNode *cond;
    StmtNode *stmt;

public:
    WhileStmt(ExprNode *cond, StmtNode *stmt) : cond(cond), stmt(stmt){};
    void output(int level);
};

// TODO
class FunctionCall : public ExprNode
{
private:
    ExprNode *rparam;

public:
    FunctionCall(SymbolEntry *se, ExprNode *rparam) : ExprNode(se), rparam(rparam){};
    FunctionCall(SymbolEntry *se) : ExprNode(se), rparam(nullptr){};
    void output(int level);
};

class NullStmt : public StmtNode
{
public:
    NullStmt(){};
    void output(int level);
};

class Ast
{
private:
    Node *root;

public:
    Ast() { root = nullptr; }
    void setRoot(Node *n) { root = n; }
    void output();
};

#endif
