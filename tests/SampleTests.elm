module SampleTests exposing (..)

import Test exposing (Test, describe, test)
import Expect
import String


tests : Test
tests =
    describe "Sample Test Suite"
        [ test "plus operator" <|
            \() -> Expect.equal 10 (3 + 7)
        , test "plus function" <|
            \() -> Expect.equal 4 (plus 1 3)
        , test "string left" <|
            \() -> Expect.equal "a" (String.left 1 "abcdefg")
        ]


plus : number -> number -> number
plus a b =
    a + b
