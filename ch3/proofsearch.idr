myId : a -> a
myId x = x

myK : a -> b -> a
myK x y = x

mySucc : Nat -> Nat
mySucc x = ?bar

--  Cast from to  => from to
-- {Cast from to} -> from -> to
x : (Cast from to => from -> to) -> Int
x myCast = 3 + ?foo 2

y : (a -> b -> Void) -> b -> a -> Void
y one two three = ?x
