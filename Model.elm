module Model exposing (..)

import Array
import Levels exposing (levels, emptyLevel)


type alias Model =
    { grid : Grid
    , level : Int
    , moves : Int
    }


type alias Grid =
    List List Bool


model =
    { grid = level 0
    , level = 0
    , moves = 0
    }


level n =
    let
        level =
            Array.get n (Array.fromList levels)
    in
        case level of
            Just level ->
                level

            Nothing ->
                emptyLevel
