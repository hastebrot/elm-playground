module Main exposing (..)

import Graphics.Render as Render exposing (rectangle, solidFill, svg, group)
import Color exposing (rgb)


main =
    group
        [ rectangle 150 150
            |> solidFill (rgb 200 0 0)
        ]
        |> svg 500 500
