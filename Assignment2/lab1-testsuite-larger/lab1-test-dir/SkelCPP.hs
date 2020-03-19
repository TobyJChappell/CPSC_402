module SkelCPP where

-- Haskell module generated by the BNF converter

import AbsCPP
import ErrM
type Result = Err String

failure :: Show a => a -> Result
failure x = Bad $ "Undefined case: " ++ show x

transId :: Id -> Result
transId x = case x of
  Id string -> failure x
transProgram :: Program -> Result
transProgram x = case x of
  PDefs defs -> failure x
transDef :: Def -> Result
transDef x = case x of
  DFunc type_ id args stms -> failure x
  DFInline type_ id args stms -> failure x
  DDecl decl -> failure x
  DUse qconst -> failure x
  DTemp type_ id args -> failure x
  DTInline type_ id args -> failure x
  DMain type_ args stms -> failure x
  DAlias type_ id -> failure x
  DInit init -> failure x
  DStruct id decls -> failure x
transArg :: Arg -> Result
transArg x = case x of
  ADecl type_ id -> failure x
  ADecl2 type_ ids -> failure x
transStm :: Stm -> Result
transStm x = case x of
  SExp exp -> failure x
  SDecl decl -> failure x
  SInit init -> failure x
  SReturn exp -> failure x
  SReturnVoid -> failure x
  SWhile exp stm -> failure x
  SFor stm1 exp1 exp2 stm2 -> failure x
  SDo stm exp -> failure x
  SBlock stms -> failure x
  SIf exp stm -> failure x
  SIfElse exp stm1 stm2 -> failure x
  SMethod type_ id args stm -> failure x
  SAlias type_ -> failure x
  SStruct id decls -> failure x
transDecl :: Decl -> Result
transDecl x = case x of
  DDef type_ ids -> failure x
transInit :: Init -> Result
transInit x = case x of
  IDef type_ id exp -> failure x
transType :: Type -> Result
transType x = case x of
  TInt -> failure x
  TBool -> failure x
  TVoid -> failure x
  TDouble -> failure x
  TQConst qconst -> failure x
  TCons type_ -> failure x
  TAmp type_ -> failure x
transQConst :: QConst -> Result
transQConst x = case x of
  QDef names -> failure x
transName :: Name -> Result
transName x = case x of
  NId id -> failure x
  NBrac id types -> failure x
transExp :: Exp -> Result
transExp x = case x of
  ETrue -> failure x
  EFalse -> failure x
  EInt integer -> failure x
  EDouble double -> failure x
  EString strings -> failure x
  EChar char -> failure x
  EQConst qconst -> failure x
  EArray exp1 exp2 -> failure x
  EFunc exp exps -> failure x
  EDot exp1 exp2 -> failure x
  EPIncr exp -> failure x
  EPDecr exp -> failure x
  EDeref exp -> failure x
  EArrow exp1 exp2 -> failure x
  EIncr exp -> failure x
  EDecr exp -> failure x
  ENot exp -> failure x
  ETimes exp1 exp2 -> failure x
  EDiv exp1 exp2 -> failure x
  EMod exp1 exp2 -> failure x
  EPlus exp1 exp2 -> failure x
  EMinus exp1 exp2 -> failure x
  ECout exp exps -> failure x
  ECin exp1 exp2 -> failure x
  ELt exp1 exp2 -> failure x
  EGt exp1 exp2 -> failure x
  ELtEq exp1 exp2 -> failure x
  EGtEq exp1 exp2 -> failure x
  EEq exp1 exp2 -> failure x
  ENEq exp1 exp2 -> failure x
  EAnd exp1 exp2 -> failure x
  EOr exp1 exp2 -> failure x
  EAss exp1 exp2 -> failure x
  EAssA exp1 exp2 -> failure x
  EAssM exp1 exp2 -> failure x
  EIf exp1 exp2 exp3 -> failure x
  EThrow exp -> failure x
  ETyped exp type_ -> failure x

