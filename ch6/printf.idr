data Format
  = Any Format
  | Lit String Format
  | Str Format
  | End

FormatType : Format -> Type
FormatType (Any fmt) = {a : Type} -> Show a => a -> FormatType fmt
FormatType (Lit _ fmt) = FormatType fmt
FormatType (Str fmt) = String -> FormatType fmt
FormatType End = String

doFormat : (fmt : Format) -> String -> FormatType fmt
doFormat (Any fmt) acc = \x => doFormat fmt (show x)
doFormat (Lit s fmt) acc = doFormat fmt (acc ++ s)
doFormat (Str fmt) acc = \s => doFormat fmt (acc ++ s)
doFormat End acc = acc

LitCh : Char -> Format -> Format
LitCh c (Lit s fmt) = Lit (strCons c s) fmt
LitCh c fmt = Lit (strCons c "") fmt

toFormat : List Char -> Format
toFormat [] = End
toFormat ('{'::'}'::tl) = Any (toFormat tl)
toFormat ('{'::'s'::'}'::tl) = Str (toFormat tl)
toFormat ('{'::'{'::tl) = LitCh '{' (toFormat tl)
toFormat ('}'::'}'::tl) = LitCh '}' (toFormat tl)
toFormat (hd::tl) = LitCh hd (toFormat tl)

format : (fmt : String) -> FormatType (toFormat (unpack fmt))
format fmt = doFormat _ ""

oneEqOne : String
oneEqOne = format "{} = {s}" 1 "one"
