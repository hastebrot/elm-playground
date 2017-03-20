module Main exposing (..)

import Json.Decode exposing (int, string, null, oneOf, Decoder)
import Json.Decode.Pipeline exposing (decode, required, optional)


type alias User =
    { id : Int
    , name : String
    , email : String
    }


userDecoder : Decoder User
userDecoder =
    decode User
        |> required "id" int
        |> optional "name" string "(fallback)"
        |> required "email" string


result : Result String User
result =
    Json.Decode.decodeString
        userDecoder
        """
            {"id": 123, "email": "sam@example.com" }
        """
