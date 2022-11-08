#ifndef __TYPE_H__
#define __TYPE_H__

#include <sstream>
#include <vector>
#include <string>

class Type
{
private:
    int kind;

protected:
    enum
    {
        INT,
        VOID,
        FUNC
    };

public:
    Type(int kind)
        : kind(kind){};
    virtual ~Type(){};

    bool isInt() const { return kind == INT; };
    bool isVoid() const { return kind == VOID; };
    bool isFunc() const { return kind == FUNC; };

    virtual std::string toStr() = 0;
};

class IntType : public Type
{
private:
    int size;

public:
    IntType(int size)
        : Type(Type::INT), size(size){};
    std::string toStr();
};

class ConstIntType : public IntType
{
public:
    ConstIntType(int size)
        : IntType(size){};
    std::string toStr();
};

class VoidType : public Type
{
public:
    VoidType() : Type(Type::VOID){};
    std::string toStr();
};

class FunctionType : public Type
{
private:
    Type *returnType;
    std::vector<Type *> paramsType;

public:
    FunctionType(Type *returnType, std::vector<Type *> paramsType)
        : Type(Type::FUNC), returnType(returnType), paramsType(paramsType){};
    std::vector<Type *> *GetFparamTypePointer() { return &paramsType; }
    std::string toStr();
};

class TypeSystem
{
private:
    static IntType commonInt;
    static ConstIntType commonConstInt;
    static VoidType commonVoid;

public:
    static Type *intType;
    static Type *constintType;
    static Type *voidType;
};

#endif