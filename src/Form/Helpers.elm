module Form.Helpers exposing (..)

import Form.Model exposing (..)


isFormValid : Form -> Bool
isFormValid form =
    List.all .isValid form


isFieldValid : FormFieldType -> String -> Bool
isFieldValid fieldType inputText =
    case fieldType of
        Nome ->
            inputText
                |> String.length
                |> moreThanThreeDigit

        Cognome ->
            inputText
                |> String.length
                |> moreThanFiveDigit


moreThanThreeDigit : Int -> Bool
moreThanThreeDigit textLength =
    textLength >= 3


moreThanFiveDigit : Int -> Bool
moreThanFiveDigit textLength =
    textLength >= 5


errorText : FormFieldType -> String
errorText type_ =
    case type_ of
        Nome ->
            "La lunghezza del nome deve essere maggiore o uguale a 3"

        Cognome ->
            "La lunghezza del nome deve essere maggiore o uguale a 5"
