module Form.Model exposing (..)


type Msg
    = NoOp
    | UpdateText FormField String
    | SubmitForm


type alias Model =
    { message : String
    , logo : String
    , form : Form
    , isFormValid : Bool
    , formError : Maybe String
    }


type alias Form =
    List FormField


type alias FormField =
    { name : String
    , label : String
    , value : String
    , isValid : Bool
    , isPristine : Bool
    , type_ : FormFieldType
    }


type FormFieldType
    = Nome
    | Cognome


initialModel : String -> Model
initialModel path =
    Model
        "Your Elm App is working!"
        path
        [ FormField "nome" "nome" "" False False Nome
        , FormField "cognome" "cognome" "" False False Cognome
        ]
        False
        Nothing
