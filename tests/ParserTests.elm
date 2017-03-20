module Tests exposing (..)

import Test exposing (Test, describe, test)
import Expect


type alias Parser =
    String -> ParserResult


type alias ParserResult =
    { match : Maybe String
    , rest : String
    }


success : String -> String -> ParserResult
success match rest =
    { match = Just match, rest = rest }


failure : String -> ParserResult
failure rest =
    { match = Nothing, rest = rest }


token : String -> Parser
token token =
    \text ->
        if String.startsWith token text then
            let
                tokenLength =
                    String.length token
            in
                success
                    (text
                        |> String.left tokenLength
                    )
                    (text
                        |> String.right tokenLength
                    )
        else
            failure text


all : Test
all =
    describe "suite"
        [ test "success" <|
            \() ->
                Expect.equal
                    (success "foo" "bar")
                    { match = Just "foo", rest = "bar" }
        , test "failure" <|
            \() ->
                Expect.equal
                    (failure "foobar")
                    { match = Nothing, rest = "foobar" }
        , test "token" <|
            \() ->
                Expect.equal
                    (token "foo" "foobar")
                    (success "foo" "bar")
        ]
