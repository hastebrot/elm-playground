module Main exposing (..)


type alias Point =
    { x : Int, y : Int }


point : Point
point =
    { x = 3
    , y = 4
    }



-- test v =
--     { point | x = v }
-- test 3


plus : Int -> Int -> Int
plus a b =
    a + b


foo =
    plus 1 2
