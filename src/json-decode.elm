module Main exposing (test)

import Json.Decode exposing (int, string, float, Decoder)
import Json.Decode.Pipeline exposing (decode, required, optional, hardcoded, nullable)


type alias User =
    { id : Int
    , email : Maybe String
    , name : String
    , percentExcited : Float
    }


userDecoder : Decoder User
userDecoder =
    decode User
        |> required "id" int
        |> required "email" (nullable string)
        |> optional "name" string "(fallback)"
        |> hardcoded 1.0


test : Result String User
test =
    Json.Decode.decodeString
        userDecoder
        """
            {"id": 123, "email": "sam@example.com", "name": "Sam Sample"}
        """
