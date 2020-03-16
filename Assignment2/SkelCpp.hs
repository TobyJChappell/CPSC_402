module SkelCpp where

-- Haskell module generated by the BNF converter

import AbsCpp
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
  DDecl type_ ids -> failure x
  DUse type_ -> failure x
  DStruct type_ id types -> failure x
  DMain type_ args stms -> failure x
transArg :: Arg -> Result
transArg x = case x of
  ADecl type_ id -> failure x
transStm :: Stm -> Result
transStm x = case x of
  SExp exp -> failure x
  SDecls type_ ids -> failure x
  SInit type_ id exp -> failure x
  SReturn exp -> failure x
  SReturnVoid -> failure x
  SWhile exp stm -> failure x
  SFor stm1 exp1 exp2 stm2 -> failure x
  SDo stm exp -> failure x
  SBlock stms -> failure x
  SIf exp stm -> failure x
  SIfElse exp stm1 stm2 -> failure x
  SMethod type_ id args stm -> failure x
transType :: Type -> Result
transType x = case x of
  TId id -> failure x
  TIds id1 id2 -> failure x
  TNs type_1 type_2 -> failure x
  TBrac type_ types -> failure x
  TCons type_ -> failure x
  TAlias type_ -> failure x
  TAmp type_ -> failure x
transExp :: Exp -> Result
transExp x = case x of
  ETrue -> failure x
  EFalse -> failure x
  EInt integer -> failure x
  EDouble double -> failure x
  EString string -> failure x
  EChar char -> failure x
  EId id -> failure x
  EIds id1 id2 -> failure x
  ENs exp1 exp2 -> failure x
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

