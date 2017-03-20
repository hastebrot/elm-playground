-- module Main exposing (main)

-- import Html exposing (Html, button, div, text)
-- import Html.App as App exposing (beginnerProgram)
-- import Color as Color exposing (rgb)
-- import Graphics.Render as Render exposing (rectangle, solidFill, svg, group, move)


-- main : Program Never
-- main =
--     App.program
--         { init = init
--         , view = view
--         , update = update
--         , subscriptions = subscriptions
--         }


-- type alias Ant =
--     { location : Point
--     , direction : Point
--     }


-- type alias Point =
--     { x : Float
--     , y : Float
--     }


-- rotate : Float -> Point -> Point
-- rotate angle vector =
--     { vector
--         | x = vector.x * cos angle - vector.y * sin angle
--         , y = vector.x * sin angle + vector.y * cos angle
--     }


-- type alias Model =
--     { ant : Ant
--     , world : List Point
--     }


-- type Msg
--     = Step


-- model : Model
-- model =
--     { ant = Ant (Point 0 0) (Point 1 0)
--     , world = [ Point 10 10, Point 20 20, Point 30 30 ]
--     }


-- init : ( Model, Cmd Msg )
-- init =
--     ( model
--     , Cmd.none
--     )


-- update : Msg -> Model -> ( Model, Cmd Msg )
-- update msg model =
--     case msg of
--         Step ->
--             { model
--                 | ant = Ant model.ant.location (model.ant.direction |> rotate (turns 0.25))
--             }
--                 |> \it -> ( it, Cmd.none )


-- subscriptions : Model -> Sub Msg
-- subscriptions model =
--     Sub.none


-- view : Model -> Html Msg
-- view model =
--     model.world
--         |> List.map
--             (\p ->
--                 rectangle 10 10
--                     |> solidFill (rgb 0 0 0)
--                     |> move p.x p.y
--             )
--         |> group
--         |> svg 500 500
