{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE LambdaCase                 #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE StandaloneDeriving         #-}


module Data.CSS.Style
  ( AlignContent (..)
  , StyleProperty (..)
  ) where


import Data.Maybe (maybeToList)
import Data.String
import Data.Text
import GHC.Generics


class ToCSS a where
  toCSS :: a -> Text


instance ToCSS Text where
  toCSS = id


instance ToCSS [Text] where
  toCSS = listToCSS


instance ToCSS Int where
  toCSS = pack . show


instance ToCSS Double where
  toCSS = pack . show


listToCSS :: ToCSS a => [a] -> Text
listToCSS = intercalate ", " . fmap toCSS


maybeToCSS :: ToCSS a => Maybe a -> Text
maybeToCSS Nothing = ""
maybeToCSS (Just x) = toCSS x


data AlignContent = AlignContentStart
                  | AlignContentEnd
                  | AlignContentFlexStart
                  | AlignContentFlexEnd
                  | AlignContentCenter
                  | AlignContentNormal
                  | AlignContentBaseline
                  | AlignContentFirstBaseline
                  | AlignContentLastBaseline
                  | AlignContentSpaceBetween
                  | AlignContentSpaceAround
                  | AlignContentSpaceEvenly
                  | AlignContentStretch
                  | AlignContentSafe
                  | AlignContentUnsafe
                  | AlignContentInherit
                  | AlignContentInitial
                  | AlignContentUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS AlignContent where
  toCSS = \case
    AlignContentStart -> "start"
    AlignContentEnd -> "end"
    AlignContentFlexStart -> "flex-start"
    AlignContentFlexEnd -> "flex-end"
    AlignContentCenter -> "center"
    AlignContentNormal -> "normal"
    AlignContentBaseline -> "baseline"
    AlignContentFirstBaseline -> "first baseline"
    AlignContentLastBaseline -> "last baseline"
    AlignContentSpaceBetween -> "space-between"
    AlignContentSpaceAround -> "space-around"
    AlignContentSpaceEvenly -> "space-evenly"
    AlignContentStretch -> "stretch"
    AlignContentSafe -> "safe"
    AlignContentUnsafe -> "unsafe"
    AlignContentInherit -> "inherit"
    AlignContentInitial -> "initial"
    AlignContentUnset -> "unset"


data AlignItems = AlignItemsNormal
                | AlignItemsStretch
                | AlignItemsCenter
                | AlignItemsStart
                | AlignItemsEnd
                | AlignItemsFlexStart
                | AlignItemsFlexEnd
                | AlignItemsBaseline
                | AlignItemsFirstBaseline
                | AlignItemsLastBaseline
                | AlignItemsSafeCenter
                | AlignItemsUnsafeCenter
                | AlignItemsInherit
                | AlignItemsInitial
                | AlignItemsUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS AlignItems where
  toCSS = \case
    AlignItemsNormal -> "normal"
    AlignItemsStretch -> "stretch"
    AlignItemsCenter -> "center"
    AlignItemsStart -> "start"
    AlignItemsEnd -> "end"
    AlignItemsFlexStart -> "flex-start"
    AlignItemsFlexEnd -> "flex-end"
    AlignItemsBaseline -> "baseline"
    AlignItemsFirstBaseline -> "first baseline"
    AlignItemsLastBaseline -> "last baseline"
    AlignItemsSafeCenter -> "safe center"
    AlignItemsUnsafeCenter -> "unsafe center"
    AlignItemsInherit -> "inherit"
    AlignItemsInitial -> "initial"
    AlignItemsUnset -> "unset"


data AlignSelf = AlignSelfAuto
               | AlignSelfNormal
               | AlignSelfCenter
               | AlignSelfStart
               | AlignSelfEnd
               | AlignSelfSelfStart
               | AlignSelfSelfEnd
               | AlignSelfFlexStart
               | AlignSelfFlexEnd
               | AlignSelfBaseline
               | AlignSelfFirstBaseline
               | AlignSelfLastBaseline
               | AlignSelfStretch
               | AlignSelfSafeCenter
               | AlignSelfUnsafeCenter
               | AlignSelfInherit
               | AlignSelfInitial
               | AlignSelfUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS AlignSelf where
  toCSS = \case
    AlignSelfAuto -> "auto"
    AlignSelfNormal -> "normal"
    AlignSelfCenter -> "center"
    AlignSelfStart -> "start"
    AlignSelfEnd -> "end"
    AlignSelfSelfStart -> "self-start"
    AlignSelfSelfEnd -> "self-end"
    AlignSelfFlexStart -> "flex-start"
    AlignSelfFlexEnd -> "flex-end"
    AlignSelfBaseline -> "baseline"
    AlignSelfFirstBaseline -> "first baseline"
    AlignSelfLastBaseline -> "last baseline"
    AlignSelfStretch -> "stretch"
    AlignSelfSafeCenter -> "safe center"
    AlignSelfInherit -> "inherit"
    AlignSelfInitial -> "initial"
    AlignSelfUnset -> "unset"


data All = AllUnset
         | AllInitial
         | AllInherit
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS All where
  toCSS = \case
    AllUnset -> "unset"
    AllInitial -> "initial"
    AllInherit -> "inherit"


data Duration = Seconds Int
              | Milliseconds Int
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Duration where
  toCSS = \case
    Seconds n -> toCSS n <> "s"
    Milliseconds n -> toCSS n <> "ms"


instance ToCSS [Duration] where
  toCSS = listToCSS


data AnimationDirection =
    AnimationDirectionNormal
  | AnimationDirectionReverse
  | AnimationDirectionAlternate
  | AnimationDirectionAlternateReverse
  | AnimationDirectionInherit
  | AnimationDirectionInitial
  | AnimationDirectionUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS AnimationDirection where
  toCSS = \case
    AnimationDirectionNormal -> "normal"
    AnimationDirectionReverse -> "reverse"
    AnimationDirectionAlternate -> "alternate"
    AnimationDirectionAlternateReverse -> "alternate-reverse"
    AnimationDirectionInitial -> "initial"
    AnimationDirectionInherit -> "inherit"
    AnimationDirectionUnset -> "unset"

instance ToCSS [AnimationDirection] where
  toCSS = listToCSS


data AnimationFillMode =
    AnimationFillModeNone
  | AnimationFillModeForwards
  | AnimationFillModeBackwards
  | AnimationFillModeBoth
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS AnimationFillMode where
  toCSS = \case
    AnimationFillModeNone -> "none"
    AnimationFillModeForwards -> "forwards"
    AnimationFillModeBackwards -> "backwards"
    AnimationFillModeBoth -> "both"

instance ToCSS [AnimationFillMode] where
  toCSS = listToCSS


data AnimationIterationCount =
    AnimationCountInfinite
  | AnimationCountFinite Double
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS AnimationIterationCount where
  toCSS = \case
    AnimationCountInfinite -> "infinite"
    AnimationCountFinite x -> toCSS x

instance ToCSS [AnimationIterationCount] where
  toCSS = listToCSS


data AnimationName =
    AnimationNames [Text]
  | AnimationNameInitial
  | AnimationNameInherit
  | AnimationNameUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS AnimationName where
  toCSS = \case
    AnimationNames x -> toCSS x
    AnimationNameInitial -> "initial"
    AnimationNameInherit -> "inherit"
    AnimationNameUnset -> "unset"


data PausedOrRunning = Paused | Running
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS PausedOrRunning where
  toCSS = \case
    Paused -> "paused"
    Running -> "running"

instance ToCSS [PausedOrRunning] where
  toCSS = listToCSS


data AnimationPlayState =
    AnimationPlayStates [PausedOrRunning]
  | AnimationPlayStateInherit
  | AnimationPlayStateInitial
  | AnimationPlayStateUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS AnimationPlayState where
  toCSS = \case
    AnimationPlayStates x -> toCSS x
    AnimationPlayStateInherit -> "inherit"
    AnimationPlayStateInitial -> "initial"
    AnimationPlayStateUnset -> "unset"


data JumpTerm =
    JumpStart
  | JumpEnd
  | JumpNone
  | JumpBoth
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS JumpTerm where
  toCSS = \case
    JumpStart -> "start"
    JumpEnd -> "end"
    JumpBoth -> "both"
    JumpNone -> "none"


data AnimationTimingFunction =
    AnimationTimingEase
  | AnimationTimingLinear
  | AnimationTimingEaseIn
  | AnimationTimingEaseOut
  | AnimationTimingEaseInOut
  | AnimationTimingCubicBezier Double Double Double Double
  | AnimationTimingSteps Int JumpTerm
  | AnimationTimingStepStart
  | AnimationTimingStepEnd
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS AnimationTimingFunction where
  toCSS = \case
    AnimationTimingEase -> "ease"
    AnimationTimingLinear -> "linear"
    AnimationTimingEaseIn -> "ease-in"
    AnimationTimingEaseOut -> "ease-out"
    AnimationTimingEaseInOut -> "ease-in-out"
    AnimationTimingCubicBezier p1 p2 p3 p4 ->
      "cubic-bezier("
      <> intercalate ", " (toCSS <$> [p1, p2, p3, p4])
      <> ")"
    AnimationTimingSteps n term ->
      "steps(" <> toCSS n <> ", " <> toCSS term <> ")"
    AnimationTimingStepStart -> "step-start"
    AnimationTimingStepEnd -> "step-end"

instance ToCSS [AnimationTimingFunction] where
  toCSS = listToCSS


data Length = CapHeight Double
            | ZeroMeasure Double
            | Em Double
            | Ex Double
            | Ic Double
            | Lh Double
            | Rem Double
            | Rlh Double
            | Vh Double
            | Vw Double
            | Vi Double
            | Vb Double
            | Vmin Double
            | Vmax Double
            | Px Double
            | Cm Double
            | Mm Double
            | Qmm Double
            | Inch Double
            | Pica Double
            | Point Double
            | Zero
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Length where
  toCSS = \case
    CapHeight x -> toCSS x <> "cap"
    ZeroMeasure x -> toCSS x <> "ch"
    Em x -> toCSS x <> "em"
    Ex x -> toCSS x <> "ex"
    Ic x -> toCSS x <> "ic"
    Lh x -> toCSS x <> "lh"
    Rem x -> toCSS x <> "rem"
    Rlh x -> toCSS x <> "rlh"
    Vh x -> toCSS x <> "vh"
    Vw x -> toCSS x <> "vw"
    Vi x -> toCSS x <> "vi"
    Vb x -> toCSS x <> "vb"
    Vmin x -> toCSS x <> "vmin"
    Vmax x -> toCSS x <> "vmax"
    Px x -> toCSS x <> "px"
    Cm x -> toCSS x <> "cm"
    Mm x -> toCSS x <> "mm"
    Qmm x -> toCSS x <> "Q"
    Inch x -> toCSS x <> "in"
    Pica x -> toCSS x <> "pc"
    Point x -> toCSS x <> "pt"
    Zero -> "0"


newtype Percent = Percent Double
  deriving (Eq, Ord, Num, Fractional, Real, RealFrac, Floating, RealFloat, Generic, Read, Show, ToCSS)


data Dimension =
    LengthDim Length
  | PercentDim Percent
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Dimension where
  toCSS = \case
    LengthDim x -> toCSS x
    PercentDim x -> toCSS x <> "%"


data Color = RGB Double Double Double
           | RGBA Double Double Double Double
           | HSL Double Double Double
           | HSLA Double Double Double Double
           | HexColor Text
           | UnsetColor
           | InheritColor
           | InitialColor
           | CurrentColor
           | Transparent
           | Black
           | Silver
           | Gray
           | White
           | Maroon
           | Red
           | Purple
           | Fuschia
           | Green
           | Lime
           | Olive
           | Yellow
           | Navy
           | Blue
           | Teal
           | Aqua
           | Orange
           | AliceBlue
           | AntiqueWhite
           | Aquamarine
           | Azure
           | Beige
           | Bisque
           | BlanchedAlmond
           | BlueViolet
           | Brown
           | BurlyWood
           | CadetBlue
           | Chartreuse
           | Chocolate
           | Coral
           | CornflowerBlue
           | Cornsilk
           | Crimson
           | Cyan
           | DarkBlue
           | DarkCyan
           | DarkGoldenrod
           | DarkGray
           | DarkGreen
           | DarkGrey
           | DarkKhaki
           | DarkMagenta
           | DarkOliveGreen
           | DarkOrange
           | DarkOrchid
           | DarkRed
           | DarkSalmon
           | DarkSeaGreen
           | DarkSlateBlue
           | DarkSlateGrey
           | DarkTurquoise
           | DarkViolet
           | DeepPink
           | DeepSkyBlue
           | DimGray
           | DimGrey
           | DodgerBlue
           | Firebrick
           | FloralWhite
           | ForestGreen
           | Gainsboro
           | GhostWhite
           | Gold
           | Goldenrod
           | GreenYellow
           | Grey
           | Honeydew
           | HotPink
           | IndianRed
           | Indigo
           | Ivory
           | Khaki
           | Lavender
           | LavenderBlush
           | LawnGreen
           | LemonChiffon
           | LightBlue
           | LightCoral
           | LightGoldenrodYellow
           | LightGray
           | LightGreen
           | LightGrey
           | LightPink
           | LightSalmon
           | LightSeaGreen
           | LightSkyBlue
           | LightSlateGray
           | LightSlateGrey
           | LightSteelBlue
           | LightYellow
           | LimeGreen
           | Linen
           | Magenta
           | MediumAquamarine
           | MediumBlue
           | MediumOrchid
           | MediumPurple
           | MediumSeaGreen
           | MediumSlateBlue
           | MediumSpringGreen
           | MediumTurquoise
           | MediumVioletRed
           | MidnightBlue
           | MintCream
           | MistyRose
           | Moccasin
           | NavajoWhite
           | OldLace
           | OliveDrab
           | OrangeRed
           | Orchid
           | PaleGoldenrod
           | PaleGreen
           | PaleTurquoise
           | PaleVioletRed
           | PapayaWhip
           | PeachPuff
           | Peru
           | Pink
           | Plum
           | PowderBlue
           | RosyBrown
           | RoyalBlue
           | SaddleBrown
           | Salmon
           | SandyBrown
           | SeaGreen
           | Seashell
           | Sienna
           | SkyBlue
           | SlateBlue
           | SlateGray
           | SlateGrey
           | Snow
           | SpringGreen
           | SteelBlue
           | Tan
           | Thistle
           | Tomato
           | Turquoise
           | Violet
           | Wheat
           | WhiteSmoke
           | YellowGreen
           | RebeccaPurple
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Color where
  toCSS = \case
    RGB r g b -> "rgb(" <> intercalate ", " (toCSS <$> [r, g, b]) <> ")"
    RGBA r g b a -> "rgba(" <> intercalate ", " (toCSS <$> [r, g, b, a]) <> ")"
    HSL h s l -> "hsl(" <> intercalate ", " (toCSS <$> [h, s, l]) <> ")"
    HSLA h s l a -> "hsla(" <> intercalate ", " (toCSS <$> [h, s, l, a]) <> ")"
    HexColor x -> "#" <> x
    Transparent -> "transparent"
    InitialColor -> "initial"
    InheritColor -> "inherit"
    UnsetColor -> "unset"
    CurrentColor -> "currentColor"
    Black -> "black"
    Silver -> "silver"
    Gray -> "gray"
    Grey -> "grey"
    White -> "white"
    Maroon -> "maroon"
    Red -> "red"
    Purple -> "purple"
    Fuschia -> "fuschia"
    Green -> "green"
    Lime -> "lime"
    Olive -> "olive"
    Yellow -> "yellow"
    Navy -> "navy"
    Blue -> "blue"
    Teal -> "teal"
    Aqua -> "aqua"
    Orange -> "orange"
    AliceBlue -> "aliceblue"
    AntiqueWhite -> "antiquewhite"
    Aquamarine -> "aquamarine"
    Azure -> "azure"
    Beige -> "beige"
    Bisque -> "bisque"
    BlanchedAlmond -> "blanchedalmond"
    BlueViolet -> "blueviolet"
    Brown -> "brown"
    BurlyWood -> "burlywood"
    CadetBlue -> "cadetblue"
    Chartreuse -> "chartreuse"
    Chocolate -> "chocolate"
    Coral -> "coral"
    CornflowerBlue -> "cornflowerblue"
    Cornsilk -> "cornsilk"
    Crimson -> "crimson"
    Cyan -> "cyan"
    DarkBlue -> "darkblue"
    DarkCyan -> "darkcyan"
    DarkGoldenrod -> "darkgoldenrod"
    DarkGray -> "darkgray"
    DarkGreen -> "darkgreen"
    DarkGrey -> "darkgrey"
    DarkKhaki -> "darkkhaki"
    DarkMagenta -> "darkmagenta"
    DarkOliveGreen -> "darkolivegreen"
    DarkOrange -> "darkorange"
    DarkOrchid -> "darkorchid"
    DarkRed -> "darkred"
    DarkSalmon -> "darksalmon"
    DarkSeaGreen -> "darkseagreen"
    DarkSlateBlue -> "darkslateblue"
    DarkSlateGrey -> "darkslategrey"
    DarkTurquoise -> "darkturquoise"
    DarkViolet -> "darkviolet"
    DeepPink -> "deeppink"
    DeepSkyBlue -> "deepskyblue"
    DimGray -> "dimgray"
    DimGrey -> "dimgrey"
    DodgerBlue -> "dodgerblue"
    Firebrick -> "firebrick"
    FloralWhite -> "floralwhite"
    ForestGreen -> "forestgreen"
    Gainsboro -> "gainsboro"
    GhostWhite -> "ghostwhite"
    Gold -> "gold"
    Goldenrod -> "goldenrod"
    GreenYellow -> "greenyellow"
    Honeydew -> "honeydew"
    HotPink -> "hotpink"
    IndianRed -> "indianred"
    Indigo -> "indigo"
    Ivory -> "ivory"
    Khaki -> "khaki"
    Lavender -> "lavender"
    LavenderBlush -> "lavenderblush"
    LawnGreen -> "lawngreen"
    LemonChiffon -> "lemonchiffon"
    LightBlue -> "lightblue"
    LightCoral -> "lightcoral"
    LightGoldenrodYellow -> "lightgoldenrodyellow"
    LightGray -> "lightgray"
    LightGreen -> "lightgreen"
    LightPink -> "lightpink"
    LightSalmon -> "lightsalmon"
    LightSeaGreen -> "lightseagreen"
    LightSkyBlue -> "lightskyblue"
    LightSlateGray -> "lightslategray"
    LightSlateGrey -> "lightslategrey"
    LightSteelBlue -> "lightsteelblue"
    LightYellow -> "lightyellow"
    LimeGreen -> "limegreen"
    Linen -> "linen"
    Magenta -> "magenta"
    MediumAquamarine -> "mediumaquamarine"
    MediumBlue -> "mediumblue"
    MediumOrchid -> "mediumorchid"
    MediumPurple -> "mediumpurple"
    MediumSeaGreen -> "mediumseagreen"
    MediumSlateBlue -> "mediumslateblue"
    MediumSpringGreen -> "mediumspringgreen"
    MediumTurquoise -> "mediumturquoise"
    MediumVioletRed -> "mediumvioletred"
    MidnightBlue -> "midnightblue"
    MintCream -> "mintcream"
    MistyRose -> "mistyrose"
    Moccasin -> "moccasin"
    NavajoWhite -> "navajowhite"
    OldLace -> "oldlace"
    OliveDrab -> "olivedrab"
    OrangeRed -> "orangered"
    Orchid -> "orchid"
    PaleGoldenrod -> "palegoldenrod"
    PaleGreen -> "palegreen"
    PaleTurquoise -> "paleturquoise"
    PaleVioletRed -> "palevioletred"
    PapayaWhip -> "papayawhip"
    PeachPuff -> "peachpuff"
    Peru -> "peru"
    Pink -> "pink"
    Plum -> "plum"
    PowderBlue -> "powderblue"
    RosyBrown -> "rosybrown"
    RoyalBlue -> "royalblue"
    SaddleBrown -> "saddlebrown"
    Salmon -> "salmon"
    SandyBrown -> "sandybrown"
    SeaGreen -> "seagreen"
    Seashell -> "seashell"
    Sienna -> "sienna"
    SkyBlue -> "skyblue"
    SlateBlue -> "slateblue"
    SlateGray -> "slategray"
    SlateGrey -> "slategrey"
    Snow -> "snow"
    SpringGreen -> "springgreen"
    SteelBlue -> "steelblue"
    Tan -> "tan"
    Thistle -> "thistle"
    Tomato -> "tomato"
    Turquoise -> "turquoise"
    Violet -> "violet"
    Wheat -> "wheat"
    WhiteSmoke -> "whitesmoke"
    YellowGreen -> "yellowgreen"
    RebeccaPurple -> "rebeccapurple"


newtype Brightness = Brightness Double
  deriving (Eq, Ord, Num, Fractional, Real, RealFrac, Floating, RealFloat, Generic, Read, Show, ToCSS)


newtype Contrast = Contrast Double
  deriving (Eq, Ord, Num, Fractional, Real, RealFrac, Floating, RealFloat, Generic, Read, Show, ToCSS)


newtype Proportion = Proportion Double
  deriving (Eq, Ord, Num, Fractional, Real, RealFrac, Floating, RealFloat, Generic, Read, Show, ToCSS)


data Angle = AngleZero
           | AngleDegrees Double
           | AngleTurns Double
           | AngleRadians Double
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Angle where
  toCSS = \case
    AngleZero -> "0"
    AngleDegrees x -> toCSS x <> "deg"
    AngleTurns x -> toCSS x <> "turn"
    AngleRadians x -> toCSS x <> "rad"


data FilterFunction =
    FilterBlur Length
  | FilterBrightness Brightness
  | FilterContrast Contrast
  | FilterDropShadow
    { dropShadowOffsetX    :: Length
    , dropShadowOffsetY    :: Length
    , dropShadowBlurRadius :: Length
    , dropShadowColor      :: Color }
  | FilterGrayscale Proportion
  | FilterHueRotate Angle
  | FilterInvert Proportion
  | FilterOpacity Proportion
  | FilterSaturate Proportion
  | FilterSepia Proportion
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS FilterFunction where
  toCSS = \case
    FilterBlur x -> "blur(" <> toCSS x <> ")"
    FilterBrightness x -> "brightness(" <> toCSS x <> ")"
    FilterContrast x -> "contrast(" <> toCSS x <> ")"
    FilterDropShadow ox oy r c -> "drop-shadow("
     <> toCSS ox <> " " <> toCSS oy <> " " <> toCSS r
     <> " " <> toCSS c <> ")"
    FilterGrayscale x -> "grayscale(" <> toCSS x <> ")"
    FilterHueRotate x -> "hue-rotate(" <> toCSS x <> ")"
    FilterInvert x -> "invert(" <> toCSS x <> ")"
    FilterOpacity x -> "opacity(" <> toCSS x <> ")"
    FilterSaturate x -> "saturate(" <> toCSS x <> ")"
    FilterSepia x -> "sepia(" <> toCSS x <> ")"

instance ToCSS [FilterFunction] where
  toCSS = intercalate " " . fmap toCSS


newtype FilterUrl = FilterUrl Text
  deriving (Eq, Ord, Generic, Read, Show, IsString)

instance ToCSS FilterUrl where
  toCSS (FilterUrl x) = "url(\"" <> x <> "\")"


data Filter = FilterFunctions [FilterFunction]
            | SVGFilter FilterUrl
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Filter where
  toCSS = \case
    FilterFunctions x -> toCSS x
    SVGFilter x -> toCSS x


data Visibility = Visible
                | Hidden
                | Inherit
                | Initial
                | Unset
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS Visibility where
  toCSS = \case
    Visible -> "visible"
    Hidden -> "hidden"
    Inherit -> "inherit"
    Initial -> "initial"
    Unset -> "unset"


data BackgroundAttachment = Scroll | Fixed | Local
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS BackgroundAttachment where
  toCSS = \case
    Scroll -> "scroll"
    Fixed -> "fixed"
    Local -> "local"


data BackgroundAttachments =
    BackgroundAttachments [BackgroundAttachment]
  | BackgroundAttachmentInherit
  | BackgroundAttachmentInitial
  | BackgroundAttachmentUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS BackgroundAttachments where
  toCSS = \case
    BackgroundAttachments x -> listToCSS x
    BackgroundAttachmentInherit -> "inherit"
    BackgroundAttachmentInitial -> "initial"
    BackgroundAttachmentUnset -> "unset"


data BlendMode = BlendModeNormal
               | BlendModeMultiply
               | BlendModeScreen
               | BlendModeOverlay
               | BlendModeDarken
               | BlendModeLighten
               | BlendModeColorDodge
               | BlendModeColorBurn
               | BlendModeHardLight
               | BlendModeSoftLight
               | BlendModeDifference
               | BlendModeExclusion
               | BlendModeHue
               | BlendModeSaturation
               | BlendModeColor
               | BlendModeLuminosity
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS BlendMode where
  toCSS = \case
    BlendModeNormal -> "normal"
    BlendModeMultiply -> "multiply"
    BlendModeScreen -> "screen"
    BlendModeOverlay -> "overlay"
    BlendModeDarken -> "darken"
    BlendModeLighten -> "lighten"
    BlendModeColorDodge -> "color-dodge"
    BlendModeColorBurn -> "color-burn"
    BlendModeHardLight -> "hard-light"
    BlendModeSoftLight -> "soft-light"
    BlendModeDifference -> "difference"
    BlendModeExclusion -> "exclusion"
    BlendModeHue -> "hue"
    BlendModeSaturation -> "saturation"
    BlendModeColor -> "color"
    BlendModeLuminosity -> "luminosity"


data BlendModes =
    BlendModes [BlendMode]
  | BlendModeInitial
  | BlendModeInherit
  | BlendModeUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS BlendModes where
  toCSS = \case
    BlendModes x -> listToCSS x
    BlendModeInitial -> "initial"
    BlendModeInherit -> "inherit"
    BlendModeUnset -> "unset"


data BackgroundClip =
    BackgroundClipBorderBox
  | BackgroundClipPaddingBox
  | BackgroundClipContentBox
  | BackgroundClipText
  | BackgroundClipInherit
  | BackgroundClipInitial
  | BackgroundClipUnset
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS BackgroundClip where
  toCSS = \case
    BackgroundClipBorderBox -> "border-box"
    BackgroundClipPaddingBox -> "padding-box"
    BackgroundClipContentBox -> "content-box"
    BackgroundClipText -> "text"
    BackgroundClipInitial -> "initial"
    BackgroundClipInherit -> "inherit"
    BackgroundClipUnset -> "unset"


data BackgroundOrigin =
    BackgroundOriginBorderBox
  | BackgroundOriginPaddingBox
  | BackgroundOriginInherit
  | BackgroundOriginInitial
  | BackgroundOriginUnset
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS BackgroundOrigin where
  toCSS = \case
    BackgroundOriginBorderBox -> "border-box"
    BackgroundOriginPaddingBox -> "padding-box"
    BackgroundOriginInherit -> "inherit"
    BackgroundOriginInitial -> "initial"
    BackgroundOriginUnset -> "unset"


newtype ImageUrl = ImageUrl Text
  deriving (Eq, Ord, Generic, Read, Show, IsString)

instance ToCSS ImageUrl where
  toCSS (ImageUrl x) = "url(\"" <> x <> "\")"


data LeftOrRight = Left' | Right'
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS LeftOrRight where
  toCSS = \case
    Left' -> "left"
    Right' -> "right"


data TopOrBottom = Top | Bottom
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS TopOrBottom where
  toCSS = \case
    Top -> "top"
    Bottom -> "bottom"


data GradientAngle =
    GradientAngle Angle
  | GradientTo (Maybe LeftOrRight) (Maybe TopOrBottom)
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS GradientAngle where
  toCSS = \case
    GradientAngle x -> toCSS x
    GradientTo lr tb -> "to " <> maybeToCSS lr 
                       <> " " <> maybeToCSS tb


data LinearColorStop = LinearColorStop
                     { lcsColor :: Color
                     , lcsStop0 :: Maybe Dimension
                     , lcsStop1 :: Maybe Dimension }
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS LinearColorStop where
  toCSS (LinearColorStop c s0 s1) = toCSS c <> " "
    <> maybeToCSS s0 <> " " <> maybeToCSS s1


data AngularColorStop = AngularColorStop
                      { acsColor :: Color
                      , acsStop0 :: Maybe Dimension
                      , acsStop1 :: Maybe Dimension }
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS AngularColorStop where
  toCSS (AngularColorStop c s0 s1) = toCSS c <> " "
    <> maybeToCSS s0 <> " " <> maybeToCSS s1


data Position0 = PositionTop
               | PositionBottom
               | PositionLeft
               | PositionRight
               | PositionCenter
               | PositionDim Dimension
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Position0 where
  toCSS = \case
    PositionTop -> "top"
    PositionBottom -> "bottom"
    PositionLeft -> "left"
    PositionRight -> "right"
    PositionCenter -> "center"
    PositionDim x -> toCSS x


data Position = Position1 Position0
              | Position2 Position0 Position0
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Position where
  toCSS = \case
    Position1 x -> toCSS x
    Position2 x y -> toCSS x <> " " <> toCSS y


data Positions = Positions [Position]
               | PositionsInherit
               | PositionsUnset
               | PositionsInitial
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Positions where
  toCSS = \case
    Positions x -> listToCSS x
    PositionsInherit -> "inherit"
    PositionsInitial -> "initial"
    PositionsUnset -> "unset"


data RadialShape = Circle | Ellipse
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS RadialShape where
  toCSS = \case
    Circle -> "circle"
    Ellipse -> "ellipse"


data RadialShapeExtent =
  ClosestSide | ClosestCorner | FarthestSide | FarthestCorner
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS RadialShapeExtent where
  toCSS = \case
    ClosestSide -> "closest-side"
    ClosestCorner -> "closest-corner"
    FarthestSide -> "farthest-side"
    FarthestCorner -> "farthest-corner"


data LinearGradient = LinearGradient
  { lgAngle :: Maybe GradientAngle
  , lgStops :: [LinearColorStop] }
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS LinearGradient where
  toCSS (LinearGradient angle stops) =
      "linear-gradient(" <>
      ( listToCSS $
        maybeToList (toCSS <$> angle) <>
                    (toCSS <$> stops) )
      <> ")"


data RadialGradient = RadialGradient
  { rgPosition :: Maybe Position
  , rgShape    :: Maybe RadialShape
  , rgExtent   :: Maybe RadialShapeExtent
  , rgStops    :: [LinearColorStop] }
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS RadialGradient where
  toCSS (RadialGradient pos shape extent stops) =
    "radial-gradient(" <>
    ( intercalate " " $
      maybeToList (toCSS <$> shape) <>
      maybeToList (("at " <>) . toCSS <$> pos) <>
      maybeToList (toCSS <$> extent) ) <>
    ( listToCSS stops ) <> ")"


data ConicGradient = ConicGradient
  { cgAngle    :: Maybe Angle
  , cgPosition :: Maybe Position
  , cgStops    :: [AngularColorStop] }
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS ConicGradient where
  toCSS (ConicGradient angle pos stops) =
    "conic-gradient(" <>
    ( intercalate " " $
      maybeToList (("from " <>) . toCSS <$> angle) <>
      maybeToList (("at " <>) . toCSS <$> pos) ) <>
    ( listToCSS stops )


newtype RepeatingGradient g = Repeating g
deriving instance Eq g => Eq (RepeatingGradient g)
deriving instance Ord g => Ord (RepeatingGradient g)
deriving instance Generic g => Generic (RepeatingGradient g)
deriving instance Read g => Read (RepeatingGradient g)
deriving instance Show g => Show (RepeatingGradient g)

instance ToCSS g => ToCSS (RepeatingGradient g) where
  toCSS (Repeating x) = "repeating-" <> toCSS x


data Gradient = GradientLinear LinearGradient
              | GradientRadial RadialGradient
              | GradientRepeatingLinear (RepeatingGradient LinearGradient)
              | GradientRepeatingRadial (RepeatingGradient RadialGradient)
              | GradientConic ConicGradient
  -- TODO
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Gradient where
  toCSS = \case
    GradientLinear x -> toCSS x
    GradientRadial x -> toCSS x
    GradientRepeatingLinear x -> toCSS x
    GradientRepeatingRadial x -> toCSS x
    GradientConic x -> toCSS x


data Image = ImageGradient Gradient
           | ImageByUrl ImageUrl
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Image where
  toCSS = \case
    ImageGradient x -> toCSS x
    ImageByUrl x -> toCSS x


data BackgroundRepeat0 = Repeat | RepeatSpace | RepeatRound | NoRepeat
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS BackgroundRepeat0 where
  toCSS = \case
    Repeat -> "repeat"
    RepeatSpace -> "space"
    RepeatRound -> "round"
    NoRepeat -> "no-repeat"


data BackgroundRepeat = RepeatXY BackgroundRepeat0 BackgroundRepeat0
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS BackgroundRepeat where
  toCSS (RepeatXY x y) = toCSS x <> " " <> toCSS y


data BackgroundSize = BackgroundSizeCover
                    | BackgroundSizeContain
                    | BackgroundSizeAuto
                    | BackgroundSize1to1 Dimension
                    | BackgroundSizeNon1to1 Dimension Dimension
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS BackgroundSize where
  toCSS = \case
     BackgroundSizeCover -> "cover"
     BackgroundSizeContain -> "contain"
     BackgroundSizeAuto -> "auto"
     BackgroundSize1to1 x -> toCSS x
     BackgroundSizeNon1to1 x y -> toCSS x <> " " <> toCSS y


data BackgroundSizes = BackgroundSizes [BackgroundSize]
                     | BackgroundSizesInherit
                     | BackgroundSizesInitial
                     | BackgroundSizesUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS BackgroundSizes where
  toCSS = \case
    BackgroundSizes x -> listToCSS x
    BackgroundSizesInherit -> "inherit"
    BackgroundSizesInitial -> "initial"
    BackgroundSizesUnset -> "unset"


data Size = SizeLength Length
          | SizePercent Percent
          | SizeAuto
          | SizeMaxContent
          | SizeMinContent
          | SizeFitContent Dimension
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Size where
  toCSS = \case
    SizeLength x -> toCSS x
    SizePercent x -> toCSS x
    SizeAuto -> "auto"
    SizeMaxContent -> "max-content"
    SizeMinContent -> "min-content"
    SizeFitContent x -> "fit-content(" <> toCSS x <> ")"

data Radius = Circular Dimension
            | EllipticalXY Dimension Dimension
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Radius where
  toCSS = \case
    Circular x -> toCSS x
    EllipticalXY x y -> toCSS x <> " " <> toCSS y


data BorderWidth = BorderThin
                 | BorderMedium
                 | BorderThick
                 | BorderThickness Length
                 | BorderWidthInherit
                 | BorderWidthInitial
                 | BorderWidthUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS BorderWidth where
  toCSS = \case
    BorderThin -> "thin"
    BorderMedium -> "medium"
    BorderThick -> "thick"
    BorderThickness x -> toCSS x
    BorderWidthInherit -> "inherit"
    BorderWidthInitial -> "initial"
    BorderWidthUnset -> "unset"


data StyleProperty =
    AlignContent AlignContent
  | AlignItems AlignItems
  | AlignSelf AlignSelf
  | All All
  | AnimationDelay [Duration]
  | AnimationDirection [AnimationDirection]
  | AnimationDuration [Duration]
  | AnimationFillMode [AnimationFillMode]
  | AnimationIterationCount [AnimationIterationCount]
  | AnimationName AnimationName
  | AnimationPlayState AnimationPlayState
  | AnimationTimingFunction [AnimationTimingFunction]
  | BackdropFilter Filter
  | BackfaceVisibility Visibility
  | BackgroundAttachment BackgroundAttachments
  | BackgroundBlendMode BlendModes
  | BackgroundClip BackgroundClip
  | BackgroundColor Color
  | BackgroundImage Image
  | BackgroundOrigin BackgroundOrigin
  | BackgroundPosition Position
  | BackgroundRepeat BackgroundRepeat
  | BackgroundSize BackgroundSizes
  | BlockSize Size
  | BorderBottomColor Color
  | BorderBottomLeftRadius Radius
  | BorderBottomRightRadius Radius
  | BorderBottomWidth BorderWidth
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS StyleProperty where
  toCSS = \case
    AlignContent x -> "align-content: " <> toCSS x
    AlignItems x -> "align-items: " <> toCSS x
    AlignSelf x -> "align-self: " <> toCSS x
    All x -> "all: " <> toCSS x
    AnimationDelay x -> "animation-delay: " <> toCSS x
    AnimationDirection x -> "animation-direction: " <> toCSS x
    AnimationDuration x -> "animation-duration: " <> toCSS x
    AnimationFillMode x -> "animation-fill-mode: " <> toCSS x
    AnimationIterationCount x -> "animation-iteration-count: " <> toCSS x
    AnimationName x -> "animation-name: " <> toCSS x
    AnimationPlayState x -> "animation-play-state: " <> toCSS x
    AnimationTimingFunction x -> "animation-timing-function: " <> toCSS x
    BackdropFilter x -> "backdrop-filter: " <> toCSS x
    BackfaceVisibility x -> "backface-visibility: " <> toCSS x
    BackgroundAttachment x -> "background-attachment: " <> toCSS x
    BackgroundBlendMode x -> "background-blend-mode: " <> toCSS x
    BackgroundClip x -> "background-clip: " <> toCSS x
    BackgroundColor x -> "background-color: " <> toCSS x
    BackgroundImage x -> "background-image: " <> toCSS x
    BackgroundOrigin x -> "background-origin: " <> toCSS x
    BackgroundPosition x -> "background-position: " <> toCSS x
    BackgroundRepeat x -> "background-repeat: " <> toCSS x
    BackgroundSize x -> "background-size: " <> toCSS x
    BlockSize x -> "block-size: " <> toCSS x
    BorderBottomColor x -> "border-bottom-color: " <> toCSS x
    BorderBottomLeftRadius x -> "border-bottom-left-radius: " <> toCSS x
    BorderBottomRightRadius x -> "border-bottom-right-radius: " <> toCSS x
    BorderBottomWidth x -> "border-bottom-width: " <> toCSS x


type Style = [StyleProperty]

instance ToCSS Style where
  toCSS = intercalate "; " . fmap toCSS
