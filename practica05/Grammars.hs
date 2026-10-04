{-# OPTIONS_GHC -w #-}
module Grammars where

import Lexer (Token(..))
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6 t7 t8 t9
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,108) ([3584,64,4,0,0,0,0,0,0,32768,7167,1792,32,16398,7168,128,56,1,512,0,4,2048,896,16,8192,0,64,4,14336,256,112,8194,0,0,32776,0,0,64,16398,0,256,0,28674,512,0,8,0,0,0,0,0,0,32796,0,0,0,57344,1024,0,32784,0,0,64,2,7168,128,56,28673,512,0,8,4096,0,32,0,3584,64,32796,14336,256,0,57348,1024,0,16,8192,0,64,0,0,128,56,1,1024,0,49160,2561,0,0,8192,0,0,0,1,0,0,57344,1024,448,8,0,0,0,32768,0,256,0,1,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","SASA","Clauses","Params","Arguments","Operands","Bindings","var","nat","bool","'+'","'-'","\"not\"","\"let\"","\"let*\"","\"lambda\"","\"if\"","\"cond\"","\"else\"","\"letrec\"","'('","')'","%eof"]
        bit_start = st Prelude.* 25
        bit_end = (st Prelude.+ 1) Prelude.* 25
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..24]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (10) = happyShift action_2
action_0 (11) = happyShift action_4
action_0 (12) = happyShift action_5
action_0 (23) = happyShift action_6
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (10) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (25) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_2

action_5 _ = happyReduce_3

action_6 (10) = happyShift action_2
action_6 (11) = happyShift action_4
action_6 (12) = happyShift action_5
action_6 (13) = happyShift action_8
action_6 (14) = happyShift action_9
action_6 (15) = happyShift action_10
action_6 (16) = happyShift action_11
action_6 (17) = happyShift action_12
action_6 (18) = happyShift action_13
action_6 (19) = happyShift action_14
action_6 (20) = happyShift action_15
action_6 (22) = happyShift action_16
action_6 (23) = happyShift action_6
action_6 (4) = happyGoto action_7
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (10) = happyShift action_2
action_7 (11) = happyShift action_4
action_7 (12) = happyShift action_5
action_7 (23) = happyShift action_6
action_7 (4) = happyGoto action_27
action_7 (7) = happyGoto action_28
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (10) = happyShift action_2
action_8 (11) = happyShift action_4
action_8 (12) = happyShift action_5
action_8 (23) = happyShift action_6
action_8 (4) = happyGoto action_24
action_8 (8) = happyGoto action_26
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (10) = happyShift action_2
action_9 (11) = happyShift action_4
action_9 (12) = happyShift action_5
action_9 (23) = happyShift action_6
action_9 (4) = happyGoto action_24
action_9 (8) = happyGoto action_25
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (10) = happyShift action_2
action_10 (11) = happyShift action_4
action_10 (12) = happyShift action_5
action_10 (23) = happyShift action_6
action_10 (4) = happyGoto action_23
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (23) = happyShift action_22
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (23) = happyShift action_21
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (23) = happyShift action_20
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (10) = happyShift action_2
action_14 (11) = happyShift action_4
action_14 (12) = happyShift action_5
action_14 (23) = happyShift action_6
action_14 (4) = happyGoto action_19
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (23) = happyShift action_18
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (23) = happyShift action_17
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (10) = happyShift action_43
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (10) = happyShift action_2
action_18 (11) = happyShift action_4
action_18 (12) = happyShift action_5
action_18 (23) = happyShift action_6
action_18 (4) = happyGoto action_42
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (10) = happyShift action_2
action_19 (11) = happyShift action_4
action_19 (12) = happyShift action_5
action_19 (23) = happyShift action_6
action_19 (4) = happyGoto action_41
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (10) = happyShift action_40
action_20 (6) = happyGoto action_39
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (23) = happyShift action_38
action_21 (9) = happyGoto action_37
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (10) = happyShift action_36
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (24) = happyShift action_35
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (10) = happyShift action_2
action_24 (11) = happyShift action_4
action_24 (12) = happyShift action_5
action_24 (23) = happyShift action_6
action_24 (4) = happyGoto action_33
action_24 (8) = happyGoto action_34
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (24) = happyShift action_32
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (24) = happyShift action_31
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (10) = happyShift action_2
action_27 (11) = happyShift action_4
action_27 (12) = happyShift action_5
action_27 (23) = happyShift action_6
action_27 (4) = happyGoto action_27
action_27 (7) = happyGoto action_30
action_27 _ = happyReduce_18

action_28 (24) = happyShift action_29
action_28 _ = happyFail (happyExpListPerState 28)

action_29 _ = happyReduce_10

action_30 _ = happyReduce_19

action_31 _ = happyReduce_4

action_32 _ = happyReduce_5

action_33 (10) = happyShift action_2
action_33 (11) = happyShift action_4
action_33 (12) = happyShift action_5
action_33 (23) = happyShift action_6
action_33 (4) = happyGoto action_33
action_33 (8) = happyGoto action_34
action_33 _ = happyReduce_20

action_34 _ = happyReduce_21

action_35 _ = happyReduce_6

action_36 (10) = happyShift action_2
action_36 (11) = happyShift action_4
action_36 (12) = happyShift action_5
action_36 (23) = happyShift action_6
action_36 (4) = happyGoto action_51
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (24) = happyShift action_50
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (10) = happyShift action_49
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (24) = happyShift action_48
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (10) = happyShift action_40
action_40 (6) = happyGoto action_47
action_40 _ = happyReduce_16

action_41 (10) = happyShift action_2
action_41 (11) = happyShift action_4
action_41 (12) = happyShift action_5
action_41 (23) = happyShift action_6
action_41 (4) = happyGoto action_46
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (10) = happyShift action_2
action_42 (11) = happyShift action_4
action_42 (12) = happyShift action_5
action_42 (23) = happyShift action_6
action_42 (4) = happyGoto action_45
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (10) = happyShift action_2
action_43 (11) = happyShift action_4
action_43 (12) = happyShift action_5
action_43 (23) = happyShift action_6
action_43 (4) = happyGoto action_44
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (24) = happyShift action_58
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (24) = happyShift action_57
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (24) = happyShift action_56
action_46 _ = happyFail (happyExpListPerState 46)

action_47 _ = happyReduce_17

action_48 (10) = happyShift action_2
action_48 (11) = happyShift action_4
action_48 (12) = happyShift action_5
action_48 (23) = happyShift action_6
action_48 (4) = happyGoto action_55
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (10) = happyShift action_2
action_49 (11) = happyShift action_4
action_49 (12) = happyShift action_5
action_49 (23) = happyShift action_6
action_49 (4) = happyGoto action_54
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (10) = happyShift action_2
action_50 (11) = happyShift action_4
action_50 (12) = happyShift action_5
action_50 (23) = happyShift action_6
action_50 (4) = happyGoto action_53
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (24) = happyShift action_52
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (10) = happyShift action_2
action_52 (11) = happyShift action_4
action_52 (12) = happyShift action_5
action_52 (23) = happyShift action_6
action_52 (4) = happyGoto action_65
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (24) = happyShift action_64
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (24) = happyShift action_63
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (24) = happyShift action_62
action_55 _ = happyFail (happyExpListPerState 55)

action_56 _ = happyReduce_11

action_57 (23) = happyShift action_61
action_57 (5) = happyGoto action_60
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (10) = happyShift action_2
action_58 (11) = happyShift action_4
action_58 (12) = happyShift action_5
action_58 (23) = happyShift action_6
action_58 (4) = happyGoto action_59
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (24) = happyShift action_71
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (24) = happyShift action_70
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (10) = happyShift action_2
action_61 (11) = happyShift action_4
action_61 (12) = happyShift action_5
action_61 (21) = happyShift action_69
action_61 (23) = happyShift action_6
action_61 (4) = happyGoto action_68
action_61 _ = happyFail (happyExpListPerState 61)

action_62 _ = happyReduce_9

action_63 (23) = happyShift action_38
action_63 (9) = happyGoto action_67
action_63 _ = happyReduce_22

action_64 _ = happyReduce_8

action_65 (24) = happyShift action_66
action_65 _ = happyFail (happyExpListPerState 65)

action_66 _ = happyReduce_7

action_67 _ = happyReduce_23

action_68 (10) = happyShift action_2
action_68 (11) = happyShift action_4
action_68 (12) = happyShift action_5
action_68 (23) = happyShift action_6
action_68 (4) = happyGoto action_73
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (10) = happyShift action_2
action_69 (11) = happyShift action_4
action_69 (12) = happyShift action_5
action_69 (23) = happyShift action_6
action_69 (4) = happyGoto action_72
action_69 _ = happyFail (happyExpListPerState 69)

action_70 _ = happyReduce_12

action_71 _ = happyReduce_13

action_72 (24) = happyShift action_75
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (24) = happyShift action_74
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (23) = happyShift action_61
action_74 (5) = happyGoto action_76
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_14

action_76 _ = happyReduce_15

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn4
		 (IdS happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyTerminal (TokenNum happy_var_1))
	 =  HappyAbsSyn4
		 (NumS happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  4 happyReduction_3
happyReduction_3 (HappyTerminal (TokenBool happy_var_1))
	 =  HappyAbsSyn4
		 (BooleanS happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happyReduce 4 4 happyReduction_4
happyReduction_4 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (AddS happy_var_3
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 4 4 happyReduction_5
happyReduction_5 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SubS happy_var_3
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 4 4 happyReduction_6
happyReduction_6 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (NotS happy_var_3
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 8 4 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	(HappyTerminal (TokenId happy_var_4)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (LetS happy_var_4 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 7 4 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (LetStarS happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 7 4 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (FunS happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 4 4 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (AppS happy_var_2 happy_var_3
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 6 4 happyReduction_11
happyReduction_11 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (IfS happy_var_3 happy_var_4 happy_var_5
	) `HappyStk` happyRest

happyReduce_12 = happyReduce 8 4 happyReduction_12
happyReduction_12 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (CondS ((happy_var_4, happy_var_5) : fst happy_var_7) (snd happy_var_7)
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 8 4 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	(HappyTerminal (TokenId happy_var_4)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (LetRecS happy_var_4 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 4 5 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (([], happy_var_3)
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 5 5 happyReduction_15
happyReduction_15 ((HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (((happy_var_2, happy_var_3) : (fst happy_var_5), snd happy_var_5)
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_1  6 happyReduction_16
happyReduction_16 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn6
		 ([happy_var_1]
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_2  6 happyReduction_17
happyReduction_17 (HappyAbsSyn6  happy_var_2)
	(HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn6
		 (happy_var_1 : happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  7 happyReduction_18
happyReduction_18 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  7 happyReduction_19
happyReduction_19 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 : happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_2  8 happyReduction_20
happyReduction_20 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn8
		 ([happy_var_1, happy_var_2]
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_2  8 happyReduction_21
happyReduction_21 (HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1 : happy_var_2
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happyReduce 4 9 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	(HappyTerminal (TokenId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 ([(happy_var_2, happy_var_3)]
	) `HappyStk` happyRest

happyReduce_23 = happyReduce 5 9 happyReduction_23
happyReduction_23 ((HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	(HappyTerminal (TokenId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 ((happy_var_2, happy_var_3) : happy_var_5
	) `HappyStk` happyRest

happyNewToken action sts stk [] =
	action 25 25 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenId happy_dollar_dollar -> cont 10;
	TokenNum happy_dollar_dollar -> cont 11;
	TokenBool happy_dollar_dollar -> cont 12;
	TokenSuma -> cont 13;
	TokenResta -> cont 14;
	TokenNot -> cont 15;
	TokenLet -> cont 16;
	TokenLetStar -> cont 17;
	TokenLambda -> cont 18;
	TokenIf -> cont 19;
	TokenCond -> cont 20;
	TokenElse -> cont 21;
	TokenLetRec -> cont 22;
	TokenPA -> cont 23;
	TokenPC -> cont 24;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 25 tk tks = happyError' (tks, explist)
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
parseError tokens = error ("Parse error: " ++ show tokens)

type Nombre = String

data SASA
  = IdS Nombre
  | NumS Int
  | BooleanS Bool
  | AddS [SASA]
  | SubS [SASA]
  | NotS SASA
  | LetS Nombre SASA SASA
  | LetStarS [(Nombre, SASA)] SASA
  | FunS [Nombre] SASA
  | AppS SASA [SASA]
  | IfS SASA SASA SASA
  | CondS [(SASA, SASA)] SASA
  | LetRecS Nombre SASA SASA
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
