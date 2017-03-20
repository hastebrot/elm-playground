module Tests exposing (..)

import Test exposing (Test, describe, test)
import Expect
import String


all_ : Test
all_ =
    describe "Sample Test Suite"
        [ test "Addition" <|
            \() -> Expect.equal 10 (3 + 7)
        , test "String.left" <|
            \() -> Expect.equal "a" (String.left 1 "abcdefg")
        , test "add function" <|
            \() -> Expect.equal 4 (plus 1 3)
        ]


plus : number -> number -> number
plus a b =
    a + b
