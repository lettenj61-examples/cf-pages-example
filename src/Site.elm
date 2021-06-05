module Site exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events as Events



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }



-- MODEL


type alias Model =
    { count : Int
    , greet : String
    }


init : Model
init =
    { count = 0
    , greet = "Hello, Cloudflare Pages"
    }



-- UPDATE


type Msg
    = NoMsg
    | Increment
    | Decrement


update : Msg -> Model -> Model
update msg ({ count } as model) =
    case msg of
        NoMsg ->
            model

        Increment ->
            { model | count = count + 1 }

        Decrement ->
            { model | count = count - 1 }



-- VIEW


view : Model -> Html Msg
view { count, greet } =
    let
        viewButton label_ msg =
            button
                [ class "button"
                , style "font-size" "1.5em"
                , style "padding" "0.5em 0.5em"
                , style "margin" "0 1em"
                , Events.onClick msg
                ]
                [ text label_ ]

        viewOutput =
            div
                [ class "output"
                , style "margin" "0.5em"
                , style "padding" "0.25em"
                , style "background-color" "#bceedd"
                ]
                [ output
                    [ style "font-wight" "600"
                    , style "font-size" "4.48em"
                    ]
                    [ text <| "Output: " ++ String.fromInt count ]
                ]
    in
    main_
        [ id "counter" ]
        [ h1
            [ class "title" ]
            [ text greet ]
        , viewOutput
        , div
            [ class "controls"
            ]
            [ viewButton "Add 1" Increment
            , viewButton "Subtract 1" Decrement
            ]
        ]
