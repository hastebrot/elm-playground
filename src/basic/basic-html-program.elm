module Main exposing (main)

import Html exposing (Html, button, div, text)
import Html.App exposing (beginnerProgram)
import Html.Events exposing (onClick)


main : Program Never
main =
    beginnerProgram
        { model = model
        , view = view
        , update = update
        }


type alias Model =
    { counter : Int }


type Msg
    = Increment
    | Decrement
    | Reset


model : Model
model =
    { counter = 0 }


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model
                | counter = model.counter + 1
            }

        Decrement ->
            { model
                | counter = model.counter - 1 |> max 0
            }

        Reset ->
            { model
                | counter = 0
            }


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text (toString model) ]
        , button [ onClick Reset ] [ text "reset" ]
        , button [ onClick Decrement ] [ text "- decr" ]
        , button [ onClick Increment ] [ text "+ incr" ]
        ]
