{-# OPTIONS_GHC -w #-}
module Grammars where

import Lexer (Token(..))
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6 t7 t8
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,72) ([1792,4098,0,0,0,0,0,0,1023,8304,1792,28674,32,519,8192,0,2,32,1,8192,256,0,64,519,16384,0,28676,32,1024,0,0,0,0,0,8304,0,0,0,519,16384,256,0,64,1,0,1792,28674,32,519,16384,1792,2,64,1024,16384,0,0,32,0,16384,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","SASA","Params","Arguments","Operands","Bindings","var","nat","bool","'+'","'-'","\"not\"","\"let\"","\"let*\"","\"lambda\"","'('","')'","%eof"]
        bit_start = st Prelude.* 20
        bit_end = (st Prelude.+ 1) Prelude.* 20
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..19]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (9) = happyShift action_2
action_0 (10) = happyShift action_4
action_0 (11) = happyShift action_5
action_0 (18) = happyShift action_6
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (9) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (20) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_2

action_5 _ = happyReduce_3

action_6 (9) = happyShift action_2
action_6 (10) = happyShift action_4
action_6 (11) = happyShift action_5
action_6 (12) = happyShift action_8
action_6 (13) = happyShift action_9
action_6 (14) = happyShift action_10
action_6 (15) = happyShift action_11
action_6 (16) = happyShift action_12
action_6 (17) = happyShift action_13
action_6 (18) = happyShift action_6
action_6 (4) = happyGoto action_7
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (9) = happyShift action_2
action_7 (10) = happyShift action_4
action_7 (11) = happyShift action_5
action_7 (18) = happyShift action_6
action_7 (4) = happyGoto action_21
action_7 (6) = happyGoto action_22
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (9) = happyShift action_2
action_8 (10) = happyShift action_4
action_8 (11) = happyShift action_5
action_8 (18) = happyShift action_6
action_8 (4) = happyGoto action_18
action_8 (7) = happyGoto action_20
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (9) = happyShift action_2
action_9 (10) = happyShift action_4
action_9 (11) = happyShift action_5
action_9 (18) = happyShift action_6
action_9 (4) = happyGoto action_18
action_9 (7) = happyGoto action_19
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (9) = happyShift action_2
action_10 (10) = happyShift action_4
action_10 (11) = happyShift action_5
action_10 (18) = happyShift action_6
action_10 (4) = happyGoto action_17
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (18) = happyShift action_16
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (18) = happyShift action_15
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (18) = happyShift action_14
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (9) = happyShift action_34
action_14 (5) = happyGoto action_33
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (18) = happyShift action_32
action_15 (8) = happyGoto action_31
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (9) = happyShift action_30
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (19) = happyShift action_29
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (9) = happyShift action_2
action_18 (10) = happyShift action_4
action_18 (11) = happyShift action_5
action_18 (18) = happyShift action_6
action_18 (4) = happyGoto action_27
action_18 (7) = happyGoto action_28
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (19) = happyShift action_26
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (19) = happyShift action_25
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (9) = happyShift action_2
action_21 (10) = happyShift action_4
action_21 (11) = happyShift action_5
action_21 (18) = happyShift action_6
action_21 (4) = happyGoto action_21
action_21 (6) = happyGoto action_24
action_21 _ = happyReduce_13

action_22 (19) = happyShift action_23
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_10

action_24 _ = happyReduce_14

action_25 _ = happyReduce_4

action_26 _ = happyReduce_5

action_27 (9) = happyShift action_2
action_27 (10) = happyShift action_4
action_27 (11) = happyShift action_5
action_27 (18) = happyShift action_6
action_27 (4) = happyGoto action_27
action_27 (7) = happyGoto action_28
action_27 _ = happyReduce_15

action_28 _ = happyReduce_16

action_29 _ = happyReduce_6

action_30 (9) = happyShift action_2
action_30 (10) = happyShift action_4
action_30 (11) = happyShift action_5
action_30 (18) = happyShift action_6
action_30 (4) = happyGoto action_39
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (19) = happyShift action_38
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (9) = happyShift action_37
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (19) = happyShift action_36
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (9) = happyShift action_34
action_34 (5) = happyGoto action_35
action_34 _ = happyReduce_11

action_35 _ = happyReduce_12

action_36 (9) = happyShift action_2
action_36 (10) = happyShift action_4
action_36 (11) = happyShift action_5
action_36 (18) = happyShift action_6
action_36 (4) = happyGoto action_43
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (9) = happyShift action_2
action_37 (10) = happyShift action_4
action_37 (11) = happyShift action_5
action_37 (18) = happyShift action_6
action_37 (4) = happyGoto action_42
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (9) = happyShift action_2
action_38 (10) = happyShift action_4
action_38 (11) = happyShift action_5
action_38 (18) = happyShift action_6
action_38 (4) = happyGoto action_41
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (19) = happyShift action_40
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (9) = happyShift action_2
action_40 (10) = happyShift action_4
action_40 (11) = happyShift action_5
action_40 (18) = happyShift action_6
action_40 (4) = happyGoto action_47
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (19) = happyShift action_46
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (19) = happyShift action_45
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (19) = happyShift action_44
action_43 _ = happyFail (happyExpListPerState 43)

action_44 _ = happyReduce_9

action_45 (18) = happyShift action_32
action_45 (8) = happyGoto action_49
action_45 _ = happyReduce_17

action_46 _ = happyReduce_8

action_47 (19) = happyShift action_48
action_47 _ = happyFail (happyExpListPerState 47)

action_48 _ = happyReduce_7

action_49 _ = happyReduce_18

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
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (AddS happy_var_3
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 4 4 happyReduction_5
happyReduction_5 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
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
	(HappyAbsSyn8  happy_var_4) `HappyStk`
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
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (FunS happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 4 4 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (AppS happy_var_2 happy_var_3
	) `HappyStk` happyRest

happyReduce_11 = happySpecReduce_1  5 happyReduction_11
happyReduction_11 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_2  5 happyReduction_12
happyReduction_12 (HappyAbsSyn5  happy_var_2)
	(HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn5
		 (happy_var_1 : happy_var_2
	)
happyReduction_12 _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  6 happyReduction_13
happyReduction_13 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn6
		 ([happy_var_1]
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_2  6 happyReduction_14
happyReduction_14 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1 : happy_var_2
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_2  7 happyReduction_15
happyReduction_15 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn7
		 ([happy_var_1, happy_var_2]
	)
happyReduction_15 _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_2  7 happyReduction_16
happyReduction_16 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 : happy_var_2
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happyReduce 4 8 happyReduction_17
happyReduction_17 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	(HappyTerminal (TokenId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 ([(happy_var_2, happy_var_3)]
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 5 8 happyReduction_18
happyReduction_18 ((HappyAbsSyn8  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	(HappyTerminal (TokenId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 ((happy_var_2, happy_var_3) : happy_var_5
	) `HappyStk` happyRest

happyNewToken action sts stk [] =
	action 20 20 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenId happy_dollar_dollar -> cont 9;
	TokenNum happy_dollar_dollar -> cont 10;
	TokenBool happy_dollar_dollar -> cont 11;
	TokenSuma -> cont 12;
	TokenResta -> cont 13;
	TokenNot -> cont 14;
	TokenLet -> cont 15;
	TokenLetStar -> cont 16;
	TokenLambda -> cont 17;
	TokenPA -> cont 18;
	TokenPC -> cont 19;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 20 tk tks = happyError' (tks, explist)
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
