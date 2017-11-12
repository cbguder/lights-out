module Update exposing (Msg(..), update)


type Msg
    = Toggle Int Int


update msg model =
    case msg of
        Toggle x y ->
            { model | grid = (play x y model.grid) }


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
