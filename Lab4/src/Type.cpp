#include "Type.hpp"

IntType TypeSystem::commonInt = IntType(4);
ConstIntType TypeSystem::commonConstInt = ConstIntType(4);
VoidType TypeSystem::commonVoid = VoidType();

Type *TypeSystem::intType = &commonInt;
Type *TypeSystem::constintType = &commonConstInt;
Type *TypeSystem::voidType = &commonVoid;

std::string IntType::toStr()
{
    return "int";
}

std::string ConstIntType::toStr()
{
    return "const int";
}

std::string VoidType::toStr()
{
    return "void";
}

std::string FunctionType::toStr()
{
    std::ostringstream buffer;
    buffer << returnType->toStr() << "(";
    for (uint32_t i = 0; i < paramsType.size(); i++)
    {
        buffer << paramsType[i]->toStr();
        if (i != (paramsType.size() - 1))
        {
            buffer << ", ";
        }
    }
    buffer << ")";
    return buffer.str();
}
