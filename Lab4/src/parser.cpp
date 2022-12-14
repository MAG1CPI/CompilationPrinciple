/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1

/* "%code top" blocks.  */
#line 1 "src/parser.y"

    #include <iostream>
    #include <assert.h>
    #include "parser.h"
    extern Ast ast;
    int yylex();
    int yyerror( char const * );

    Type* decl_type;
    const bool current_symtab = true;
    const bool all_parent_symtab = false;
    std::vector<Type*>* func_fparam_type;

#line 82 "src/parser.cpp"




# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

#include "parser.h"
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_ID = 3,                         /* ID  */
  YYSYMBOL_INT_NUM = 4,                    /* INT_NUM  */
  YYSYMBOL_IF = 5,                         /* IF  */
  YYSYMBOL_ELSE = 6,                       /* ELSE  */
  YYSYMBOL_WHILE = 7,                      /* WHILE  */
  YYSYMBOL_CONST = 8,                      /* CONST  */
  YYSYMBOL_INT = 9,                        /* INT  */
  YYSYMBOL_VOID = 10,                      /* VOID  */
  YYSYMBOL_L_PAREN = 11,                   /* L_PAREN  */
  YYSYMBOL_R_PAREN = 12,                   /* R_PAREN  */
  YYSYMBOL_L_BRACE = 13,                   /* L_BRACE  */
  YYSYMBOL_R_BRACE = 14,                   /* R_BRACE  */
  YYSYMBOL_L_SQUARE = 15,                  /* L_SQUARE  */
  YYSYMBOL_R_SQUARE = 16,                  /* R_SQUARE  */
  YYSYMBOL_SEMI = 17,                      /* SEMI  */
  YYSYMBOL_COMMA = 18,                     /* COMMA  */
  YYSYMBOL_ADD = 19,                       /* ADD  */
  YYSYMBOL_SUB = 20,                       /* SUB  */
  YYSYMBOL_MUL = 21,                       /* MUL  */
  YYSYMBOL_DIV = 22,                       /* DIV  */
  YYSYMBOL_MOD = 23,                       /* MOD  */
  YYSYMBOL_OR = 24,                        /* OR  */
  YYSYMBOL_AND = 25,                       /* AND  */
  YYSYMBOL_LESS = 26,                      /* LESS  */
  YYSYMBOL_LESSEQ = 27,                    /* LESSEQ  */
  YYSYMBOL_GREATER = 28,                   /* GREATER  */
  YYSYMBOL_GREATEREQ = 29,                 /* GREATEREQ  */
  YYSYMBOL_ASSIGN = 30,                    /* ASSIGN  */
  YYSYMBOL_EQ = 31,                        /* EQ  */
  YYSYMBOL_NOTEQ = 32,                     /* NOTEQ  */
  YYSYMBOL_NOT = 33,                       /* NOT  */
  YYSYMBOL_RETURN = 34,                    /* RETURN  */
  YYSYMBOL_THEN = 35,                      /* THEN  */
  YYSYMBOL_YYACCEPT = 36,                  /* $accept  */
  YYSYMBOL_Program = 37,                   /* Program  */
  YYSYMBOL_Stmts = 38,                     /* Stmts  */
  YYSYMBOL_Stmt = 39,                      /* Stmt  */
  YYSYMBOL_AssignStmt = 40,                /* AssignStmt  */
  YYSYMBOL_ExprStmt = 41,                  /* ExprStmt  */
  YYSYMBOL_BlockStmt = 42,                 /* BlockStmt  */
  YYSYMBOL_43_1 = 43,                      /* $@1  */
  YYSYMBOL_IfStmt = 44,                    /* IfStmt  */
  YYSYMBOL_WhileStmt = 45,                 /* WhileStmt  */
  YYSYMBOL_ReturnStmt = 46,                /* ReturnStmt  */
  YYSYMBOL_NullStmt = 47,                  /* NullStmt  */
  YYSYMBOL_Exp = 48,                       /* Exp  */
  YYSYMBOL_Cond = 49,                      /* Cond  */
  YYSYMBOL_LVal = 50,                      /* LVal  */
  YYSYMBOL_PrimaryExp = 51,                /* PrimaryExp  */
  YYSYMBOL_UnaryExp = 52,                  /* UnaryExp  */
  YYSYMBOL_FuncRParams = 53,               /* FuncRParams  */
  YYSYMBOL_MulExp = 54,                    /* MulExp  */
  YYSYMBOL_AddExp = 55,                    /* AddExp  */
  YYSYMBOL_RelExp = 56,                    /* RelExp  */
  YYSYMBOL_EqExp = 57,                     /* EqExp  */
  YYSYMBOL_LAndExp = 58,                   /* LAndExp  */
  YYSYMBOL_LOrExp = 59,                    /* LOrExp  */
  YYSYMBOL_ConstExp = 60,                  /* ConstExp  */
  YYSYMBOL_Type = 61,                      /* Type  */
  YYSYMBOL_DeclStmt = 62,                  /* DeclStmt  */
  YYSYMBOL_VarDecl = 63,                   /* VarDecl  */
  YYSYMBOL_VarList = 64,                   /* VarList  */
  YYSYMBOL_VarDef = 65,                    /* VarDef  */
  YYSYMBOL_InitVal = 66,                   /* InitVal  */
  YYSYMBOL_ConstDecl = 67,                 /* ConstDecl  */
  YYSYMBOL_ConstList = 68,                 /* ConstList  */
  YYSYMBOL_ConstDef = 69,                  /* ConstDef  */
  YYSYMBOL_ConstInitVal = 70,              /* ConstInitVal  */
  YYSYMBOL_FuncDef = 71,                   /* FuncDef  */
  YYSYMBOL_72_2 = 72,                      /* $@2  */
  YYSYMBOL_FuncFParams = 73,               /* FuncFParams  */
  YYSYMBOL_FuncFParam = 74                 /* FuncFParam  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_uint8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  49
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   137

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  36
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  39
/* YYNRULES -- Number of rules.  */
#define YYNRULES  79
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  134

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   290


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,    49,    49,    52,    53,    56,    57,    58,    59,    60,
      61,    62,    63,    64,    67,    70,    73,    73,    80,    81,
      84,    86,    87,    90,    91,    94,    97,   100,   112,   113,
     114,   118,   119,   128,   130,   132,   136,   137,   149,   151,
     152,   154,   156,   160,   161,   163,   167,   168,   170,   172,
     174,   178,   179,   181,   185,   186,   190,   191,   195,   199,
     201,   205,   206,   209,   212,   213,   227,   239,   253,   256,
     259,   260,   274,   290,   325,   325,   341,   342,   354,   357
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "ID", "INT_NUM", "IF",
  "ELSE", "WHILE", "CONST", "INT", "VOID", "L_PAREN", "R_PAREN", "L_BRACE",
  "R_BRACE", "L_SQUARE", "R_SQUARE", "SEMI", "COMMA", "ADD", "SUB", "MUL",
  "DIV", "MOD", "OR", "AND", "LESS", "LESSEQ", "GREATER", "GREATEREQ",
  "ASSIGN", "EQ", "NOTEQ", "NOT", "RETURN", "THEN", "$accept", "Program",
  "Stmts", "Stmt", "AssignStmt", "ExprStmt", "BlockStmt", "$@1", "IfStmt",
  "WhileStmt", "ReturnStmt", "NullStmt", "Exp", "Cond", "LVal",
  "PrimaryExp", "UnaryExp", "FuncRParams", "MulExp", "AddExp", "RelExp",
  "EqExp", "LAndExp", "LOrExp", "ConstExp", "Type", "DeclStmt", "VarDecl",
  "VarList", "VarDef", "InitVal", "ConstDecl", "ConstList", "ConstDef",
  "ConstInitVal", "FuncDef", "$@2", "FuncFParams", "FuncFParam", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-28)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-75)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int8 yypact[] =
{
      95,    21,   -28,    42,    59,    31,   -28,   -28,    76,    12,
     -28,    76,    76,    76,    74,    82,    95,   -28,   -28,   -28,
     -28,   -28,   -28,   -28,   -28,    66,    56,   -28,   -28,    15,
      25,    39,   -28,   -28,   -28,   -28,    76,    76,    76,    86,
      78,   -28,   -28,    95,   -28,   -28,   -28,   -28,    75,   -28,
     -28,   -28,    76,    76,    76,    76,    76,    76,     9,    32,
     -28,   -28,    -3,    98,    25,   -22,    20,    91,    87,   105,
      88,    40,   -28,   -28,    14,   -28,   102,   -28,   -28,   -28,
      15,    15,    76,   109,   -28,   118,   -28,    76,    95,    76,
      76,    76,    76,    76,    76,    76,    76,    95,    76,   -28,
      86,   -28,   -28,   -28,   -28,    31,    92,   -28,   -28,   117,
      25,    25,    25,    25,   -22,   -22,    20,    91,   -28,    25,
     -28,   -28,   -28,   121,    17,   -28,    95,   -28,   114,    31,
     -28,   -28,   -28,   -28
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       0,    27,    30,     0,     0,     0,    59,    60,     0,    16,
      23,     0,     0,     0,     0,     0,     2,     3,     5,     6,
       7,     8,     9,    10,    13,     0,    28,    31,    39,    43,
      25,     0,    11,    61,    62,    12,    38,     0,     0,     0,
       0,    28,    24,     0,    33,    34,    35,    22,     0,     1,
       4,    15,     0,     0,     0,     0,     0,     0,    66,     0,
      64,    36,     0,     0,    46,    51,    54,    56,    26,     0,
       0,     0,    70,    29,     0,    21,     0,    40,    41,    42,
      44,    45,     0,     0,    63,     0,    32,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    69,
       0,    17,    14,    68,    67,    78,    66,    65,    37,    18,
      47,    49,    48,    50,    52,    53,    55,    57,    20,    58,
      73,    72,    71,     0,     0,    76,     0,    79,     0,     0,
      19,    16,    75,    77
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -28,   -28,    89,   -13,   -28,   -28,     2,   -28,   -28,   -28,
     -28,   -28,    -6,    93,     0,   -28,     1,   -28,     3,   -27,
     -21,    38,    41,   -28,   -28,    -4,   -28,   -28,   -28,    49,
     -28,   -28,   -28,    35,   -28,   -28,   -28,   -28,     7
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
       0,    15,    16,    17,    18,    19,    20,    43,    21,    22,
      23,    24,    25,    63,    41,    27,    28,    62,    29,    30,
      65,    66,    67,    68,   120,    31,    32,    33,    59,    60,
     104,    34,    71,    72,   121,    35,    83,   124,   125
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      26,    39,    40,    50,    89,    90,    91,    92,    48,    86,
      64,    64,    44,    45,    46,    87,    26,     1,     2,     3,
     -74,     4,     5,     6,     7,     8,    42,     9,   101,   128,
      61,    10,    36,    11,    12,   129,    53,    54,    55,    82,
       6,     7,    58,    26,    56,    57,    76,    13,    14,    84,
      85,    93,    94,    37,    77,    78,    79,    99,   100,    80,
      81,    50,   110,   111,   112,   113,    64,    64,    64,    64,
      38,   119,   114,   115,    26,   109,   103,     1,     2,     1,
       2,   108,    49,    51,   118,     8,    52,     8,    26,    70,
      73,    47,    75,    11,    12,    11,    12,    26,     1,     2,
       3,   123,     4,     5,     6,     7,     8,    13,     9,    13,
      88,    96,    10,   130,    11,    12,    95,    97,    98,   102,
     105,   106,    82,   126,   127,   123,    26,   131,    13,    14,
     132,    69,    74,   116,   107,   122,   133,   117
};

static const yytype_uint8 yycheck[] =
{
       0,     5,     8,    16,    26,    27,    28,    29,    14,    12,
      37,    38,    11,    12,    13,    18,    16,     3,     4,     5,
      11,     7,     8,     9,    10,    11,    14,    13,    14,    12,
      36,    17,    11,    19,    20,    18,    21,    22,    23,    30,
       9,    10,     3,    43,    19,    20,    52,    33,    34,    17,
      18,    31,    32,    11,    53,    54,    55,    17,    18,    56,
      57,    74,    89,    90,    91,    92,    93,    94,    95,    96,
      11,    98,    93,    94,    74,    88,    82,     3,     4,     3,
       4,    87,     0,    17,    97,    11,    30,    11,    88,     3,
      12,    17,    17,    19,    20,    19,    20,    97,     3,     4,
       5,   105,     7,     8,     9,    10,    11,    33,    13,    33,
      12,    24,    17,   126,    19,    20,    25,    12,    30,    17,
      11,     3,    30,     6,     3,   129,   126,    13,    33,    34,
     128,    38,    43,    95,    85,   100,   129,    96
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,     3,     4,     5,     7,     8,     9,    10,    11,    13,
      17,    19,    20,    33,    34,    37,    38,    39,    40,    41,
      42,    44,    45,    46,    47,    48,    50,    51,    52,    54,
      55,    61,    62,    63,    67,    71,    11,    11,    11,    61,
      48,    50,    14,    43,    52,    52,    52,    17,    48,     0,
      39,    17,    30,    21,    22,    23,    19,    20,     3,    64,
      65,    48,    53,    49,    55,    56,    57,    58,    59,    49,
       3,    68,    69,    12,    38,    17,    48,    52,    52,    52,
      54,    54,    30,    72,    17,    18,    12,    18,    12,    26,
      27,    28,    29,    31,    32,    25,    24,    12,    30,    17,
      18,    14,    17,    48,    66,    11,     3,    65,    48,    39,
      55,    55,    55,    55,    56,    56,    57,    58,    39,    55,
      60,    70,    69,    61,    73,    74,     6,     3,    12,    18,
      39,    13,    42,    74
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    36,    37,    38,    38,    39,    39,    39,    39,    39,
      39,    39,    39,    39,    40,    41,    43,    42,    44,    44,
      45,    46,    46,    47,    47,    48,    49,    50,    51,    51,
      51,    52,    52,    52,    52,    52,    53,    53,    53,    54,
      54,    54,    54,    55,    55,    55,    56,    56,    56,    56,
      56,    57,    57,    57,    58,    58,    59,    59,    60,    61,
      61,    62,    62,    63,    64,    64,    65,    65,    66,    67,
      68,    68,    69,    70,    72,    71,    73,    73,    73,    74
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     4,     2,     0,     4,     5,     7,
       5,     3,     2,     1,     2,     1,     1,     1,     1,     3,
       1,     1,     4,     2,     2,     2,     1,     3,     0,     1,
       3,     3,     3,     1,     3,     3,     1,     3,     3,     3,
       3,     1,     3,     3,     1,     3,     1,     3,     1,     1,
       1,     1,     1,     3,     1,     3,     1,     3,     1,     4,
       1,     3,     3,     1,     0,     7,     1,     3,     0,     2
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2: /* Program: Stmts  */
#line 49 "src/parser.y"
                                                {   ast.setRoot((yyvsp[0].stmttype)); }
#line 1237 "src/parser.cpp"
    break;

  case 3: /* Stmts: Stmt  */
#line 52 "src/parser.y"
                                                {   (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1243 "src/parser.cpp"
    break;

  case 4: /* Stmts: Stmts Stmt  */
#line 53 "src/parser.y"
                                                {   (yyval.stmttype) = new SeqNode((yyvsp[-1].stmttype), (yyvsp[0].stmttype)); }
#line 1249 "src/parser.cpp"
    break;

  case 5: /* Stmt: AssignStmt  */
#line 56 "src/parser.y"
                                                {   (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1255 "src/parser.cpp"
    break;

  case 6: /* Stmt: ExprStmt  */
#line 57 "src/parser.y"
                                                {   (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1261 "src/parser.cpp"
    break;

  case 7: /* Stmt: BlockStmt  */
#line 58 "src/parser.y"
                                                {   (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1267 "src/parser.cpp"
    break;

  case 8: /* Stmt: IfStmt  */
#line 59 "src/parser.y"
                                                {   (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1273 "src/parser.cpp"
    break;

  case 9: /* Stmt: WhileStmt  */
#line 60 "src/parser.y"
                                                {   (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1279 "src/parser.cpp"
    break;

  case 10: /* Stmt: ReturnStmt  */
#line 61 "src/parser.y"
                                                {   (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1285 "src/parser.cpp"
    break;

  case 11: /* Stmt: DeclStmt  */
#line 62 "src/parser.y"
                                                {   (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1291 "src/parser.cpp"
    break;

  case 12: /* Stmt: FuncDef  */
#line 63 "src/parser.y"
                                                {   (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1297 "src/parser.cpp"
    break;

  case 13: /* Stmt: NullStmt  */
#line 64 "src/parser.y"
                                                {   (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1303 "src/parser.cpp"
    break;

  case 14: /* AssignStmt: LVal ASSIGN Exp SEMI  */
#line 67 "src/parser.y"
                                                {   (yyval.stmttype) = new AssignStmt((yyvsp[-3].exprtype), (yyvsp[-1].exprtype)); }
#line 1309 "src/parser.cpp"
    break;

  case 15: /* ExprStmt: Exp SEMI  */
#line 70 "src/parser.y"
                                                {   (yyval.stmttype) = new ExprStmt((yyvsp[-1].exprtype)); }
#line 1315 "src/parser.cpp"
    break;

  case 16: /* $@1: %empty  */
#line 73 "src/parser.y"
                                                {   identifiers = new SymbolTable(identifiers); }
#line 1321 "src/parser.cpp"
    break;

  case 17: /* BlockStmt: L_BRACE $@1 Stmts R_BRACE  */
#line 74 "src/parser.y"
                                                {   (yyval.stmttype) = new CompoundStmt((yyvsp[-1].stmttype));
                                                    SymbolTable *top = identifiers;
                                                    identifiers = identifiers->getPrev();
                                                    delete top; }
#line 1330 "src/parser.cpp"
    break;

  case 18: /* IfStmt: IF L_PAREN Cond R_PAREN Stmt  */
#line 80 "src/parser.y"
                                                {   (yyval.stmttype) = new IfStmt((yyvsp[-2].exprtype), (yyvsp[0].stmttype)); }
#line 1336 "src/parser.cpp"
    break;

  case 19: /* IfStmt: IF L_PAREN Cond R_PAREN Stmt ELSE Stmt  */
#line 81 "src/parser.y"
                                                {   (yyval.stmttype) = new IfElseStmt((yyvsp[-4].exprtype), (yyvsp[-2].stmttype), (yyvsp[0].stmttype)); }
#line 1342 "src/parser.cpp"
    break;

  case 20: /* WhileStmt: WHILE L_PAREN Cond R_PAREN Stmt  */
#line 84 "src/parser.y"
                                                {   (yyval.stmttype) = new WhileStmt((yyvsp[-2].exprtype), (yyvsp[0].stmttype)); }
#line 1348 "src/parser.cpp"
    break;

  case 21: /* ReturnStmt: RETURN Exp SEMI  */
#line 86 "src/parser.y"
                                                {   (yyval.stmttype) = new ReturnStmt((yyvsp[-1].exprtype)); }
#line 1354 "src/parser.cpp"
    break;

  case 22: /* ReturnStmt: RETURN SEMI  */
#line 87 "src/parser.y"
                                                {   (yyval.stmttype) = new ReturnStmt(); }
#line 1360 "src/parser.cpp"
    break;

  case 23: /* NullStmt: SEMI  */
#line 90 "src/parser.y"
                                                {   (yyval.stmttype) = new NullStmt(); }
#line 1366 "src/parser.cpp"
    break;

  case 24: /* NullStmt: L_BRACE R_BRACE  */
#line 91 "src/parser.y"
                                                {   (yyval.stmttype) = new NullStmt(); }
#line 1372 "src/parser.cpp"
    break;

  case 25: /* Exp: AddExp  */
#line 94 "src/parser.y"
                                                {   (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1378 "src/parser.cpp"
    break;

  case 26: /* Cond: LOrExp  */
#line 97 "src/parser.y"
                                                {   (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1384 "src/parser.cpp"
    break;

  case 27: /* LVal: ID  */
#line 100 "src/parser.y"
                                                {   SymbolEntry *se;
                                                    se = identifiers->lookup((yyvsp[0].strtype), all_parent_symtab);
                                                    if(se == nullptr)
                                                    {
                                                        fprintf(stderr, "identifier \"%s\" is undefined\n", (char*)(yyvsp[0].strtype));
                                                        delete [](char*)(yyvsp[0].strtype);
                                                        assert(se != nullptr);
                                                    }
                                                    (yyval.exprtype) = new Id(se);
                                                    delete [](yyvsp[0].strtype); }
#line 1399 "src/parser.cpp"
    break;

  case 28: /* PrimaryExp: LVal  */
#line 112 "src/parser.y"
                                                {   (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1405 "src/parser.cpp"
    break;

  case 29: /* PrimaryExp: L_PAREN Exp R_PAREN  */
#line 113 "src/parser.y"
                                                {   (yyval.exprtype) = (yyvsp[-1].exprtype); }
#line 1411 "src/parser.cpp"
    break;

  case 30: /* PrimaryExp: INT_NUM  */
#line 114 "src/parser.y"
                                                {   SymbolEntry *se = new ConstantSymbolEntry(TypeSystem::intType, (yyvsp[0].itype));
                                                    (yyval.exprtype) = new Constant(se); }
#line 1418 "src/parser.cpp"
    break;

  case 31: /* UnaryExp: PrimaryExp  */
#line 118 "src/parser.y"
                                                {   (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1424 "src/parser.cpp"
    break;

  case 32: /* UnaryExp: ID L_PAREN FuncRParams R_PAREN  */
#line 119 "src/parser.y"
                                                {   SymbolEntry *se;
                                                    se = identifiers->lookup((yyvsp[-3].strtype), all_parent_symtab);
                                                    if(se == nullptr)
                                                    {
                                                        fprintf(stderr, "function \"%s\" is undefined\n", (char*)(yyvsp[-3].strtype));
                                                        delete [](char*)(yyvsp[-3].strtype);
                                                        assert(se != nullptr);
                                                    }
                                                    (yyval.exprtype) = new FunctionCall(se, (yyvsp[-1].exprtype)); }
#line 1438 "src/parser.cpp"
    break;

  case 33: /* UnaryExp: ADD UnaryExp  */
#line 128 "src/parser.y"
                                                {   SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
                                                    (yyval.exprtype) = new UnaryExpr(se, UnaryExpr::ADD, (yyvsp[0].exprtype)); }
#line 1445 "src/parser.cpp"
    break;

  case 34: /* UnaryExp: SUB UnaryExp  */
#line 130 "src/parser.y"
                                                {   SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
                                                    (yyval.exprtype) = new UnaryExpr(se, UnaryExpr::SUB, (yyvsp[0].exprtype)); }
#line 1452 "src/parser.cpp"
    break;

  case 35: /* UnaryExp: NOT UnaryExp  */
#line 132 "src/parser.y"
                                                {   SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
                                                    (yyval.exprtype) = new UnaryExpr(se, UnaryExpr::NOT, (yyvsp[0].exprtype)); }
#line 1459 "src/parser.cpp"
    break;

  case 36: /* FuncRParams: Exp  */
#line 136 "src/parser.y"
                                                {   (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1465 "src/parser.cpp"
    break;

  case 37: /* FuncRParams: FuncRParams COMMA Exp  */
#line 137 "src/parser.y"
                                                {   if((yyvsp[-2].exprtype)->HaveSibling())
                                                    {
                                                        ExprNode *next_rparam = dynamic_cast<ExprNode *>((yyvsp[-2].exprtype)->GetSibling());
                                                        while (next_rparam->HaveSibling())
                                                        {
                                                            next_rparam = dynamic_cast<ExprNode *>(next_rparam->GetSibling());
                                                        }
                                                        next_rparam->SetSibling((yyvsp[0].exprtype));
                                                    }
                                                    else
                                                        (yyvsp[-2].exprtype)->SetSibling((yyvsp[0].exprtype));
                                                    (yyval.exprtype) = (yyvsp[-2].exprtype); }
#line 1482 "src/parser.cpp"
    break;

  case 38: /* FuncRParams: %empty  */
#line 149 "src/parser.y"
                                                {   (yyval.exprtype) = nullptr; }
#line 1488 "src/parser.cpp"
    break;

  case 39: /* MulExp: UnaryExp  */
#line 151 "src/parser.y"
                                                {   (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1494 "src/parser.cpp"
    break;

  case 40: /* MulExp: MulExp MUL UnaryExp  */
#line 152 "src/parser.y"
                                                {   SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
                                                    (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::MUL, (yyvsp[-2].exprtype), (yyvsp[0].exprtype)); }
#line 1501 "src/parser.cpp"
    break;

  case 41: /* MulExp: MulExp DIV UnaryExp  */
#line 154 "src/parser.y"
                                                {   SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
                                                    (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::DIV, (yyvsp[-2].exprtype), (yyvsp[0].exprtype)); }
#line 1508 "src/parser.cpp"
    break;

  case 42: /* MulExp: MulExp MOD UnaryExp  */
#line 156 "src/parser.y"
                                                {   SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
                                                    (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::MOD, (yyvsp[-2].exprtype), (yyvsp[0].exprtype)); }
#line 1515 "src/parser.cpp"
    break;

  case 43: /* AddExp: MulExp  */
#line 160 "src/parser.y"
             {(yyval.exprtype) = (yyvsp[0].exprtype);}
#line 1521 "src/parser.cpp"
    break;

  case 44: /* AddExp: AddExp ADD MulExp  */
#line 161 "src/parser.y"
                                                {   SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
                                                    (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::ADD, (yyvsp[-2].exprtype), (yyvsp[0].exprtype)); }
#line 1528 "src/parser.cpp"
    break;

  case 45: /* AddExp: AddExp SUB MulExp  */
#line 163 "src/parser.y"
                                                {   SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
                                                    (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::SUB, (yyvsp[-2].exprtype), (yyvsp[0].exprtype)); }
#line 1535 "src/parser.cpp"
    break;

  case 46: /* RelExp: AddExp  */
#line 167 "src/parser.y"
                                                {   (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1541 "src/parser.cpp"
    break;

  case 47: /* RelExp: RelExp LESS AddExp  */
#line 168 "src/parser.y"
                                                {   SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
                                                    (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::LESS, (yyvsp[-2].exprtype), (yyvsp[0].exprtype)); }
#line 1548 "src/parser.cpp"
    break;

  case 48: /* RelExp: RelExp GREATER AddExp  */
#line 170 "src/parser.y"
                                                {   SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
                                                    (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::GREATER, (yyvsp[-2].exprtype), (yyvsp[0].exprtype)); }
#line 1555 "src/parser.cpp"
    break;

  case 49: /* RelExp: RelExp LESSEQ AddExp  */
#line 172 "src/parser.y"
                                                {   SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
                                                    (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::LESSEQ, (yyvsp[-2].exprtype), (yyvsp[0].exprtype)); }
#line 1562 "src/parser.cpp"
    break;

  case 50: /* RelExp: RelExp GREATEREQ AddExp  */
#line 174 "src/parser.y"
                                                {   SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
                                                    (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::GREATEREQ, (yyvsp[-2].exprtype), (yyvsp[0].exprtype)); }
#line 1569 "src/parser.cpp"
    break;

  case 51: /* EqExp: RelExp  */
#line 178 "src/parser.y"
                                                {   (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1575 "src/parser.cpp"
    break;

  case 52: /* EqExp: EqExp EQ RelExp  */
#line 179 "src/parser.y"
                                                {   SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
                                                    (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::EQ, (yyvsp[-2].exprtype), (yyvsp[0].exprtype)); }
#line 1582 "src/parser.cpp"
    break;

  case 53: /* EqExp: EqExp NOTEQ RelExp  */
#line 181 "src/parser.y"
                                                {   SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
                                                    (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::NOTEQ, (yyvsp[-2].exprtype), (yyvsp[0].exprtype)); }
#line 1589 "src/parser.cpp"
    break;

  case 54: /* LAndExp: EqExp  */
#line 185 "src/parser.y"
            { (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1595 "src/parser.cpp"
    break;

  case 55: /* LAndExp: LAndExp AND EqExp  */
#line 186 "src/parser.y"
                                                {   SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
                                                    (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::AND, (yyvsp[-2].exprtype), (yyvsp[0].exprtype)); }
#line 1602 "src/parser.cpp"
    break;

  case 56: /* LOrExp: LAndExp  */
#line 190 "src/parser.y"
                                                {   (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1608 "src/parser.cpp"
    break;

  case 57: /* LOrExp: LOrExp OR LAndExp  */
#line 191 "src/parser.y"
                                                {   SymbolEntry *se = new TemporarySymbolEntry(TypeSystem::intType, SymbolTable::getLabel());
                                                    (yyval.exprtype) = new BinaryExpr(se, BinaryExpr::OR, (yyvsp[-2].exprtype), (yyvsp[0].exprtype)); }
#line 1615 "src/parser.cpp"
    break;

  case 58: /* ConstExp: AddExp  */
#line 195 "src/parser.y"
                                                {   (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1621 "src/parser.cpp"
    break;

  case 59: /* Type: INT  */
#line 199 "src/parser.y"
                                                {   (yyval.type) = TypeSystem::intType;
                                                    decl_type = TypeSystem::intType; }
#line 1628 "src/parser.cpp"
    break;

  case 60: /* Type: VOID  */
#line 201 "src/parser.y"
                                                {   (yyval.type) = TypeSystem::voidType;
                                                    decl_type = TypeSystem::voidType; }
#line 1635 "src/parser.cpp"
    break;

  case 61: /* DeclStmt: VarDecl  */
#line 205 "src/parser.y"
                                                {   (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1641 "src/parser.cpp"
    break;

  case 62: /* DeclStmt: ConstDecl  */
#line 206 "src/parser.y"
                                                {   (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1647 "src/parser.cpp"
    break;

  case 63: /* VarDecl: Type VarList SEMI  */
#line 209 "src/parser.y"
                                                {   (yyval.stmttype) = (yyvsp[-1].stmttype); }
#line 1653 "src/parser.cpp"
    break;

  case 64: /* VarList: VarDef  */
#line 212 "src/parser.y"
                                                {   (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1659 "src/parser.cpp"
    break;

  case 65: /* VarList: VarList COMMA VarDef  */
#line 213 "src/parser.y"
                                                {   if((yyvsp[-2].stmttype)->HaveSibling())
                                                    {
                                                        StmtNode *next_vardef = dynamic_cast<StmtNode *>((yyvsp[-2].stmttype)->GetSibling());
                                                        while (next_vardef->HaveSibling())
                                                        {
                                                            next_vardef = dynamic_cast<StmtNode *>(next_vardef->GetSibling());
                                                        }
                                                        next_vardef->SetSibling((yyvsp[0].stmttype));
                                                    }
                                                    else
                                                        (yyvsp[-2].stmttype)->SetSibling((yyvsp[0].stmttype));
                                                    (yyval.stmttype) = (yyvsp[-2].stmttype); }
#line 1676 "src/parser.cpp"
    break;

  case 66: /* VarDef: ID  */
#line 227 "src/parser.y"
                                                {   SymbolEntry *se;
                                                    se = identifiers->lookup((yyvsp[0].strtype), current_symtab);
                                                    if(se != nullptr)
                                                    {
                                                        fprintf(stderr, "identifier \"%s\" duplicate defined\n", (char*)(yyvsp[0].strtype));
                                                        delete [](char*)(yyvsp[0].strtype);
                                                        assert(se == nullptr);
                                                    }
                                                    se = new IdentifierSymbolEntry(decl_type, (yyvsp[0].strtype), identifiers->getLevel());
                                                    identifiers->install((yyvsp[0].strtype), se);
                                                    (yyval.stmttype) = new DeclStmt(new Id(se));
                                                    delete [](yyvsp[0].strtype); }
#line 1693 "src/parser.cpp"
    break;

  case 67: /* VarDef: ID ASSIGN InitVal  */
#line 239 "src/parser.y"
                                                {   SymbolEntry *se;
                                                    se = identifiers->lookup((yyvsp[-2].strtype), current_symtab);
                                                    if(se != nullptr)
                                                    {
                                                        fprintf(stderr, "identifier \"%s\" duplicate defined\n", (char*)(yyvsp[-2].strtype));
                                                        delete [](char*)(yyvsp[-2].strtype);
                                                        assert(se == nullptr);
                                                    }
                                                    se = new IdentifierSymbolEntry(decl_type, (yyvsp[-2].strtype), identifiers->getLevel());
                                                    identifiers->install((yyvsp[-2].strtype), se);
                                                    (yyval.stmttype) = new DeclStmt(new Id(se), (yyvsp[0].exprtype));
                                                    delete [](yyvsp[-2].strtype); }
#line 1710 "src/parser.cpp"
    break;

  case 68: /* InitVal: Exp  */
#line 253 "src/parser.y"
                                                {   (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1716 "src/parser.cpp"
    break;

  case 69: /* ConstDecl: CONST Type ConstList SEMI  */
#line 256 "src/parser.y"
                                                {   (yyval.stmttype) = (yyvsp[-1].stmttype); }
#line 1722 "src/parser.cpp"
    break;

  case 70: /* ConstList: ConstDef  */
#line 259 "src/parser.y"
                                                {   (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1728 "src/parser.cpp"
    break;

  case 71: /* ConstList: ConstList COMMA ConstDef  */
#line 260 "src/parser.y"
                                                {   if((yyvsp[-2].stmttype)->HaveSibling())
                                                    {
                                                        StmtNode *next_vardef = dynamic_cast<StmtNode *>((yyvsp[-2].stmttype)->GetSibling());
                                                        while (next_vardef->HaveSibling())
                                                        {
                                                            next_vardef = dynamic_cast<StmtNode *>(next_vardef->GetSibling());
                                                        }
                                                        next_vardef->SetSibling((yyvsp[0].stmttype));
                                                    }
                                                    else
                                                        (yyvsp[-2].stmttype)->SetSibling((yyvsp[0].stmttype));
                                                    (yyval.stmttype) = (yyvsp[-2].stmttype); }
#line 1745 "src/parser.cpp"
    break;

  case 72: /* ConstDef: ID ASSIGN ConstInitVal  */
#line 274 "src/parser.y"
                                                {   SymbolEntry *se;
                                                    se = identifiers->lookup((yyvsp[-2].strtype), current_symtab);
                                                    if(se != nullptr)
                                                    {
                                                        fprintf(stderr, "identifier \"%s\" duplicate defined\n", (char*)(yyvsp[-2].strtype));
                                                        delete [](char*)(yyvsp[-2].strtype);
                                                        assert(se == nullptr);
                                                    }
                                                    if (decl_type == TypeSystem::intType)
                                                        decl_type = TypeSystem::constintType;
                                                    se = new IdentifierSymbolEntry(decl_type, (yyvsp[-2].strtype), identifiers->getLevel());
                                                    identifiers->install((yyvsp[-2].strtype), se);
                                                    (yyval.stmttype) = new DeclStmt(new Id(se), (yyvsp[0].exprtype));
                                                    delete [](yyvsp[-2].strtype); }
#line 1764 "src/parser.cpp"
    break;

  case 73: /* ConstInitVal: ConstExp  */
#line 290 "src/parser.y"
                                                {   (yyval.exprtype) = (yyvsp[0].exprtype); }
#line 1770 "src/parser.cpp"
    break;

  case 74: /* $@2: %empty  */
#line 325 "src/parser.y"
                                                {   Type *funcType;
                                                    funcType = new FunctionType((yyvsp[-1].type), {});
                                                    func_fparam_type = dynamic_cast<FunctionType *>(funcType)->GetFparamTypePointer();
                                                    SymbolEntry *se = new IdentifierSymbolEntry(funcType, (yyvsp[0].strtype), identifiers->getLevel());
                                                    identifiers->install((yyvsp[0].strtype), se);
                                                    identifiers = new SymbolTable(identifiers); }
#line 1781 "src/parser.cpp"
    break;

  case 75: /* FuncDef: Type ID $@2 L_PAREN FuncFParams R_PAREN BlockStmt  */
#line 331 "src/parser.y"
                                                {   SymbolEntry *se;
                                                    se = identifiers->lookup((yyvsp[-5].strtype), all_parent_symtab);
                                                    assert(se != nullptr);
                                                    (yyval.stmttype) = new FunctionDef(se, (yyvsp[-2].stmttype), (yyvsp[0].stmttype));
                                                    SymbolTable *top = identifiers;
                                                    identifiers = identifiers->getPrev();
                                                    delete top;
                                                    delete [](yyvsp[-5].strtype); }
#line 1794 "src/parser.cpp"
    break;

  case 76: /* FuncFParams: FuncFParam  */
#line 341 "src/parser.y"
                                                {   (yyval.stmttype) = (yyvsp[0].stmttype); }
#line 1800 "src/parser.cpp"
    break;

  case 77: /* FuncFParams: FuncFParams COMMA FuncFParam  */
#line 342 "src/parser.y"
                                                {   if((yyvsp[-2].stmttype)->HaveSibling())
                                                    {
                                                        StmtNode *next_fparam = dynamic_cast<StmtNode *>((yyvsp[-2].stmttype)->GetSibling());
                                                        while (next_fparam->HaveSibling())
                                                        {
                                                            next_fparam = dynamic_cast<StmtNode *>(next_fparam->GetSibling());
                                                        }
                                                        next_fparam->SetSibling((yyvsp[0].stmttype));
                                                    }
                                                    else
                                                        (yyvsp[-2].stmttype)->SetSibling((yyvsp[0].stmttype));
                                                    (yyval.stmttype) = (yyvsp[-2].stmttype); }
#line 1817 "src/parser.cpp"
    break;

  case 78: /* FuncFParams: %empty  */
#line 354 "src/parser.y"
                                                {   (yyval.stmttype) = nullptr; }
#line 1823 "src/parser.cpp"
    break;

  case 79: /* FuncFParam: Type ID  */
#line 357 "src/parser.y"
                                                {   SymbolEntry *se;
                                                    se = new IdentifierSymbolEntry((yyvsp[-1].type), (yyvsp[0].strtype), identifiers->getLevel());
                                                    identifiers->install((yyvsp[0].strtype), se);
                                                    (yyval.stmttype) = new FuncFParam(new Id(se));
                                                    func_fparam_type->push_back((yyvsp[-1].type));
                                                    delete [](yyvsp[0].strtype); }
#line 1834 "src/parser.cpp"
    break;


#line 1838 "src/parser.cpp"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 364 "src/parser.y"


int yyerror(char const* message)
{
    std::cerr<<message<<std::endl;
    return -1;
}
