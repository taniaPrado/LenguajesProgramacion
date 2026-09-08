{-# OPTIONS_GHC -w #-}
module Grammars where

import Lexer (Token(..))
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6 t7
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,114) ([896,4096,128,0,0,0,0,0,0,0,0,0,65520,63,7,32800,3,49168,1,57352,0,28676,0,14338,0,7169,32768,3584,16384,1792,8192,896,4096,448,2048,224,1024,112,512,56,256,28,128,14,64,0,32,0,16,0,8,0,28676,0,14338,0,1,0,1,32768,0,16384,0,8192,448,2048,0,2048,0,1024,0,512,0,256,0,128,0,64,0,32,0,16,0,8,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,128,0,0,0,0,0,0,0,28672,0,2,0,0,0,1,16384,0,16384,128,0,0,4096,224,1024,112,512,56,256,0,0,0,0,0,0,0,32,0,16,0,8,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","ASA","Args","Binding","Bindings","var","nat","bool","'+'","'-'","'*'","'/'","\"and\"","\"or\"","\"not\"","\"add1\"","\"sub1\"","\"zero?\"","\"expt\"","'<'","'>'","\"<=\"","\">=\"","\"eq\"","\"let\"","\"let*\"","'('","')'","%eof"]
        bit_start = st Prelude.* 31
        bit_end = (st Prelude.+ 1) Prelude.* 31
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..30]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (8) = happyShift action_4
action_0 (9) = happyShift action_2
action_0 (10) = happyShift action_5
action_0 (29) = happyShift action_6
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (9) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (31) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_19

action_5 _ = happyReduce_2

action_6 (11) = happyShift action_7
action_6 (12) = happyShift action_8
action_6 (13) = happyShift action_9
action_6 (14) = happyShift action_10
action_6 (15) = happyShift action_11
action_6 (16) = happyShift action_12
action_6 (17) = happyShift action_13
action_6 (18) = happyShift action_14
action_6 (19) = happyShift action_15
action_6 (20) = happyShift action_16
action_6 (21) = happyShift action_17
action_6 (22) = happyShift action_18
action_6 (23) = happyShift action_19
action_6 (24) = happyShift action_20
action_6 (25) = happyShift action_21
action_6 (26) = happyShift action_22
action_6 (27) = happyShift action_23
action_6 (28) = happyShift action_24
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (8) = happyShift action_4
action_7 (9) = happyShift action_2
action_7 (10) = happyShift action_5
action_7 (29) = happyShift action_6
action_7 (4) = happyGoto action_28
action_7 (5) = happyGoto action_43
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (8) = happyShift action_4
action_8 (9) = happyShift action_2
action_8 (10) = happyShift action_5
action_8 (29) = happyShift action_6
action_8 (4) = happyGoto action_28
action_8 (5) = happyGoto action_42
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (8) = happyShift action_4
action_9 (9) = happyShift action_2
action_9 (10) = happyShift action_5
action_9 (29) = happyShift action_6
action_9 (4) = happyGoto action_28
action_9 (5) = happyGoto action_41
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (8) = happyShift action_4
action_10 (9) = happyShift action_2
action_10 (10) = happyShift action_5
action_10 (29) = happyShift action_6
action_10 (4) = happyGoto action_28
action_10 (5) = happyGoto action_40
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (8) = happyShift action_4
action_11 (9) = happyShift action_2
action_11 (10) = happyShift action_5
action_11 (29) = happyShift action_6
action_11 (4) = happyGoto action_28
action_11 (5) = happyGoto action_39
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (8) = happyShift action_4
action_12 (9) = happyShift action_2
action_12 (10) = happyShift action_5
action_12 (29) = happyShift action_6
action_12 (4) = happyGoto action_28
action_12 (5) = happyGoto action_38
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (8) = happyShift action_4
action_13 (9) = happyShift action_2
action_13 (10) = happyShift action_5
action_13 (29) = happyShift action_6
action_13 (4) = happyGoto action_37
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (8) = happyShift action_4
action_14 (9) = happyShift action_2
action_14 (10) = happyShift action_5
action_14 (29) = happyShift action_6
action_14 (4) = happyGoto action_36
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (8) = happyShift action_4
action_15 (9) = happyShift action_2
action_15 (10) = happyShift action_5
action_15 (29) = happyShift action_6
action_15 (4) = happyGoto action_35
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (8) = happyShift action_4
action_16 (9) = happyShift action_2
action_16 (10) = happyShift action_5
action_16 (29) = happyShift action_6
action_16 (4) = happyGoto action_34
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (8) = happyShift action_4
action_17 (9) = happyShift action_2
action_17 (10) = happyShift action_5
action_17 (29) = happyShift action_6
action_17 (4) = happyGoto action_33
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (8) = happyShift action_4
action_18 (9) = happyShift action_2
action_18 (10) = happyShift action_5
action_18 (29) = happyShift action_6
action_18 (4) = happyGoto action_28
action_18 (5) = happyGoto action_32
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (8) = happyShift action_4
action_19 (9) = happyShift action_2
action_19 (10) = happyShift action_5
action_19 (29) = happyShift action_6
action_19 (4) = happyGoto action_28
action_19 (5) = happyGoto action_31
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (8) = happyShift action_4
action_20 (9) = happyShift action_2
action_20 (10) = happyShift action_5
action_20 (29) = happyShift action_6
action_20 (4) = happyGoto action_28
action_20 (5) = happyGoto action_30
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (8) = happyShift action_4
action_21 (9) = happyShift action_2
action_21 (10) = happyShift action_5
action_21 (29) = happyShift action_6
action_21 (4) = happyGoto action_28
action_21 (5) = happyGoto action_29
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (8) = happyShift action_4
action_22 (9) = happyShift action_2
action_22 (10) = happyShift action_5
action_22 (29) = happyShift action_6
action_22 (4) = happyGoto action_27
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (29) = happyShift action_26
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (29) = happyShift action_25
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (29) = happyShift action_64
action_25 (6) = happyGoto action_62
action_25 (7) = happyGoto action_65
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (29) = happyShift action_64
action_26 (6) = happyGoto action_62
action_26 (7) = happyGoto action_63
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (8) = happyShift action_4
action_27 (9) = happyShift action_2
action_27 (10) = happyShift action_5
action_27 (29) = happyShift action_6
action_27 (4) = happyGoto action_61
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (8) = happyShift action_4
action_28 (9) = happyShift action_2
action_28 (10) = happyShift action_5
action_28 (29) = happyShift action_6
action_28 (4) = happyGoto action_59
action_28 (5) = happyGoto action_60
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (30) = happyShift action_58
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (30) = happyShift action_57
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (30) = happyShift action_56
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (30) = happyShift action_55
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (8) = happyShift action_4
action_33 (9) = happyShift action_2
action_33 (10) = happyShift action_5
action_33 (29) = happyShift action_6
action_33 (4) = happyGoto action_54
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (30) = happyShift action_53
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (30) = happyShift action_52
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (30) = happyShift action_51
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (30) = happyShift action_50
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (30) = happyShift action_49
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (30) = happyShift action_48
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (30) = happyShift action_47
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (30) = happyShift action_46
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (30) = happyShift action_45
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (30) = happyShift action_44
action_43 _ = happyFail (happyExpListPerState 43)

action_44 _ = happyReduce_3

action_45 _ = happyReduce_4

action_46 _ = happyReduce_5

action_47 _ = happyReduce_6

action_48 _ = happyReduce_7

action_49 _ = happyReduce_8

action_50 _ = happyReduce_15

action_51 _ = happyReduce_16

action_52 _ = happyReduce_17

action_53 _ = happyReduce_18

action_54 (30) = happyShift action_71
action_54 _ = happyFail (happyExpListPerState 54)

action_55 _ = happyReduce_9

action_56 _ = happyReduce_10

action_57 _ = happyReduce_11

action_58 _ = happyReduce_12

action_59 (8) = happyShift action_4
action_59 (9) = happyShift action_2
action_59 (10) = happyShift action_5
action_59 (29) = happyShift action_6
action_59 (4) = happyGoto action_59
action_59 (5) = happyGoto action_60
action_59 _ = happyReduce_22

action_60 _ = happyReduce_23

action_61 (30) = happyShift action_70
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (29) = happyShift action_64
action_62 (6) = happyGoto action_62
action_62 (7) = happyGoto action_69
action_62 _ = happyReduce_25

action_63 (30) = happyShift action_68
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (8) = happyShift action_67
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (30) = happyShift action_66
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (8) = happyShift action_4
action_66 (9) = happyShift action_2
action_66 (10) = happyShift action_5
action_66 (29) = happyShift action_6
action_66 (4) = happyGoto action_74
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (8) = happyShift action_4
action_67 (9) = happyShift action_2
action_67 (10) = happyShift action_5
action_67 (29) = happyShift action_6
action_67 (4) = happyGoto action_73
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (8) = happyShift action_4
action_68 (9) = happyShift action_2
action_68 (10) = happyShift action_5
action_68 (29) = happyShift action_6
action_68 (4) = happyGoto action_72
action_68 _ = happyFail (happyExpListPerState 68)

action_69 _ = happyReduce_26

action_70 _ = happyReduce_14

action_71 _ = happyReduce_13

action_72 (30) = happyShift action_77
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (30) = happyShift action_76
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (30) = happyShift action_75
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_21

action_76 _ = happyReduce_24

action_77 _ = happyReduce_20

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyTerminal (TokenNum happy_var_1))
	 =  HappyAbsSyn4
		 (Num happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyTerminal (TokenBool happy_var_1))
	 =  HappyAbsSyn4
		 (Boolean happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happyReduce 4 4 happyReduction_3
happyReduction_3 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Add happy_var_3
	) `HappyStk` happyRest

happyReduce_4 = happyReduce 4 4 happyReduction_4
happyReduction_4 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Sub happy_var_3
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 4 4 happyReduction_5
happyReduction_5 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Mul happy_var_3
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 4 4 happyReduction_6
happyReduction_6 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Div happy_var_3
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 4 4 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (And happy_var_3
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 4 4 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Or happy_var_3
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 4 4 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Lt happy_var_3
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 4 4 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Gt happy_var_3
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 4 4 happyReduction_11
happyReduction_11 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Le happy_var_3
	) `HappyStk` happyRest

happyReduce_12 = happyReduce 4 4 happyReduction_12
happyReduction_12 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Ge happy_var_3
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 5 4 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Expt happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 5 4 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (EqP happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 4 4 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Not happy_var_3
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 4 4 happyReduction_16
happyReduction_16 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Add1 happy_var_3
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 4 4 happyReduction_17
happyReduction_17 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Sub1 happy_var_3
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 4 4 happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (ZeroP happy_var_3
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_1  4 happyReduction_19
happyReduction_19 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn4
		 (Id happy_var_1
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happyReduce 7 4 happyReduction_20
happyReduction_20 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Let happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 7 4 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (LetStar happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_22 = happySpecReduce_2  5 happyReduction_22
happyReduction_22 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1, happy_var_2]
	)
happyReduction_22 _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_2  5 happyReduction_23
happyReduction_23 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1 : happy_var_2
	)
happyReduction_23 _ _  = notHappyAtAll 

happyReduce_24 = happyReduce 4 6 happyReduction_24
happyReduction_24 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	(HappyTerminal (TokenId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 ((happy_var_2, happy_var_3)
	) `HappyStk` happyRest

happyReduce_25 = happySpecReduce_1  7 happyReduction_25
happyReduction_25 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_25 _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_2  7 happyReduction_26
happyReduction_26 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 : happy_var_2
	)
happyReduction_26 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 31 31 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenId happy_dollar_dollar -> cont 8;
	TokenNum happy_dollar_dollar -> cont 9;
	TokenBool happy_dollar_dollar -> cont 10;
	TokenSuma -> cont 11;
	TokenResta -> cont 12;
	TokenMul -> cont 13;
	TokenDiv -> cont 14;
	TokenAnd -> cont 15;
	TokenOr -> cont 16;
	TokenNot -> cont 17;
	TokenAdd1 -> cont 18;
	TokenSub1 -> cont 19;
	TokenZeroP -> cont 20;
	TokenExpt -> cont 21;
	TokenLT -> cont 22;
	TokenGT -> cont 23;
	TokenLE -> cont 24;
	TokenGE -> cont 25;
	TokenEq -> cont 26;
	TokenLet -> cont 27;
	TokenLetStar -> cont 28;
	TokenPA -> cont 29;
	TokenPC -> cont 30;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 31 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parse tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError toks = error ("Parse error: " ++ show toks)

type Binding = (String, ASA)

data ASA
  = Id String
  | Num Int
  | Boolean Bool
  | And [ASA]
  | Or [ASA]
  | Add [ASA]
  | Sub [ASA]
  | Mul [ASA]
  | Div [ASA]
  | Lt [ASA]
  | Gt [ASA]
  | Le [ASA]
  | Ge [ASA]
  | Expt ASA ASA
  | EqP ASA ASA
  | Not ASA
  | Add1 ASA
  | Sub1 ASA
  | ZeroP ASA
  | Let [Binding] ASA
  | LetStar [Binding] ASA
  deriving (Eq, Show)
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
