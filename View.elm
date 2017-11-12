module View exposing (view)

import Html exposing (div, text, node)
import Html.Attributes exposing (class, classList, href, id)
import Html.Events exposing (onClick)
import Update exposing (Msg(..))


view model =
    div
        []
        [ viewLevel model.level
        , viewMoves model.moves
        , viewGrid model.grid
        ]


viewLevel level =
    div
        [ id "level" ]
        [ text "Level: "
        , text (toString (level + 1))
        ]


viewMoves moves =
    div
        [ id "moves" ]
        [ text "Moves: "
        , text (toString moves)
        ]


viewGrid grid =
    div
        [ id "grid" ]
        (List.indexedMap viewRow grid)


viewRow y row =
    div
        [ class "row" ]
        (List.indexedMap (viewCell y) row)


viewCell y x on =
    div
        [ onClick (Toggle x y)
        , classList
            [ ( "cell", True )
            , ( "on", on )
            ]
        ]
        []
