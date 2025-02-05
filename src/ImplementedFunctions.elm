module ImplementedFunctions exposing
    ( boolAttributeFunctions
    , cssHelpers
    , htmlAttributeDict
    , htmlAttributes
    , htmlTags
    , htmlTagsDict
    , intAttributeFunctions
    , lookup
    , lookupWithDict
    , pseudoClasses
    , svgAttributes
    , svgTags
    , toCamelCase
    )

{-| Thank you mbylstra for the code from this repo: <https://github.com/mbylstra/html-to-elm/blob/c3c4b9a3f8c8c8b15150bd04f72ad89c4b11462e/elm-src/HtmlToElm/ElmHtmlWhitelists.elm>
-}

import Dict exposing (Dict)


lookup : List String -> String -> Maybe String
lookup list name =
    let
        lowerName : String
        lowerName =
            String.toLower name
    in
    find (\entry -> String.toLower entry == lowerName) list


lookupWithDict : Dict String String -> List String -> String -> Maybe String
lookupWithDict dict list name =
    case Dict.get name dict of
        Just retrieved ->
            Just retrieved

        Nothing ->
            let
                lowerName : String
                lowerName =
                    String.toLower name
            in
            find (\entry -> String.toLower entry == lowerName) list


find : (a -> Bool) -> List a -> Maybe a
find predicate list =
    case list of
        [] ->
            Nothing

        first :: rest ->
            if predicate first then
                Just first

            else
                find predicate rest


cssHelpers : List String
cssHelpers =
    [ "focus"
    , "group"
    , "hover"
    , "first"
    ]


pseudoClasses : Dict String String
pseudoClasses =
    Dict.fromList
        [ ( "first", "firstChild" )
        , ( "last", "lastChild" )
        , ( "even", "nthChild \"even\"" )
        , ( "odd", "nthChild \"odd\"" )
        ]


htmlTagsDict : Dict String String
htmlTagsDict =
    Dict.fromList
        [ ( "main", "main_" )
        ]


htmlTags : List String
htmlTags =
    [ "body"
    , "section"
    , "nav"
    , "article"
    , "aside"
    , "h1"
    , "h2"
    , "h3"
    , "h4"
    , "h5"
    , "h6"
    , "header"
    , "footer"
    , "address"
    , "p"
    , "hr"
    , "pre"
    , "blockquote"
    , "ol"
    , "ul"
    , "li"
    , "dl"
    , "dt"
    , "dd"
    , "figure"
    , "figcaption"
    , "div"
    , "a"
    , "em"
    , "strong"
    , "small"
    , "s"
    , "cite"
    , "q"
    , "dfn"
    , "abbr"
    , "time"
    , "code"
    , "var"
    , "samp"
    , "kbd"
    , "sub"
    , "sup"
    , "i"
    , "b"
    , "u"
    , "mark"
    , "ruby"
    , "rt"
    , "rp"
    , "bdi"
    , "bdo"
    , "span"
    , "br"
    , "wbr"
    , "ins"
    , "del"
    , "img"
    , "iframe"
    , "embed"
    , "object"
    , "param"
    , "video"
    , "audio"
    , "source"
    , "track"
    , "canvas"
    , "svg"
    , "math"
    , "table"
    , "caption"
    , "colgroup"
    , "col"
    , "tbody"
    , "thead"
    , "tfoot"
    , "tr"
    , "td"
    , "th"
    , "form"
    , "fieldset"
    , "legend"
    , "label"
    , "input"
    , "button"
    , "select"
    , "datalist"
    , "optgroup"
    , "option"
    , "textarea"
    , "keygen"
    , "output"
    , "progress"
    , "meter"
    , "details"
    , "summary"
    , "menuitem"
    , "menu"
    ]


svgTags : List String
svgTags =
    [ "animate"
    , "svg"
    , "animateColor"
    , "animateMotion"
    , "animateTransform"
    , "mpath"
    , "set"
    , "a"
    , "defs"
    , "g"
    , "marker"
    , "mask"
    , "pattern"
    , "switch"
    , "symbol"
    , "desc"
    , "metadata"
    , "title"
    , "feBlend"
    , "feColorMatrix"
    , "feComponentTransfer"
    , "feComposite"
    , "feConvolveMatrix"
    , "feDiffuseLighting"
    , "feDisplacementMap"
    , "feFlood"
    , "feFuncA"
    , "feFuncB"
    , "feFuncG"
    , "feFuncR"
    , "feGaussianBlur"
    , "feImage"
    , "feMerge"
    , "feMergeNode"
    , "feMorphology"
    , "feOffset"
    , "feSpecularLighting"
    , "feTile"
    , "feTurbulence"
    , "font"
    , "linearGradient"
    , "radialGradient"
    , "stop"
    , "circle"
    , "ellipse"
    , "image"
    , "line"
    , "path"
    , "polygon"
    , "polyline"
    , "rect"
    , "use"
    , "feDistantLight"
    , "fePointLight"
    , "feSpotLight"
    , "altGlyph"
    , "altGlyphDef"
    , "altGlyphItem"
    , "glyph"
    , "glyphRef"
    , "textPath"
    , "text_"
    , "tref"
    , "tspan"
    , "clipPath"
    , "colorProfile"
    , "cursor"
    , "filter"
    , "style"
    , "view"
    ]


htmlAttributeDict : Dict String String
htmlAttributeDict =
    Dict.fromList [ ( "type", "type_" ) ]


htmlAttributes : List String
htmlAttributes =
    [ "key"
    , -- "style",   -- style is disabled as it requires special parsing
      "class"
    , "classList"
    , "id"
    , "title"
    , "type_"
    , "value"
    , "placeholder"
    , "accept"
    , "acceptCharset"
    , "action"
    , "autosave"
    , "enctype"
    , "formaction"
    , "list"
    , "method"
    , "name"
    , "pattern"
    , "for"
    , "form"
    , "max"
    , "min"
    , "step"
    , "wrap"
    , "href"
    , "target"
    , "downloadAs"
    , "hreflang"
    , "media"
    , "ping"
    , "rel"
    , "usemap"
    , "shape"
    , "coords"
    , "src"
    , "alt"
    , "preload"
    , "poster"
    , "kind"
    , "srclang"
    , "sandbox"
    , "srcdoc"
    , "align"
    , "headers"
    , "scope"
    , "charset"
    , "content"
    , "httpEquiv"
    , "language"
    , "accesskey"
    , "contextmenu"
    , "dir"
    , "draggable"
    , "dropzone"
    , "itemprop"
    , "lang"
    , "challenge"
    , "keytype"
    , "cite"
    , "datetime"
    , "pubdate"
    , "manifest"
    , "property"
    , "attribute"
    ]


svgAttributes : List String
svgAttributes =
    [ "accent-height"
    , "accelerate"
    , "accumulate"
    , "additive"
    , "alphabetic"
    , "allowReorder"
    , "amplitude"
    , "arabic-form"
    , "ascent"
    , "attributeName"
    , "attributeType"
    , "autoReverse"
    , "azimuth"
    , "baseFrequency"
    , "baseProfile"
    , "bbox"
    , "begin"
    , "bias"
    , "by"
    , "calcMode"
    , "cap-height"
    , "class"
    , "clipPathUnits"
    , "contentScriptType"
    , "contentStyleType"
    , "cx"
    , "cy"
    , "d"
    , "decelerate"
    , "descent"
    , "diffuseConstant"
    , "divisor"
    , "dur"
    , "dx"
    , "dy"
    , "edgeMode"
    , "elevation"
    , "end"
    , "exponent"
    , "externalResourcesRequired"
    , "filterRes"
    , "filterUnits"
    , "format"
    , "from"
    , "fx"
    , "fy"
    , "g1"
    , "g2"
    , "glyph-name"
    , "glyphRef"
    , "gradientTransform"
    , "gradientUnits"
    , "hanging"
    , "height"
    , "horiz-adv-x"
    , "horiz-origin-x"
    , "horiz-origin-y"
    , "id"
    , "ideographic"
    , "in"
    , "in2"
    , "intercept"
    , "k"
    , "k1"
    , "k2"
    , "k3"
    , "k4"
    , "kernelMatrix"
    , "kernelUnitLength"
    , "keyPoints"
    , "keySplines"
    , "keyTimes"
    , "lang"
    , "lengthAdjust"
    , "limitingConeAngle"
    , "local"
    , "markerHeight"
    , "markerUnits"
    , "markerWidth"
    , "maskContentUnits"
    , "maskUnits"
    , "mathematical"
    , "max"
    , "media"
    , "method"
    , "min"
    , "mode"
    , "name"
    , "numOctaves"
    , "offset"
    , "operator"
    , "order"
    , "orient"
    , "orientation"
    , "origin"
    , "overline-position"
    , "overline-thickness"
    , "panose-1"
    , "path"
    , "pathLength"
    , "patternContentUnits"
    , "patternTransform"
    , "patternUnits"
    , "point-order"
    , "points"
    , "pointsAtX"
    , "pointsAtY"
    , "pointsAtZ"
    , "preserveAlpha"
    , "preserveAspectRatio"
    , "primitiveUnits"
    , "r"
    , "radius"
    , "refX"
    , "refY"
    , "rendering-intent"
    , "repeatCount"
    , "repeatDur"
    , "requiredExtensions"
    , "requiredFeatures"
    , "restart"
    , "result"
    , "rotate"
    , "rx"
    , "ry"
    , "scale"
    , "seed"
    , "slope"
    , "spacing"
    , "specularConstant"
    , "specularExponent"
    , "speed"
    , "spreadMethod"
    , "startOffset"
    , "stdDeviation"
    , "stemh"
    , "stemv"
    , "stitchTiles"
    , "strikethrough-position"
    , "strikethrough-thickness"
    , "string"
    , "style"
    , "surfaceScale"
    , "systemLanguage"
    , "tableValues"
    , "target"
    , "targetX"
    , "targetY"
    , "textLength"
    , "title"
    , "to"
    , "transform"
    , "type"
    , "u1"
    , "u2"
    , "underline-position"
    , "underline-thickness"
    , "unicode"
    , "unicode-range"
    , "units-per-em"
    , "v-alphabetic"
    , "v-hanging"
    , "v-ideographic"
    , "v-mathematical"
    , "values"
    , "version"
    , "vert-adv-y"
    , "vert-origin-x"
    , "vert-origin-y"
    , "viewBox"
    , "viewTarget"
    , "width"
    , "widths"
    , "x"
    , "x-height"
    , "x1"
    , "x2"
    , "xChannelSelector"
    , "y"
    , "y1"
    , "y2"
    , "yChannelSelector"
    , "z"
    , "zoomAndPan"
    , "alignment-baseline"
    , "baseline-shift"
    , "clip-path"
    , "clip-rule"
    , "clip"
    , "color-interpolation-filters"
    , "color-interpolation"
    , "color-profile"
    , "color-rendering"
    , "color"
    , "cursor"
    , "direction"
    , "display"
    , "dominant-baseline"
    , "enable-background"
    , "fill-opacity"
    , "fill-rule"
    , "fill"
    , "filter"
    , "flood-color"
    , "flood-opacity"
    , "font-family"
    , "font-size-adjust"
    , "font-size"
    , "font-stretch"
    , "font-style"
    , "font-variant"
    , "font-weight"
    , "glyph-orientation-horizontal"
    , "glyph-orientation-vertical"
    , "image-rendering"
    , "kerning"
    , "letter-spacing"
    , "lighting-color"
    , "marker-end"
    , "marker-mid"
    , "marker-start"
    , "mask"
    , "opacity"
    , "overflow"
    , "pointer-events"
    , "shape-rendering"
    , "stop-color"
    , "stop-opacity"
    , "stroke-dasharray"
    , "stroke-dashoffset"
    , "stroke-linecap"
    , "stroke-linejoin"
    , "stroke-miterlimit"
    , "stroke-opacity"
    , "stroke-width"
    , "stroke"
    , "text-anchor"
    , "text-decoration"
    , "text-rendering"
    , "unicode-bidi"
    , "visibility"
    , "word-spacing"
    , "writing-mode"
    ]


toCamelCase : String -> String
toCamelCase name =
    case name |> String.split "-" of
        [] ->
            ""

        head :: tail ->
            tail
                |> List.map capitalize
                |> (::) head
                |> String.join ""


capitalize : String -> String
capitalize string =
    case String.uncons string of
        Just ( headChar, tailString ) ->
            String.cons (Char.toUpper headChar) tailString

        Nothing ->
            string


boolAttributeFunctions : List String
boolAttributeFunctions =
    [ "hidden"
    , "contenteditable"
    , "spellcheck"
    , "autoplay"
    , "controls"
    , "loop"
    , "default"
    , "checked"
    , "selected"
    , "autofocus"
    , "disabled"
    , "multiple"
    , "novalidate"
    , "readonly"
    , "required"
    , "ismap"
    , "reversed"
    ]


intAttributeFunctions : List String
intAttributeFunctions =
    [ "tabindex"
    , "height"
    , "width"
    , "minlength"
    , "maxlength"
    , "size"
    , "cols"
    , "rows"
    , "start"
    , "colspan"
    , "rowspan"
    ]
