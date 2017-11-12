module Main exposing (..)

import Html exposing (div, text, node)
import Html.Attributes exposing (class, classList, href, id)
import Html.Events exposing (onClick)


type alias Model =
    { grid : List List Bool
    }


type Msg
    = Toggle Int Int


main =
    Html.beginnerProgram { model = model, view = view, update = update }


model =
    { grid =
        [ [ False, True, False, False, False ]
        , [ True, True, True, False, False ]
        , [ False, True, False, True, False ]
        , [ False, False, True, True, True ]
        , [ False, False, False, True, False ]
        ]
    }


update msg model =
    case msg of
        Toggle x y ->
            { model | grid = (play x y model.grid) }


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


play x y grid =
    grid
        |> toggle x y
        |> toggle x (y + 1)
        |> toggle x (y - 1)
        |> toggle (x + 1) y
        |> toggle (x - 1) y


toggle x y grid =
    let
        size =
            List.length grid
    in
        if x >= 0 && y >= 0 && x < size && y < size then
            toggleReal x y grid
        else
            grid


toggleReal x y grid =
    let
        pre =
            List.take y grid

        rest =
            List.drop y grid

        row =
            Maybe.withDefault [] (List.head rest)

        tail =
            Maybe.withDefault [] (List.tail rest)
    in
        List.append pre ((toggleCell x row) :: tail)


toggleCell x row =
    let
        pre =
            List.take x row

        rest =
            List.drop x row

        item =
            Maybe.withDefault True (List.head rest)

        tail =
            Maybe.withDefault [] (List.tail rest)
    in
        List.append pre ((not item) :: tail)
