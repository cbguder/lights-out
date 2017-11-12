module Levels exposing (..)


emptyLevel =
    [ [ False, False, False, False, False ]
    , [ False, False, False, False, False ]
    , [ False, False, False, False, False ]
    , [ False, False, False, False, False ]
    , [ False, False, False, False, False ]
    ]


levels =
    [ [ [ False, True, False, False, False ]
      , [ True, True, True, False, False ]
      , [ False, True, False, True, False ]
      , [ False, False, True, True, True ]
      , [ False, False, False, True, False ]
      ]
    , [ [ True, True, False, True, True ]
      , [ True, False, False, False, True ]
      , [ False, False, False, False, False ]
      , [ True, False, False, False, True ]
      , [ True, True, False, True, True ]
      ]
    , [ [ False, False, True, False, False ]
      , [ False, False, True, False, False ]
      , [ True, True, False, True, True ]
      , [ False, False, True, False, False ]
      , [ False, False, True, False, False ]
      ]
    ]
