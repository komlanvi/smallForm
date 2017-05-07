module Form.Update exposing (..)

import Form.Model exposing (..)
import Form.Helpers exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateText newField inputText ->
            let
                updateField : FormFieldType -> FormField -> FormField
                updateField newFieldType oldField =
                    if oldField.type_ == newFieldType then
                        { oldField
                            | value = inputText
                            , isValid = isFieldValid oldField.type_ inputText
                            , isPristine = True
                        }
                    else
                        oldField

                updateFields : Form -> Form
                updateFields form =
                    List.map (updateField newField.type_) form
            in
                { model | form = updateFields model.form } ! [ Cmd.none ]

        SubmitForm ->
            let
                validateForm : Model -> Model
                validateForm ({ form } as model) =
                    if isFormValid form then
                        { model | isFormValid = True, formError = Just "Great work, take on next step" }
                    else
                        { model | formError = Just "Fullfill well your form's inputs" }
            in
                validateForm model ! [ Cmd.none ]

        NoOp ->
            ( model, Cmd.none )
