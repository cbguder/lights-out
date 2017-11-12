module Model exposing (..)


type alias Model =
    { grid : Grid
    }


type alias Grid =
    List List Bool


model =
    { grid =
        [ [ False, True, False, False, False ]
        , [ True, True, True, False, False ]
        , [ False, True, False, True, False ]
        , [ False, False, True, True, True ]
        , [ False, False, False, True, False ]
        ]
    }
