module Update exposing (Msg(..), update)

import Model exposing (level)


type Msg
    = Toggle Int Int


update msg model =
    case msg of
        Toggle x y ->
            toggle x y model


toggle x y model =
    let
        toggledGrid =
            toggleAll x y model.grid

        nextLevel =
            model.level + 1
    in
        if isBlankGrid toggledGrid then
            { grid = level nextLevel
            , level = nextLevel
            , moves = 0
            }
        else
            { model
                | grid = toggledGrid
                , moves = model.moves + 1
            }


isBlankGrid grid =
    List.all isBlankRow grid


isBlankRow row =
    List.all not row


toggleAll x y grid =
    grid
        |> toggleSafe x y
        |> toggleSafe x (y + 1)
        |> toggleSafe x (y - 1)
        |> toggleSafe (x + 1) y
        |> toggleSafe (x - 1) y


toggleSafe x y grid =
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
