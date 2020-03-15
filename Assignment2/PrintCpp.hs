{-# LANGUAGE CPP #-}
#if __GLASGOW_HASKELL__ <= 708
{-# LANGUAGE OverlappingInstances #-}
#endif
{-# LANGUAGE FlexibleInstances #-}
{-# OPTIONS_GHC -fno-warn-incomplete-patterns #-}

-- | Pretty-printer for PrintCpp.
--   Generated by the BNF converter.

module PrintCpp where

import qualified AbsCpp
import Data.Char

-- | The top-level printing method.

printTree :: Print a => a -> String
printTree = render . prt 0

type Doc = [ShowS] -> [ShowS]

doc :: ShowS -> Doc
doc = (:)

render :: Doc -> String
render d = rend 0 (map ($ "") $ d []) "" where
  rend i ss = case ss of
    "["      :ts -> showChar '[' . rend i ts
    "("      :ts -> showChar '(' . rend i ts
    "{"      :ts -> showChar '{' . new (i+1) . rend (i+1) ts
    "}" : ";":ts -> new (i-1) . space "}" . showChar ';' . new (i-1) . rend (i-1) ts
    "}"      :ts -> new (i-1) . showChar '}' . new (i-1) . rend (i-1) ts
    ";"      :ts -> showChar ';' . new i . rend i ts
    t  : ts@(p:_) | closingOrPunctuation p -> showString t . rend i ts
    t        :ts -> space t . rend i ts
    _            -> id
  new i   = showChar '\n' . replicateS (2*i) (showChar ' ') . dropWhile isSpace
  space t = showString t . (\s -> if null s then "" else ' ':s)

  closingOrPunctuation :: String -> Bool
  closingOrPunctuation [c] = c `elem` closerOrPunct
  closingOrPunctuation _   = False

  closerOrPunct :: String
  closerOrPunct = ")],;"

parenth :: Doc -> Doc
parenth ss = doc (showChar '(') . ss . doc (showChar ')')

concatS :: [ShowS] -> ShowS
concatS = foldr (.) id

concatD :: [Doc] -> Doc
concatD = foldr (.) id

replicateS :: Int -> ShowS -> ShowS
replicateS n f = concatS (replicate n f)

-- | The printer class does the job.

class Print a where
  prt :: Int -> a -> Doc
  prtList :: Int -> [a] -> Doc
  prtList i = concatD . map (prt i)

instance {-# OVERLAPPABLE #-} Print a => Print [a] where
  prt = prtList

instance Print Char where
  prt _ s = doc (showChar '\'' . mkEsc '\'' s . showChar '\'')
  prtList _ s = doc (showChar '"' . concatS (map (mkEsc '"') s) . showChar '"')

mkEsc :: Char -> Char -> ShowS
mkEsc q s = case s of
  _ | s == q -> showChar '\\' . showChar s
  '\\'-> showString "\\\\"
  '\n' -> showString "\\n"
  '\t' -> showString "\\t"
  _ -> showChar s

prPrec :: Int -> Int -> Doc -> Doc
prPrec i j = if j < i then parenth else id

instance Print Integer where
  prt _ x = doc (shows x)

instance Print Double where
  prt _ x = doc (shows x)

instance Print AbsCpp.Id where
  prt _ (AbsCpp.Id i) = doc (showString i)
  prtList _ [x] = concatD [prt 0 x]
  prtList _ (x:xs) = concatD [prt 0 x, doc (showString ","), prt 0 xs]

instance Print AbsCpp.Program where
  prt i e = case e of
    AbsCpp.PDefs defs -> prPrec i 0 (concatD [prt 0 defs])

instance Print AbsCpp.Def where
  prt i e = case e of
    AbsCpp.DFunc type_ id args stms -> prPrec i 0 (concatD [prt 0 type_, prt 0 id, doc (showString "("), prt 0 args, doc (showString ")"), doc (showString "{"), prt 0 stms, doc (showString "}")])
    AbsCpp.DDecl type_ ids -> prPrec i 0 (concatD [prt 0 type_, prt 0 ids, doc (showString ";")])
    AbsCpp.DUse type_ -> prPrec i 0 (concatD [doc (showString "using"), prt 0 type_, doc (showString ";")])
  prtList _ [] = concatD []
  prtList _ (x:xs) = concatD [prt 0 x, prt 0 xs]

instance Print [AbsCpp.Def] where
  prt = prtList

instance Print AbsCpp.Arg where
  prt i e = case e of
    AbsCpp.ADecl type_ id -> prPrec i 0 (concatD [prt 0 type_, prt 0 id])
  prtList _ [] = concatD []
  prtList _ [x] = concatD [prt 0 x]
  prtList _ (x:xs) = concatD [prt 0 x, doc (showString ","), prt 0 xs]

instance Print [AbsCpp.Arg] where
  prt = prtList

instance Print AbsCpp.Stm where
  prt i e = case e of
    AbsCpp.SExp exp -> prPrec i 0 (concatD [prt 0 exp, doc (showString ";")])
    AbsCpp.SDecls type_ ids -> prPrec i 0 (concatD [prt 0 type_, prt 0 ids, doc (showString ";")])
    AbsCpp.SInit type_ id exp -> prPrec i 0 (concatD [prt 0 type_, prt 0 id, doc (showString "="), prt 0 exp, doc (showString ";")])
    AbsCpp.SReturn exp -> prPrec i 0 (concatD [doc (showString "return"), prt 0 exp, doc (showString ";")])
    AbsCpp.SReturnVoid -> prPrec i 0 (concatD [doc (showString "return"), doc (showString ";")])
    AbsCpp.SWhile exp stm -> prPrec i 0 (concatD [doc (showString "while"), doc (showString "("), prt 0 exp, doc (showString ")"), prt 0 stm])
    AbsCpp.SBlock stms -> prPrec i 0 (concatD [doc (showString "{"), prt 0 stms, doc (showString "}")])
    AbsCpp.SIf exp stm -> prPrec i 0 (concatD [doc (showString "if"), doc (showString "("), prt 0 exp, doc (showString ")"), prt 0 stm])
    AbsCpp.SIfElse exp stm1 stm2 -> prPrec i 0 (concatD [doc (showString "if"), doc (showString "("), prt 0 exp, doc (showString ")"), prt 0 stm1, doc (showString "else"), prt 0 stm2])
    AbsCpp.SMethod type_ id args stm -> prPrec i 0 (concatD [prt 0 type_, prt 0 id, doc (showString "("), prt 0 args, doc (showString ")"), doc (showString "{"), prt 0 stm, doc (showString "}")])
    AbsCpp.SThrow id exp -> prPrec i 0 (concatD [doc (showString "throw"), prt 0 id, doc (showString "("), prt 0 exp, doc (showString ")"), doc (showString ";")])
  prtList _ [] = concatD []
  prtList _ (x:xs) = concatD [prt 0 x, prt 0 xs]

instance Print [AbsCpp.Stm] where
  prt = prtList

instance Print AbsCpp.Type where
  prt i e = case e of
    AbsCpp.TId id -> prPrec i 5 (concatD [prt 0 id])
    AbsCpp.TIds id1 id2 -> prPrec i 5 (concatD [prt 0 id1, doc (showString "::"), prt 0 id2])
    AbsCpp.TBrac type_ types -> prPrec i 4 (concatD [prt 4 type_, doc (showString "<"), prt 5 types, doc (showString ">")])
    AbsCpp.TNs type_1 type_2 -> prPrec i 4 (concatD [prt 4 type_1, doc (showString "::"), prt 5 type_2])
    AbsCpp.TCons type_ -> prPrec i 3 (concatD [doc (showString "const"), prt 4 type_])
    AbsCpp.TAlias type_ -> prPrec i 3 (concatD [doc (showString "typedef"), prt 4 type_])
    AbsCpp.TAmp type_ -> prPrec i 2 (concatD [prt 3 type_, doc (showString "&")])
  prtList 5 [] = concatD []
  prtList 5 [x] = concatD [prt 5 x]
  prtList 5 (x:xs) = concatD [prt 5 x, doc (showString ","), prt 5 xs]
  prtList _ [] = concatD []
  prtList _ [x] = concatD [prt 0 x]
  prtList _ (x:xs) = concatD [prt 0 x, doc (showString ","), prt 0 xs]

instance Print [AbsCpp.Type] where
  prt = prtList

instance Print AbsCpp.Exp where
  prt i e = case e of
    AbsCpp.ETrue -> prPrec i 19 (concatD [doc (showString "true")])
    AbsCpp.EFalse -> prPrec i 19 (concatD [doc (showString "false")])
    AbsCpp.EInt n -> prPrec i 19 (concatD [prt 0 n])
    AbsCpp.EDouble d -> prPrec i 19 (concatD [prt 0 d])
    AbsCpp.EString str -> prPrec i 19 (concatD [prt 0 str])
    AbsCpp.EId id -> prPrec i 19 (concatD [prt 0 id])
    AbsCpp.EIds id1 id2 -> prPrec i 19 (concatD [prt 0 id1, doc (showString "::"), prt 0 id2])
    AbsCpp.ENs exp1 exp2 -> prPrec i 18 (concatD [prt 18 exp1, doc (showString "::"), prt 19 exp2])
    AbsCpp.EMem exp1 exp2 -> prPrec i 18 (concatD [prt 18 exp1, doc (showString "."), prt 19 exp2])
    AbsCpp.EArray exp1 exp2 -> prPrec i 17 (concatD [prt 18 exp1, doc (showString "["), prt 11 exp2, doc (showString "]")])
    AbsCpp.EPIncr exp -> prPrec i 16 (concatD [prt 17 exp, doc (showString "++")])
    AbsCpp.EPDecr exp -> prPrec i 16 (concatD [prt 17 exp, doc (showString "--")])
    AbsCpp.EIncr exp -> prPrec i 15 (concatD [doc (showString "++"), prt 16 exp])
    AbsCpp.EDecr exp -> prPrec i 15 (concatD [doc (showString "--"), prt 16 exp])
    AbsCpp.EFunc exp exps -> prPrec i 15 (concatD [prt 17 exp, doc (showString "("), prt 5 exps, doc (showString ")")])
    AbsCpp.ENot exp -> prPrec i 13 (concatD [doc (showString "!"), prt 14 exp])
    AbsCpp.ETimes exp1 exp2 -> prPrec i 12 (concatD [prt 12 exp1, doc (showString "*"), prt 13 exp2])
    AbsCpp.EDiv exp1 exp2 -> prPrec i 12 (concatD [prt 12 exp1, doc (showString "/"), prt 13 exp2])
    AbsCpp.EMod exp1 exp2 -> prPrec i 12 (concatD [prt 12 exp1, doc (showString "%"), prt 13 exp2])
    AbsCpp.EPlus exp1 exp2 -> prPrec i 11 (concatD [prt 11 exp1, doc (showString "+"), prt 12 exp2])
    AbsCpp.EMinus exp1 exp2 -> prPrec i 11 (concatD [prt 11 exp1, doc (showString "-"), prt 12 exp2])
    AbsCpp.ELt exp1 exp2 -> prPrec i 9 (concatD [prt 9 exp1, doc (showString "<"), prt 10 exp2])
    AbsCpp.EGt exp1 exp2 -> prPrec i 9 (concatD [prt 9 exp1, doc (showString ">"), prt 10 exp2])
    AbsCpp.ELtEq exp1 exp2 -> prPrec i 9 (concatD [prt 9 exp1, doc (showString "<="), prt 10 exp2])
    AbsCpp.EGtEq exp1 exp2 -> prPrec i 9 (concatD [prt 9 exp1, doc (showString ">="), prt 10 exp2])
    AbsCpp.EEq exp1 exp2 -> prPrec i 8 (concatD [prt 8 exp1, doc (showString "=="), prt 9 exp2])
    AbsCpp.ENEq exp1 exp2 -> prPrec i 8 (concatD [prt 8 exp1, doc (showString "!="), prt 9 exp2])
    AbsCpp.EAnd exp1 exp2 -> prPrec i 7 (concatD [prt 7 exp1, doc (showString "&&"), prt 8 exp2])
    AbsCpp.EOr exp1 exp2 -> prPrec i 6 (concatD [prt 6 exp1, doc (showString "||"), prt 7 exp2])
    AbsCpp.EAss exp1 exp2 -> prPrec i 5 (concatD [prt 6 exp1, doc (showString "="), prt 5 exp2])
    AbsCpp.ECout exp exps -> prPrec i 3 (concatD [prt 3 exp, doc (showString "<<"), prt 4 exps])
    AbsCpp.ECin exp1 exp2 -> prPrec i 2 (concatD [prt 2 exp1, doc (showString ">>"), prt 3 exp2])
    AbsCpp.EIf exp1 exp2 exp3 -> prPrec i 0 (concatD [prt 2 exp1, doc (showString "?"), prt 2 exp2, doc (showString ":"), prt 2 exp3])
    AbsCpp.ETyped exp type_ -> prPrec i 18 (concatD [doc (showString "("), prt 0 exp, doc (showString ":"), prt 0 type_, doc (showString ")")])
  prtList 5 [] = concatD []
  prtList 5 [x] = concatD [prt 5 x]
  prtList 5 (x:xs) = concatD [prt 5 x, doc (showString ","), prt 5 xs]
  prtList 4 [] = concatD []
  prtList 4 (x:xs) = concatD [prt 4 x, prt 4 xs]
  prtList _ [] = concatD []
  prtList _ [x] = concatD [prt 0 x]
  prtList _ (x:xs) = concatD [prt 0 x, doc (showString ","), prt 0 xs]

instance Print [AbsCpp.Exp] where
  prt = prtList

instance Print [AbsCpp.Id] where
  prt = prtList

