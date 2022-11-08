#ifndef __AST_H__
#define __AST_H__

#include <fstream>
#include "SymbolTable.hpp"
#include "Type.hpp"

extern FILE *yyout;

enum AstType
{
    // Root
    kProgram,
    // Body-Stmt
    kStmt,
    kSeqStmt,
    KDeclStmt,
    kAssignStmt,
    kCompoundStmt,
    kIfStmt,
    kIfElseStmt,
    kWhileStmt,
    kReturnStmt,
    // Body-Expr with AstVal.op
    kExpr,
    kUnaryExpr,
    kBinaryExpr,
    // Leaf with AstVal.Symbol
    kConstant,
    kIdent,
};
enum OpType
{
    kAssign,

    kAdd,
    kSub,
    kMul,
    kDiv,
    kMod,

    kOr,
    KAnd,

    kLess,
    kLessEq,
    kGreater,
    kGreaterEq,
    kEq,
    kNotEq,

    kNot,
};

union AstVal
{
    SymbolEntry *Symbol;
    OpType op;
    int val;
};

struct AstNode
{
    static int counter;

    int seq;

    AstType type;
    AstVal val;

    AstNode *child;
    AstNode *sibling;

    AstNode()
        : seq(counter++), child(nullptr), sibling(nullptr) {}
    AstVal Val() const;
    void output(int level) const;
};

class Ast
{
private:
    AstNode *root;

public:
    Ast(AstNode *root = nullptr)
        : root(root) {}
    void setRoot(AstNode *ast_root);
    void output();
};

#endif
