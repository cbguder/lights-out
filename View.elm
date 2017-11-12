module View exposing (view)

import Html exposing (div, text, node)
import Html.Attributes exposing (class, classList, href, id)
import Html.Events exposing (onClick)
import Update exposing (Msg(..))


view model =
    div
        []
        [ (viewGrid model.grid) ]


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
