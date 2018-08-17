import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import String exposing (length, toInt, any)
import Char exposing (isDigit, isLower, isUpper)

main =
  Html.beginnerProgram { model = model, view = view, update = update}

-- MODEL

type alias Model =
  { name : String
  , age : String
  , password : String
  , passwordAgain : String
  , isValid : Bool
  }

model : Model
model =
  Model "" "" "" "" True

-- UPDATE

type Msg =
 Name String | 
 Age String |
 Password String | 
 PasswordAgain String |
 Submit

update : Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
      { model | name = name }

    Age age ->
      { model | age = age }

    Password password ->
      { model | password = password }

    PasswordAgain passwordAgain ->
      { model | passwordAgain = passwordAgain }

    Submit ->
      { model | isValid = isValid model }

isValid : Model -> Bool
isValid model =
  model.password == model.passwordAgain &&
  length model.password > 8 &&
  isNumber model.age &&
  isValidPassword model.password

isNumber : String -> Bool
isNumber str =
  case toInt str of
    Ok x ->
      True
    _ ->
      False

isValidPassword : String -> Bool
isValidPassword str =
  any isDigit str &&
  any isLower str &&
  any isUpper str

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ input [ type_ "text", placeholder "Name", onInput Name ] []
    , input [ type_ "text", placeholder "Age", onInput Age ] []
    , input [ type_ "password", placeholder "Password", onInput Password ] []
    , input [ type_ "password", placeholder "Re-enter Password", onInput PasswordAgain ] []
    , viewValidation model
    , div [] []
    , button [ onClick Submit ] [ text "Submit" ]
    ]

viewValidation : Model -> Html msg
viewValidation model =
  let
    (color, message) =
      if model.isValid then
        ("green", "OK")
      else
        ("red", "NG")
  in
    div [ style [ ("color", color) ] ] [ text message ]

