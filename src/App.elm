module App exposing (..)

import Form.Model exposing (..)
import Form.Update exposing (..)
import Form.View exposing (..)
import Html exposing (Html)


init : String -> ( Model, Cmd Msg )
init path =
    ( initialModel path, Cmd.none )



---- PROGRAM ----


main : Program String Model Msg
main =
    Html.programWithFlags
        { view = view
        , init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        }
