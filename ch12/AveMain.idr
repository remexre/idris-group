module Main

import Average

-- showAverage : String -> String
-- showAverage str = "The average word length is: " ++ show (average str) ++ "\n"

main : IO ()
main = print (average "foo")

-- repl "Enter a string: " showAverage
