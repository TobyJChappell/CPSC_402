-- This Happy file was machine-generated by the BNF converter
{
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module ParCpp where
import AbsCpp
import LexCpp
import ErrM

}

%name pProgram Program
%name pDef Def
%name pListDef ListDef
%name pArg Arg
%name pListArg ListArg
%name pStm Stm
%name pListStm ListStm
%name pExp15 Exp15
%name pExp14 Exp14
%name pExp13 Exp13
%name pExp12 Exp12
%name pExp11 Exp11
%name pExp9 Exp9
%name pExp8 Exp8
%name pExp4 Exp4
%name pExp3 Exp3
%name pExp2 Exp2
%name pExp Exp
%name pExp1 Exp1
%name pExp5 Exp5
%name pExp6 Exp6
%name pExp7 Exp7
%name pExp10 Exp10
%name pListExp ListExp
%name pType Type
%name pListId ListId
-- no lexer declaration
%monad { Err } { thenM } { returnM }
%tokentype {Token}
%token
  '!=' { PT _ (TS _ 1) }
  '&&' { PT _ (TS _ 2) }
  '(' { PT _ (TS _ 3) }
  ')' { PT _ (TS _ 4) }
  '*' { PT _ (TS _ 5) }
  '+' { PT _ (TS _ 6) }
  '++' { PT _ (TS _ 7) }
  ',' { PT _ (TS _ 8) }
  '-' { PT _ (TS _ 9) }
  '--' { PT _ (TS _ 10) }
  '/' { PT _ (TS _ 11) }
  '::' { PT _ (TS _ 12) }
  ';' { PT _ (TS _ 13) }
  '<' { PT _ (TS _ 14) }
  '<<' { PT _ (TS _ 15) }
  '<=' { PT _ (TS _ 16) }
  '=' { PT _ (TS _ 17) }
  '==' { PT _ (TS _ 18) }
  '>' { PT _ (TS _ 19) }
  '>=' { PT _ (TS _ 20) }
  '>>' { PT _ (TS _ 21) }
  'bool' { PT _ (TS _ 22) }
  'double' { PT _ (TS _ 23) }
  'else' { PT _ (TS _ 24) }
  'false' { PT _ (TS _ 25) }
  'if' { PT _ (TS _ 26) }
  'int' { PT _ (TS _ 27) }
  'return' { PT _ (TS _ 28) }
  'string' { PT _ (TS _ 29) }
  'true' { PT _ (TS _ 30) }
  'void' { PT _ (TS _ 31) }
  'while' { PT _ (TS _ 32) }
  '{' { PT _ (TS _ 33) }
  '||' { PT _ (TS _ 34) }
  '}' { PT _ (TS _ 35) }
  L_integ  { PT _ (TI $$) }
  L_doubl  { PT _ (TD $$) }
  L_quoted { PT _ (TL $$) }
  L_Id { PT _ (T_Id $$) }

%%

Integer :: { Integer }
Integer  : L_integ  { (read ( $1)) :: Integer }

Double  :: { Double }
Double   : L_doubl  { (read ( $1)) :: Double }

String  :: { String }
String   : L_quoted {  $1 }

Id :: { Id}
Id  : L_Id { Id ($1)}

Program :: { Program }
Program : ListDef { AbsCpp.PDefs (reverse $1) }
Def :: { Def }
Def : Type Id '(' ListArg ')' '{' ListStm '}' { AbsCpp.DFun $1 $2 $4 (reverse $7) }
ListDef :: { [Def] }
ListDef : {- empty -} { [] } | ListDef Def { flip (:) $1 $2 }
Arg :: { Arg }
Arg : Type Id { AbsCpp.ADecl $1 $2 }
ListArg :: { [Arg] }
ListArg : {- empty -} { [] }
        | Arg { (:[]) $1 }
        | Arg ',' ListArg { (:) $1 $3 }
Stm :: { Stm }
Stm : Exp ';' { AbsCpp.SExp $1 }
    | Id '::' Type ListId ';' { AbsCpp.SDecls $1 $3 $4 }
    | Type Id '=' Exp ';' { AbsCpp.SInit $1 $2 $4 }
    | 'return' Exp ';' { AbsCpp.SReturn $2 }
    | 'return' ';' { AbsCpp.SReturnVoid }
    | 'while' '(' Exp ')' Stm { AbsCpp.SWhile $3 $5 }
    | '{' ListStm '}' { AbsCpp.SBlock (reverse $2) }
    | 'if' '(' Exp ')' Stm 'else' Stm { AbsCpp.SIfElse $3 $5 $7 }
ListStm :: { [Stm] }
ListStm : {- empty -} { [] } | ListStm Stm { flip (:) $1 $2 }
Exp15 :: { Exp }
Exp15 : 'true' { AbsCpp.ETrue }
      | 'false' { AbsCpp.EFalse }
      | Integer { AbsCpp.EInt $1 }
      | Double { AbsCpp.EDouble $1 }
      | String { AbsCpp.EString $1 }
      | Id { AbsCpp.EId $1 }
      | Id '::' Id { AbsCpp.ENs $1 $3 }
      | Id '(' ListExp ')' { AbsCpp.EApp $1 $3 }
      | '(' Exp ')' { $2 }
Exp14 :: { Exp }
Exp14 : Exp14 '<<' Exp15 { AbsCpp.ECout $1 $3 }
      | Exp15 '++' { AbsCpp.EPIncr $1 }
      | Exp15 '--' { AbsCpp.EPDecr $1 }
      | Exp15 { $1 }
Exp13 :: { Exp }
Exp13 : Exp13 '>>' Exp14 { AbsCpp.ECin $1 $3 }
      | '++' Exp14 { AbsCpp.EIncr $2 }
      | '--' Exp14 { AbsCpp.EDecr $2 }
      | Exp14 { $1 }
Exp12 :: { Exp }
Exp12 : Exp12 '*' Exp13 { AbsCpp.ETimes $1 $3 }
      | Exp12 '/' Exp13 { AbsCpp.EDiv $1 $3 }
      | Exp13 { $1 }
Exp11 :: { Exp }
Exp11 : Exp11 '+' Exp12 { AbsCpp.EPlus $1 $3 }
      | Exp11 '-' Exp12 { AbsCpp.EMinus $1 $3 }
      | Exp12 { $1 }
Exp9 :: { Exp }
Exp9 : Exp9 '<' Exp10 { AbsCpp.ELt $1 $3 }
     | Exp9 '>' Exp10 { AbsCpp.EGt $1 $3 }
     | Exp9 '<=' Exp10 { AbsCpp.ELtEq $1 $3 }
     | Exp9 '>=' Exp10 { AbsCpp.EGtEq $1 $3 }
     | Exp10 { $1 }
Exp8 :: { Exp }
Exp8 : Exp8 '==' Exp9 { AbsCpp.EEq $1 $3 }
     | Exp8 '!=' Exp9 { AbsCpp.ENEq $1 $3 }
     | Exp9 { $1 }
Exp4 :: { Exp }
Exp4 : Exp4 '&&' Exp5 { AbsCpp.EAnd $1 $3 } | Exp5 { $1 }
Exp3 :: { Exp }
Exp3 : Exp3 '||' Exp4 { AbsCpp.EOr $1 $3 } | Exp4 { $1 }
Exp2 :: { Exp }
Exp2 : Exp3 '=' Exp2 { AbsCpp.EAss $1 $3 } | Exp3 { $1 }
Exp :: { Exp }
Exp : Exp1 { $1 }
Exp1 :: { Exp }
Exp1 : Exp2 { $1 }
Exp5 :: { Exp }
Exp5 : Exp6 { $1 }
Exp6 :: { Exp }
Exp6 : Exp7 { $1 }
Exp7 :: { Exp }
Exp7 : Exp8 { $1 }
Exp10 :: { Exp }
Exp10 : Exp11 { $1 }
ListExp :: { [Exp] }
ListExp : {- empty -} { [] }
        | Exp { (:[]) $1 }
        | Exp ',' ListExp { (:) $1 $3 }
Type :: { Type }
Type : 'bool' { AbsCpp.Type_bool }
     | 'int' { AbsCpp.Type_int }
     | 'double' { AbsCpp.Type_double }
     | 'void' { AbsCpp.Type_void }
     | 'string' { AbsCpp.Type_string }
ListId :: { [Id] }
ListId : Id { (:[]) $1 } | Id ',' ListId { (:) $1 $3 }
{

returnM :: a -> Err a
returnM = return

thenM :: Err a -> (a -> Err b) -> Err b
thenM = (>>=)

happyError :: [Token] -> Err a
happyError ts =
  Bad $ "syntax error at " ++ tokenPos ts ++
  case ts of
    []      -> []
    [Err _] -> " due to lexer error"
    t:_     -> " before `" ++ id(prToken t) ++ "'"

myLexer = tokens
}

