port module Main exposing (..)

import Test exposing (Test, describe)
import Json.Encode exposing (Value)
import Test.Runner.Node exposing (run, TestProgram)
import ParserTests


tests : Test
tests =
    describe "Elm Playground Tests"
        [ ParserTests.tests
        ]


main : TestProgram
main =
    run emit tests


port emit : ( String, Value ) -> Cmd msg
