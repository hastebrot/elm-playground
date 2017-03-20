#HSLIDE

# Intro to Elm

~~~elm
elm =
    Ok <|
        "a functional programming language "
            ++ "that compiles to JavaScript"
~~~

#VSLIDE

### Code example

~~~elm
hypotenuse : Float -> Float -> Float
hypotenuse a b =
    sqrt <| a^2 + b^2
~~~

#VSLIDE

### Outline

<!-- TOC depthFrom:2 depthTo:2 orderedList:true -->

1. [Features](#features)
2. [History](#history)
3. [Platform](#platform)
4. [Editor and tools](#editor-and-tools)
5. [Core Language](#core-language)
6. [Core Libraries](#core-libraries)
7. [The Elm Architecture](#the-elm-architecture)

<!-- /TOC -->

#HSLIDE

## Features

- influenced by: Haskell, OCaml, F#
- paradigm: purely functional
  - prevents observable side-effects (managed effects)

#VSLIDE

>A __side effect__ would mean that evaluating an expression __changes some internal state__ that would later cause evaluating the same expression to have a __different result__.

<small>&mdash; Joel Spolsky, 2010, http://stackoverflow.com/questions/4382223/what-does-pure-mean-in-pure-functional-language/4382247#4382247</small>

#VSLIDE

### Features (cont'd)

- domain-specific:
  - web browser-based graphical user interfaces
- compiler: static type checking
  - no runtime errors in practice
- immutability
  - persistent data structures `Array`, `Dict`, `Set`
- module system:
  - `elm-lang/core`, `elm-lang/html`, `elm-lang/http`
- no higher-kindes types
  - for `map` use `List.map`, `Dict.map`, ...
- BSD licence (3-clause)

<!--
#VSLIDE

- evaluate the same expression with the same arguments, and returns always the same value
- nice for testing, reuse, reproducibility, ...
- Amr Sabry, 1993
- Graham Hutton, http://stackoverflow.com/questions/4382223/what-does-pure-mean-in-pure-functional-language

>Computational effects are things like non-termination, exceptions, state, input/output, continuations, non-determinism, and others.
>http://math.andrej.com/2008/11/17/not-all-computational-effects-are-monads/
-->

<!--
#VSLIDE

>3.1. Purity
>
>What is a "purely functional" programming language?
>
>This question has been the subject of some debate in the functional programming community. It is widely agreed that languages such as Haskell and Miranda are "purely functional", while SML and Scheme are not. However, there are some small differences of opinion about the precise technical motivation for this distinction. One definition that has been suggested is as follows:
>
>The term "purely functional" is often used to describe languages that perform all their computations via function application. This is in contrast to languages, such as Scheme and Standard ML, that are predominantly functional but also allow `side effects' (computational effects caused by expression evaluation that persist after the evaluation is completed).
>Sometimes, the term "purely functional" is also used in a broader sense to mean languages that might incorporate computational effects, but without altering the notion of `function' (as evidenced by the fact that the essential properties of functions are preserved.) Typically, the evaluation of an expression can yield a `task', which is then executed separately to cause computational effects. The evaluation and execution phases are separated in such a way that the evaluation phase does not compromise the standard properties of expressions and functions. The input/output mechanisms of Haskell, for example, are of this kind.
>
>See also:
>"What is a purely functional language", Amr Sabry, Journal of Functional Programming, 8(1):1-22, Cambridge University Press, January 1998.

&mdash; http://www.cs.nott.ac.uk/~pszgmh/faq.html#purity
-->

#VSLIDE

- pure functional: Haskell, Elm, PureScript, Idris
- impure function (contain imperative features): Scheme, Clojure, F#, Erlang

#HSLIDE

## History

Evan Czaplicki
- 2012, Harvard University
  - "Elm: Concurrent FRP for Functional GUIs"
- 2013, Prezi
  - "presentation software that uses motion, zoom, and spatial relationships to bring your ideas to life and make you a great presenter
- 2016, NoRedInk
  - "A fun way to practice and master grammar & writing skills!"

#VSLIDE

### History (cont'd)

- 0.18, New debugger with session import/export (Nov 2016)
- 0.15.1, Dramatically improved error messages (Jun 2015)
- 0.14, Package manager, parallel builds, JSON (Dec 2014)
- 0.12.1, Fast Immutable Arrays (May 2014)

&mdash; http://elm-lang.org/blog#release-notes

#HSLIDE

## Platform

- `elm-compiler`
- `elm-make`
- `elm-reactor`
- `elm-repl`
- `elm-package`

&mdash; https://github.com/elm-lang/elm-platform#elm-platform

#VSLIDE

### `elm-reactor`

~~~
$ git clone https://github.com/hastebrot/elm-playground.git
$ cd elm-playground
$ elm-reactor
~~~

- Browser: http://localhost:8000

#VSLIDE

### `elm-make`

~~~
$ elm-make Main.elm --output=main.html
~~~

#VSLIDE

### `elm-package`

~~~
$ elm-package install elm-lang/html
$ elm package diff elm-lang/html 1.1.0 2.0.0
~~~

#VSLIDE

## Editor and tools

~~~
$ npm install -g elm elm-oracle elm-format elm-test
$ yarn global add elm elm-oracle elm-format elm-test
~~~

- Visual Studio Code
  - ext install elm

- https://github.com/sbrink/vscode-elm
- https://github.com/avh4/elm-format
- https://github.com/ElmCast/elm-oracle

#HSLIDE

## Core Language

- Values
- Functions
- Expressions
- Lists
- Tuples
- Records

#VSLIDE

### Values

~~~elm
> "hello"
"hello"

> "hello" ++ "world"
"helloworld"

> "hello" ++ " world"
"hello world"
~~~

#VSLIDE

### Values

~~~elm
> 2 + 3 * 4
14

> (2 + 3) * 4
20
~~~

~~~elm
> 9 / 2
4.5

> 9 // 2
4
~~~

#VSLIDE

### Functions

~~~elm
> isNegative n = n < 0
<function>

> isNegative 4
False

> isNegative -7
True

> isNegative (-3 * -4)
False
~~~

#VSLIDE

### Expressions

~~~elm
> if True then "hello" else "world"
"hello"

> if False then "hello" else "world"
"world"
~~~

#VSLIDE

### Lists

~~~elm
> names = [ "Alice", "Bob", "Chuck" ]
["Alice","Bob","Chuck"]

> List.isEmpty names
False

> List.length names
3

> List.reverse names
["Chuck","Bob","Alice"]
~~~

#VSLIDE

### Lists

~~~elm

> numbers = [1,4,3,2]
[1,4,3,2]

> List.sort numbers
[1,2,3,4]

> double n = n * 2
<function>

> List.map double numbers
[2,8,6,4]
~~~

#VSLIDE

### Tuples

~~~elm
> import String

> goodName name = \
|   if String.length name <= 20 then \
|     (True, "name accepted!") \
|   else \
|     (False, "name was too long; please limit it to 20 characters")

> goodName "Tom"
(True, "name accepted!")
~~~

#VSLIDE

### Records

~~~elm
> point = { x = 3, y = 4 }
{ x = 3, y = 4 }

> point.x
3

> bill = { name = "Gates", age = 57 }
{ age = 57, name = "Gates" }

> bill.name
"Gates"
~~~

#VSLIDE

### Records

~~~elm
> .name bill
"Gates"

> List.map .name [bill,bill,bill]
["Gates","Gates","Gates"]
~~~

#VSLIDE

### Records

~~~elm
> under70 {age} = age < 70
<function>

> under70 bill
True

> under70 { species = "Triceratops", age = 68000000 }
False
~~~

#VSLIDE

### Records

~~~elm
> { bill | name = "Nye" }
{ age = 57, name = "Nye" }

> { bill | age = 22 }
{ age = 22, name = "Gates" }
~~~

#VSLIDE

- https://guide.elm-lang.org/core_language.html
- https://learnxinyminutes.com/docs/elm/

#HSLIDE

## Core Libraries

- http://package.elm-lang.org/packages/elm-lang/core/latest/

#VSLIDE

~~~elm
List.map : (a -> b) -> List a -> List b
map sqrt [1,4,9] == [1,2,3]
~~~

- type annotation (type variables are lower case types)
  - "List dot map has type a-goes-to-b, goes to list of a, goes to list of b."

#VSLIDE

~~~elm
map2 : (a -> b -> result) -> List a -> List b -> List result
map2 (+) [1,2,3] [1,2,3,4] == [2,4,6]
map2 (,) [1,2,3] ['a','b'] == [ (1,'a'), (2,'b') ]
~~~

- There are three special lowercase types: number, comparable, and appendable.
  - Numbers allow you to use arithmetic on Ints and Floats.
  - Comparable allows you to order numbers and strings, like a < b.
  - Appendable things can be combined with a ++ b.

#HSLIDE

## The Elm Architecture

~~~elm
module Main exposing (main)

import Html exposing (Html, div, text)
import Html.Attributes exposing (id)


main : Html msg
main =
    div [ id "root" ] [ text "hello world" ]
~~~

#VSLIDE

- The Basic Pattern
  - Model &mdash; the state of your application
  - Update &mdash; a way to update your state
  - View &mdash; a way to view your state as HTML

The Elm Architecture is a simple pattern for architecting webapps. The core idea is that your code is built around a Model of your application state, a way to update your model, and a way to view your model.

&mdash; TodoMVC (https://github.com/evancz/elm-todomvc)

#VSLIDE

~~~elm
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

main =
  Html.beginnerProgram { model = 0, view = view, update = update }

type Msg = Increment | Decrement

update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1

view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (toString model) ]
    , button [ onClick Increment ] [ text "+" ]
    ]
~~~

#VSLIDE

~~~elm
module Main exposing (main)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }


type alias Model =
    { counter : Int }


type Msg
    = Increment
    | Decrement
    | Reset


model : Model
model =
    { counter = 0 }


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model
                | counter = model.counter + 1
            }

        Decrement ->
            { model
                | counter = model.counter - 1 |> max 0
            }

        Reset ->
            { model
                | counter = 0
            }


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text (toString model) ]
        , button [ onClick Reset ] [ text "reset" ]
        , button [ onClick Decrement ] [ text "- decr" ]
        , button [ onClick Increment ] [ text "+ incr" ]
        ]
~~~

#HSLIDE

### Links

Organizations:
- https://github.com/elm-lang
- https://github.com/elm-community
- https://github.com/NoRedInk

People:
- https://github.com/evancz (Evan Czaplicki)
- https://github.com/rtfeldman (Richard Feldman)

Webpages:
- https://github.com/hastebrot/elm-playground
  - https://gitpitch.com/hastebrot/elm-playground/slides
- https://github.com/elm-lang/elm-platform#elm-platform
  - http://elm-lang.org/blog#release-notes
- https://guide.elm-lang.org/
  - https://learnxinyminutes.com/docs/elm/
  - https://github.com/evancz/elm-todomvc
- http://package.elm-lang.org/packages/elm-lang/core/latest
  - https://github.com/elm-lang/core/
- elm-conf Channel, https://www.youtube.com/channel/UCOpGiN9AkczVjlpGDaBwQrQ
  - "Making Impossible States Impossible" by Richard Feldman, https://www.youtube.com/watch?v=IcgmSRJHu_8

Tools:
- https://github.com/avh4/elm-format
- https://github.com/ElmCast/elm-oracle
- https://github.com/elm-community/elm-test
  - https://github.com/rtfeldman/node-test-runner
  - https://github.com/rtfeldman/html-test-runner
