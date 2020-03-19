-- Haskell data types for the abstract syntax.
-- Generated by the BNF converter.

module AbsCPP where

newtype Id = Id String
  deriving (Eq, Ord, Show, Read)

data Program = PDefs [Def]
  deriving (Eq, Ord, Show, Read)

data Def
    = DFunc Type Id [Arg] [Stm]
    | DFInline Type Id [Arg] [Stm]
    | DDecl Decl
    | DUse QConst
    | DTemp Type Id [Type]
    | DTInline Type Id [Type]
    | DMain Type [Arg] [Stm]
    | DAlias Type Id
    | DInit Init
  deriving (Eq, Ord, Show, Read)

data Arg = ADecl Type Id
  deriving (Eq, Ord, Show, Read)

data Stm
    = SExp Exp
    | SDecl Decl
    | SInit Init
    | SReturn Exp
    | SReturnVoid
    | SWhile Exp Stm
    | SFor Stm Exp Exp Stm
    | SDo Stm Exp
    | SBlock [Stm]
    | SIf Exp Stm
    | SIfElse Exp Stm Stm
    | SMethod Type Id [Arg] Stm
    | SAlias Type
  deriving (Eq, Ord, Show, Read)

data Decl = DDef Type [Id]
  deriving (Eq, Ord, Show, Read)

data Init = IDef Type Id Exp
  deriving (Eq, Ord, Show, Read)

data Type
    = TInt
    | TBool
    | TVoid
    | TChar
    | TDouble
    | TQConst QConst
    | TCons Type
    | TAmp Type
  deriving (Eq, Ord, Show, Read)

data QConst = QDef [Name]
  deriving (Eq, Ord, Show, Read)

data Name = NId Id | NBrac Id [Type]
  deriving (Eq, Ord, Show, Read)

data Exp
    = ETrue
    | EFalse
    | EInt Integer
    | EDouble Double
    | EString String
    | EChar Char
    | EQConst QConst
    | EArray Exp Exp
    | EFunc Exp [Exp]
    | EDot Exp Exp
    | EPIncr Exp
    | EPDecr Exp
    | EDeref Exp
    | EArrow Exp Exp
    | EIncr Exp
    | EDecr Exp
    | ENot Exp
    | ETimes Exp Exp
    | EDiv Exp Exp
    | EMod Exp Exp
    | EPlus Exp Exp
    | EMinus Exp Exp
    | ECout Exp [Exp]
    | ECin Exp Exp
    | ELt Exp Exp
    | EGt Exp Exp
    | ELtEq Exp Exp
    | EGtEq Exp Exp
    | EEq Exp Exp
    | ENEq Exp Exp
    | EAnd Exp Exp
    | EOr Exp Exp
    | EAss Exp Exp
    | EAssA Exp Exp
    | EAssM Exp Exp
    | EIf Exp Exp Exp
    | EThrow Exp
    | ETyped Exp Type
  deriving (Eq, Ord, Show, Read)

