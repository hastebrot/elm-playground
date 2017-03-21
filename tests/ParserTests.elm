module ParserTests exposing (..)

import Test exposing (Test, describe, test)
import Expect


tests : Test
tests =
    describe "Parser"
        [ describe "parser results"
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
            ]
        , describe "parsers"
            [ test "token" <|
                \() ->
                    Expect.equal
                        (token "foo" "foobar")
                        (success "foo" "bar")
            , test "seq" <|
                \() ->
                    Expect.equal
                        (seq [ token "foo" ] "foobar")
                        (success "foo" "bar")
            , test "seq zero match" <|
                \() ->
                    Expect.equal
                        (seq [ token "xxx" ] "foobar")
                        (failure "foobar")
            , test "seq one match" <|
                \() ->
                    Expect.equal
                        (seq [ token "foo", token "xxx" ] "foobar")
                        (failure "foobar")
            , test "seq two match" <|
                \() ->
                    Expect.equal
                        (seq [ token "foo", token "bar", token "xxx" ] "foobar")
                        (failure "foobar")
            ]
        ]


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
                len =
                    String.length token

                match =
                    String.left len text

                rest =
                    String.right len text
            in
                success match rest
        else
            failure text


seq : List Parser -> Parser
seq parsers =
    \text ->
        let
            result =
                List.foldl seqFold ( success "" text, text ) parsers
        in
            Tuple.first result


seqFold : Parser -> ( ParserResult, String ) -> ( ParserResult, String )
seqFold parser state =
    let
        stateResult =
            Tuple.first state

        stateText =
            Tuple.second state

        parserResult =
            parser stateResult.rest
    in
        case parserResult.match of
            Just parserMatch ->
                case stateResult.match of
                    Just stateMatch ->
                        ( success (stateMatch ++ parserMatch) parserResult.rest, stateText )

                    Nothing ->
                        ( failure stateText, stateText )

            Nothing ->
                ( failure stateText, stateText )
