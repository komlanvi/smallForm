module Form.View exposing (..)

import Form.Model exposing (..)
import Form.Helpers exposing (..)
import Html exposing (Html, text, div, img, input, label, button, span)
import Html.Attributes exposing (src, required)
import Html.Events exposing (onInput, onClick)


view : Model -> Html Msg
view { logo, message, form, formError } =
    div []
        [ img [ src logo ] []
        , div [] [ text message ]
        , formError
            |> renderError
        , form
            |> renderForm
        , renderSubmit
        ]


renderError : Maybe String -> Html Msg
renderError error =
    case error of
        Just errorMsg ->
            div [] [ text errorMsg ]

        Nothing ->
            span [] []


renderForm : Form -> Html Msg
renderForm form =
    div
        []
        (List.map renderInput form)


renderInput : FormField -> Html Msg
renderInput ({ value, type_, isPristine } as field) =
    div
        []
        [ label
            []
            [ text field.label ]
        , input
            [ required True
            , onInput (UpdateText field)
            ]
            []
        , type_
            |> errorText
            |> renderFieldError field
            |> renderIf isPristine
        ]


renderIf : Bool -> Html Msg -> Html Msg
renderIf cond view =
    case cond of
        True ->
            view

        False ->
            text ""


renderFieldError ({ isValid, value } as field) errorText =
    if isValid then
        div [] [ text value ]
    else
        div [] [ text errorText ]


renderSubmit =
    button
        [ onClick SubmitForm ]
        [ text "Submit" ]
