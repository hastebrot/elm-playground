module Main exposing (main)

import Html exposing (Html, div, text)
import Html.Attributes exposing (id)


main : Html msg
main =
    div [ id "root" ] [ text "hello world" ]
