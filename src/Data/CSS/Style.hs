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


import Data.Maybe (fromMaybe, maybeToList)
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
  deriving (Eq, Ord, Num, Fractional, Real, RealFrac, Floating, RealFloat, Generic, Read, Show)

instance ToCSS Percent where
  toCSS (Percent x) = pack (show x) <> "%"


data Dimension =
    LengthDim Length
  | PercentDim Percent
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Dimension where
  toCSS = \case
    LengthDim x -> toCSS x
    PercentDim x -> toCSS x


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
            | NoFilter
            | FilterInherit
            | FilterInitial
            | FilterUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Filter where
  toCSS = \case
    FilterFunctions x -> toCSS x
    SVGFilter x -> toCSS x
    NoFilter -> "none"
    FilterInitial -> "initial"
    FilterInherit -> "inherit"
    FilterUnset -> "unset"


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


data TopOrBottom = Top' | Bottom'
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS TopOrBottom where
  toCSS = \case
    Top' -> "top"
    Bottom' -> "bottom"


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
           | ImageInherit
           | ImageInitial
           | ImageUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Image where
  toCSS = \case
    ImageGradient x -> toCSS x
    ImageByUrl x -> toCSS x
    ImageInitial -> "initial"
    ImageInherit -> "inherit"
    ImageUnset -> "unset"

instance ToCSS (Maybe Image) where
  toCSS = \case
    Just x -> toCSS x
    Nothing -> "none"


data BackgroundRepeat0 = Repeat | RepeatSpace | RepeatRound | NoRepeat
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS BackgroundRepeat0 where
  toCSS = \case
    Repeat -> "repeat"
    RepeatSpace -> "space"
    RepeatRound -> "round"
    NoRepeat -> "no-repeat"


data BackgroundRepeat = RepeatXY BackgroundRepeat0 BackgroundRepeat0
                      | RepeatInitial
                      | RepeatInherit
                      | RepeatUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS BackgroundRepeat where
  toCSS = \case
    RepeatXY x y -> toCSS x <> " " <> toCSS y
    RepeatInitial -> "initial"
    RepeatInherit -> "inherit"
    RepeatUnset -> "unset"


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


data BorderSizes = UniformBorderSize Size
                 | VerticalHorizontalBorderSizes Size Size
                 | TopRightBottomLeftBorderSizes Size Size Size Size
                 | BorderSizesInherit
                 | BorderSizesInitial
                 | BorderSizesUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS BorderSizes where
  toCSS = \case
    UniformBorderSize x -> toCSS x
    VerticalHorizontalBorderSizes x y -> toCSS x <> " " <> toCSS y
    TopRightBottomLeftBorderSizes a b c d ->
      intercalate " " $ toCSS <$> [a, b, c, d]
    BorderSizesInherit -> "inherit"
    BorderSizesInitial -> "initial"
    BorderSizesUnset -> "unset"


data BorderStyle =
    BorderNone
  | BorderHidden
  | BorderDotted
  | BorderDashed
  | BorderSolid
  | BorderDouble
  | BorderGroove
  | BorderRidge
  | BorderInset
  | BorderOutset
  | BorderStyleInherit
  | BorderStyleInitial
  | BorderStyleUnset
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS BorderStyle where
  toCSS = \case
    BorderNone -> "none"
    BorderHidden -> "hidden"
    BorderDotted -> "dotted"
    BorderDashed -> "dashed"
    BorderSolid -> "solid"
    BorderDouble -> "double"
    BorderGroove -> "groove"
    BorderRidge -> "ridge"
    BorderInset -> "inset"
    BorderOutset -> "outset"
    BorderStyleInherit -> "inherit"
    BorderStyleInitial -> "initial"
    BorderStyleUnset -> "unset"
  


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


data BorderCollapse = CollapseBorders | SeparateBorders
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS BorderCollapse where
  toCSS = \case
    CollapseBorders -> "collapse"
    SeparateBorders -> "separate"


data BorderImageOutset = OutsetLength Length
                       | OutsetMultiple Double
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS BorderImageOutset where
  toCSS = \case
    OutsetLength x -> toCSS x
    OutsetMultiple x -> toCSS x


data BorderSpacing =
    BorderSpacingUniform Length
  | BorderSpacingHorizontalVertical Length Length
  | BorderSpacingInitial
  | BorderSpacingInherit
  | BorderSpacingUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS BorderSpacing where
  toCSS = \case
    BorderSpacingUniform x -> toCSS x
    BorderSpacingHorizontalVertical x y ->
     toCSS x <> " " <> toCSS y
    BorderSpacingInitial -> "initial"
    BorderSpacingInherit -> "inherit"
    BorderSpacingUnset -> "unset"


data Offset = OffsetLength Length
            | OffsetPercent Percent
            | OffsetAuto
            | OffsetInherit
            | OffsetInitial
            | OffsetUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Offset where
  toCSS = \case
    OffsetLength x -> toCSS x
    OffsetPercent x -> toCSS x
    OffsetAuto -> "auto"
    OffsetInherit -> "inherit"
    OffsetInitial -> "initial"
    OffsetUnset -> "unset"


data BoxDecorationBreak =
    BoxDecorationBreakSlice
  | BoxDecorationBreakClone
  | BoxDecorationBreakInitial
  | BoxDecorationBreakInherit
  | BoxDecorationBreakUnset
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS BoxDecorationBreak where
  toCSS = \case
    BoxDecorationBreakSlice -> "slice"
    BoxDecorationBreakClone -> "clone"
    BoxDecorationBreakInitial -> "intiial"
    BoxDecorationBreakInherit -> "inherit"
    BoxDecorationBreakUnset -> "unset"


data BoxSizing = BorderBox | ContentBox
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS BoxSizing where
  toCSS = \case
    BorderBox -> "border-box"
    ContentBox -> "content-box"


data BreakAround =
    BreakAuto
  | BreakAvoid
  | BreakAlways
  | BreakAll
  | BreakAvoidPage
  | BreakPage
  | BreakLeft
  | BreakRight
  | BreakRecto
  | BreakVerso
  | BreakAvoidColumn
  | BreakColumn
  | BreakAvoidRegion
  | BreakRegion
  | BreakInherit
  | BreakInitial
  | BreakUnset
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS BreakAround where
  toCSS = \case
    BreakAuto -> "auto"
    BreakAlways -> "always"
    BreakAll -> "all"
    BreakAvoidPage -> "avoid-page"
    BreakPage -> "page"
    BreakLeft -> "left"
    BreakRight -> "right"
    BreakRecto -> "recto"
    BreakVerso -> "verso"
    BreakAvoidColumn -> "avoid-column"
    BreakAvoidRegion -> "avoid-region"
    BreakRegion -> "region"
    BreakInherit -> "inherit"
    BreakInitial -> "initial"
    BreakUnset -> "unset"


data BreakInside =
    BreakInsideAuto
  | BreakInsideAvoid
  | BreakInsideAvoidPage
  | BreakInsideAvoidColumn
  | BreakInsideAvoidRegion
  | BreakInsideInherit
  | BreakInsideInitial
  | BreakInsideUnset
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS BreakInside where
  toCSS = \case
    BreakInsideAuto -> "auto"
    BreakInsideAvoid -> "avoid"
    BreakInsideAvoidPage -> "avoid-page"
    BreakInsideAvoidColumn -> "avoid-column"
    BreakInsideAvoidRegion -> "avoid-region"
    BreakInsideInherit -> "inherit"
    BreakInsideInitial -> "initial"
    BreakInsideUnset -> "unset"


data CaptionSide =
    CaptionTop
  | CaptionBottom
  | CaptionLeft
  | CaptionRight
  | CaptionTopOutside
  | CaptionBottomOutside
  | CaptionSideInherit
  | CaptionSideInitial
  | CaptionSideUnset
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS CaptionSide where
  toCSS = \case
    CaptionTop -> "top"
    CaptionBottom -> "bottom"
    CaptionLeft -> "left"
    CaptionRight -> "right"
    CaptionTopOutside -> "top-outside"
    CaptionBottomOutside -> "bottom-outside"
    CaptionSideInherit -> "inherit"
    CaptionSideInitial -> "initial"
    CaptionSideUnset -> "unset"


data Clear =
    ClearNone
  | ClearLeft
  | ClearRight
  | ClearBoth
  | ClearInlineStart
  | ClearInlineEnd
  | ClearInherit
  | ClearInitial
  | ClearUnset
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS Clear where
  toCSS = \case
    ClearNone -> "none"
    ClearLeft -> "left"
    ClearRight -> "right"
    ClearBoth -> "both"
    ClearInlineStart -> "inline-start"
    ClearInlineEnd -> "inline-end"
    ClearInherit -> "inherit"
    ClearInitial -> "initial"
    ClearUnset -> "unset"


data ColorAdjust = ColorAdjustEconomy | ColorAdjustExact
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS ColorAdjust where
  toCSS = \case
    ColorAdjustEconomy -> "economy"
    ColorAdjustExact -> "exact"


data ColumnCount = ColumnCountAuto
                 | Columns Int
                 | ColumnCountInherit
                 | ColumnCountInitial
                 | ColumnCountUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS ColumnCount where
  toCSS = \case
    ColumnCountAuto -> "auto"
    Columns x -> toCSS x
    ColumnCountInherit -> "inherit"
    ColumnCountInitial -> "initial"
    ColumnCountUnset -> "unset"


data ColumnFill = ColumnFillAuto
                | ColumnFillBalance
                | ColumnFillBalanceAll
                | ColumnFillInherit
                | ColumnFillInitial
                | ColumnFillUnset
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS ColumnFill where
  toCSS = \case
    ColumnFillAuto -> "auto"
    ColumnFillBalance -> "balance"
    ColumnFillBalanceAll -> "balance-all"
    ColumnFillInherit -> "inherit"
    ColumnFillInitial -> "initial"
    ColumnFillUnset -> "unset"


data ColumnGap =
    ColumnGapNormal
  | ColumnGapLength Length
  | ColumnGapPercent Percent
  | ColumnGapInitial
  | ColumnGapInherit
  | ColumnGapUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS ColumnGap where
  toCSS = \case
    ColumnGapNormal -> "normal"
    ColumnGapLength x -> toCSS x
    ColumnGapPercent x -> toCSS x
    ColumnGapInitial -> "initial"
    ColumnGapInherit -> "inherit"
    ColumnGapUnset -> "unset"


data ColumnSpan = ColumnSpanNone | ColumnSpanAll
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS ColumnSpan where
  toCSS = \case
    ColumnSpanNone -> "none"
    ColumnSpanAll -> "all"


data ColumnWidth =
    ColumnWidthAuto
  | ColumnWidthLength Length
  | ColumnWidthPercent Percent
  | ColumnWidthInherit
  | ColumnWidthInitial
  | ColumnWidthUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS ColumnWidth where
  toCSS = \case
    ColumnWidthAuto -> "auto"
    ColumnWidthLength x -> toCSS x
    ColumnWidthPercent x -> toCSS x
    ColumnWidthInherit -> "inherit"
    ColumnWidthInitial -> "initial"
    ColumnWidthUnset -> "unset"


data Contain =
    ContainNone
  | ContainStrict
  | ContainContent
  | ContainSize
  | ContainLayout
  | ContainStyle
  | ContainPaint
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS Contain where
  toCSS = \case
    ContainNone -> "none"
    ContainStrict -> "strict"
    ContainContent -> "content"
    ContainSize -> "size"
    ContainLayout -> "layout"
    ContainStyle -> "style"
    ContainPaint -> "paint"


data Contains = Contains [Contain]
              | ContainInherit
              | ContainInitial
              | ContainUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Contains where
  toCSS = \case
    Contains x -> listToCSS x
    ContainInherit -> "inherit"
    ContainInitial -> "initial"
    ContainUnset -> "unset"


data Cursor = CursorUrl Text (Maybe (Int, Int))
            | CursorAuto
            | CursorDefault
            | CursorNone
            | CursorContextMenu
            | CursorHelp
            | CursorPointer
            | CursorProgress
            | CursorWait
            | CursorCell
            | CursorCrosshair
            | CursorText
            | CursorVerticalText
            | CursorAlias
            | CursorCopy
            | CursorMove
            | CursorNoDrop
            | CursorNotAllowed
            | CursorGrab
            | CursorGrabbing
            | CursorAllScroll
            | CursorColResize
            | CursorRowResize
            | CursorNResize
            | CursorEResize
            | CursorSResize
            | CursorWResize
            | CursorNEResize
            | CursorNWResize
            | CursorSEResize
            | CursorSWResize
            | CursorEWResize
            | CursorNSResize
            | CursorNESWResize
            | CursorNWSEResize
            | CursorZoomIn
            | CursorZoomOut
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Cursor where
  toCSS = \case
    CursorUrl u cs -> "url(" <> u <> ")" <>
      fromMaybe "" ((" " <>) . (\(x,y) -> toCSS x <> " " <> toCSS y) <$> cs)
    CursorAuto -> "auto"
    CursorDefault -> "default"
    CursorNone -> "none"
    CursorContextMenu -> "context-menu"
    CursorHelp -> "help"
    CursorPointer -> "pointer"
    CursorProgress -> "progress"
    CursorWait -> "wait"
    CursorCell -> "cell"
    CursorCrosshair -> "crosshair"
    CursorText -> "text"
    CursorVerticalText -> "vertical-text"
    CursorAlias -> "alias"
    CursorCopy -> "copy"
    CursorMove -> "move"
    CursorNoDrop -> "no-drop"
    CursorNotAllowed -> "not-allowed"
    CursorGrab -> "grab"
    CursorGrabbing -> "grabbing"
    CursorAllScroll -> "all-scroll"
    CursorColResize -> "col-resize"
    CursorRowResize -> "row-resize"
    CursorNResize -> "n-resize"
    CursorEResize -> "e-resize"
    CursorSResize -> "s-resize"
    CursorWResize -> "w-resize"
    CursorNEResize -> "ne-resize"
    CursorNWResize -> "nw-resize"
    CursorSEResize -> "se-resize"
    CursorSWResize -> "sw-resize"
    CursorEWResize -> "ew-resize"
    CursorNSResize -> "ns-resize"
    CursorNESWResize -> "nesw-resize"
    CursorNWSEResize -> "nwrse-resize"
    CursorZoomIn -> "zoom-in"
    CursorZoomOut -> "zoom-out"


data Cursors = Cursors [Cursor]
             | CursorInitial
             | CursorInherit
             | CursorUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Cursors where
  toCSS = \case
    Cursors x -> listToCSS x
    CursorInitial -> "initial"
    CursorInherit -> "inherit"
    CursorUnset -> "unset"


data Direction = LTR | RTL
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Direction where
  toCSS = \case
    LTR -> "LTR"
    RTL -> "RTL"


data Display =
    DisplayBlock
  | DisplayInline
  | DisplayRunIn
  | DisplayFlow
  | DisplayFlowRoot
  | DisplayTable
  | DisplayFlex
  | DisplayGrid
  | DisplayListItem
  | DisplayTableRowGroup
  | DisplayTableHeaderGroup
  | DisplayTableFooterGroup
  | DisplayTableRow
  | DisplayTableCell
  | DisplayTableColumnGroup
  | DisplayTableColumn
  | DisplayTableCaption
  | DisplayNone
  | DisplayInlineBlock
  | DisplayInlineTable
  | DisplayInlineFlex
  | DisplayInlineGrid
  | DisplayInherit
  | DisplayInitial
  | DisplayUnset
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS Display where
  toCSS = \case
    DisplayBlock -> "block"
    DisplayInline -> "inline"
    DisplayRunIn -> "run-in"
    DisplayFlow -> "flow"
    DisplayFlowRoot -> "flow-root"
    DisplayTable -> "table"
    DisplayFlex -> "flex"
    DisplayGrid -> "grid"
    DisplayListItem -> "list-item"
    DisplayTableRowGroup -> "table-row-group"
    DisplayTableHeaderGroup -> "table-header-group"
    DisplayTableFooterGroup -> "table-footer-group"
    DisplayTableRow -> "table-row"
    DisplayTableCell -> "table-cell"
    DisplayTableColumnGroup -> "table-column-group"
    DisplayTableColumn -> "table-column"
    DisplayTableCaption -> "table-caption"
    DisplayNone -> "none"
    DisplayInlineBlock -> "inline-block"
    DisplayInlineTable -> "inline-table"
    DisplayInlineFlex -> "inline-flex"
    DisplayInherit -> "inherit"
    DisplayInitial -> "initial"
    DisplayUnset -> "unset"


data EmptyCells =
    EmptyCellsShow
  | EmptyCellsHide
  | EmptyCellsInherit
  | EmptyCellsInitial
  | EmptyCellsUnset
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS EmptyCells where
  toCSS = \case
    EmptyCellsShow -> "show"
    EmptyCellsHide -> "hide"
    EmptyCellsInherit -> "inherit"
    EmptyCellsInitial -> "initial"
    EmptyCellsUnset -> "unset"


data FlexSize = FlexSizeLength Length
              | FlexSizePercent Percent
              | FlexSizeAuto
              | FlexSizeFill
              | FlexSizeMaxContent
              | FlexSizeMinContent
              | FlexSizeFitContent
              | FlexSizeContent
              | FlexSizeInherit
              | FlexSizeInitial
              | FlexSizeUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS FlexSize where
  toCSS = \case
    FlexSizeLength x -> toCSS x
    FlexSizePercent x -> toCSS x
    FlexSizeAuto -> "auto"
    FlexSizeFill -> "fill"
    FlexSizeMaxContent -> "max-content"
    FlexSizeMinContent -> "min-content"
    FlexSizeFitContent -> "fit-content"
    FlexSizeContent -> "content"
    FlexSizeInherit -> "inherit"
    FlexSizeInitial -> "initial"
    FlexSizeUnset -> "unset"


data FlexDirection =
    FlexDirectionRow
  | FlexDirectionRowReverse
  | FlexDirectionColumn
  | FlexDirectionColumnReverse
  | FlexDirectionInherit
  | FlexDirectionInitial
  | FlexDirectionUnset
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS FlexDirection where
  toCSS = \case
    FlexDirectionRow -> "row"
    FlexDirectionRowReverse -> "row-reverse"
    FlexDirectionColumn -> "column"
    FlexDirectionColumnReverse -> "column-reverse"
    FlexDirectionInherit -> "inherit"
    FlexDirectionInitial -> "initial"
    FlexDirectionUnset -> "unset"


data FlexGrow = FlexGrowBy Proportion
              | FlexGrowInherit
              | FlexGrowInitial
              | FlexGrowUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS FlexGrow where
  toCSS = \case
    FlexGrowBy x -> toCSS x
    FlexGrowInherit -> "inherit"
    FlexGrowInitial -> "initial"
    FlexGrowUnset -> "unset"


data FlexShrink = FlexShrinkBy Proportion
                | FlexShrinkInherit
                | FlexShrinkInitial
                | FlexShrinkUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS FlexShrink where
  toCSS = \case
    FlexShrinkBy x -> toCSS x
    FlexShrinkInherit -> "inherit"
    FlexShrinkInitial -> "initial"
    FlexShrinkUnset -> "unset"


data FlexWrap = FlexWrapNo
              | FlexWrapYes
              | FlexWrapReverse
              | FlexWrapInherit
              | FlexWrapInitial
              | FlexWrapUnset
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS FlexWrap where
  toCSS = \case
    FlexWrapNo -> "nowrap"
    FlexWrapYes -> "wrap"
    FlexWrapReverse -> "reverse"
    FlexWrapInherit -> "inherit"
    FlexWrapInitial -> "initial"
    FlexWrapUnset -> "unset"


data Float' = FloatLeft
            | FloatRight
            | FloatNone
            | FloatInlineStart
            | FloatInlineEnd
            | FloatInherit
            | FloatInitial
            | FloatUnset
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS Float' where
  toCSS = \case
    FloatLeft -> "left"
    FloatRight -> "right"
    FloatNone -> "none"
    FloatInlineStart -> "inline-start"
    FloatInlineEnd -> "inline-end"
    FloatInherit -> "inherit"
    FloatInitial -> "initial"
    FloatUnset -> "unset"


newtype FontFamily = FontFamily' Text
  deriving (Eq, Ord, Generic, Read, Show, IsString)

instance ToCSS FontFamily where
  toCSS (FontFamily' x) = case x of
    "serif" -> "serif"
    "sans-serif" -> "sans-serif"
    "cursive" -> "cursive"
    "fantasy" -> "fantasy"
    "monospace" -> "monospace"
    "system-ui" -> "system-ui"
    "ui-serif" -> "ui-serif"
    "ui-sans-serif" -> "ui-sans-serif"
    "ui-monospace" -> "ui-monospace"
    "ui-rounded" -> "ui-rounded"
    "emoji" -> "emoji"
    "math" -> "math"
    "fangsong" -> "fangsong"
    _ -> "\"" <> x <> "\""


data FontFamilies = FontFamilies [FontFamily]
                  | FontFamilyInitial
                  | FontFamilyInherit
                  | FontFamilyUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS FontFamilies where
  toCSS = \case
    FontFamilies x -> listToCSS x
    FontFamilyInitial -> "initial"
    FontFamilyInherit -> "inherit"
    FontFamilyUnset -> "unset"


data FontKerning = KernAuto
                 | KernNormal
                 | KernNone
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS FontKerning where
  toCSS = \case
    KernAuto -> "auto"
    KernNormal -> "normal"
    KernNone -> "none"


data FontOpticalSizing = OpticalSizingNone
                       | OpticalSizingAuto
                       | OpticalSizingInherit
                       | OpticalSizingInitial
                       | OpticalSizingUnset
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS FontOpticalSizing where
  toCSS = \case
    OpticalSizingNone -> "none"
    OpticalSizingAuto -> "auto"
    OpticalSizingInherit -> "inherit"
    OpticalSizingUnset -> "unset"


data FontSize = FontXXSmall
              | FontXSmall
              | FontSmall
              | FontMedium
              | FontLarge
              | FontXLarge
              | FontXXLarge
              | FontXXXLarge
              | FontSmaller
              | FontLarger
              | FontDim Dimension
              | FontSizeInherit
              | FontSizeInitial
              | FontSizeUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS FontSize where
  toCSS = \case
    FontXXSmall -> "xx-small"
    FontXSmall -> "x-small"
    FontSmall -> "small"
    FontMedium -> "medium"
    FontLarge -> "large"
    FontXLarge -> "x-large"
    FontXXLarge -> "xx-large"
    FontXXXLarge -> "xxx-large"
    FontSmaller -> "smaller"
    FontLarger -> "larger"
    FontDim x -> toCSS x
    FontSizeInherit -> "inherit"
    FontSizeInitial -> "initial"
    FontSizeUnset -> "unset"


data FontSizeAdjust = FontAdjustNone
                    | FontAdjustProportion Proportion
                    | FontAdjustInherit
                    | FontAdjustInitial
                    | FontAdjustUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS FontSizeAdjust where
  toCSS = \case
    FontAdjustNone -> "none"
    FontAdjustProportion x -> toCSS x
    FontAdjustInherit -> "inherit"
    FontAdjustInitial -> "initial"
    FontAdjustUnset -> "unset"


data FontStretch = FontUltraCondensed
                 | FontExtraCondensed
                 | FontCondensed
                 | FontSemiCondensed
                 | FontNonStretch
                 | FontSemiExpanded
                 | FontExpanded
                 | FontExtraExpanded
                 | FontUltraExpanded
                 | FontStretchPercent Percent
                 | FontStretchInherit
                 | FontStretchInitial
                 | FontStretchUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS FontStretch where
  toCSS = \case
    FontUltraCondensed -> "ultra-condensed"
    FontExtraCondensed -> "extra-condensed"
    FontCondensed -> "condensed"
    FontSemiCondensed -> "semi-condensed"
    FontNonStretch -> "normal"
    FontSemiExpanded -> "semi-expanded"
    FontExpanded -> "expanded"
    FontExtraExpanded -> "extra-expanded"
    FontUltraExpanded -> "ultra-expanded"
    FontStretchPercent x -> toCSS x
    FontStretchInherit -> "inherit"
    FontStretchInitial -> "initial"
    FontStretchUnset -> "unset"


data FontStyle = FontNonSlanted
               | FontItalic
               | FontOblique
               | FontAngle Angle
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS FontStyle where
  toCSS = \case
    FontNonSlanted -> "normal"
    FontItalic -> "italic"
    FontOblique -> "oblique"
    FontAngle x -> "oblique " <> toCSS x


data FontSynthesis = FontSynthesisNone
                   | FontSynthesisWeight
                   | FontSynthesisStyle
                   | FontSynthesisWeightAndStyle
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS FontSynthesis where
  toCSS = \case
    FontSynthesisNone -> "none"
    FontSynthesisWeight -> "weight"
    FontSynthesisStyle -> "style"
    FontSynthesisWeightAndStyle -> "weight style"


data FontVariantAlternate =
    FontHistoricalForms
  | FontStylistic Text
  | FontStyleset Text
  | FontCharacterVariant Text
  | FontSwash Text
  | FontOrnaments Text
  | FontAnnotation Text
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS FontVariantAlternate where
  toCSS = \case
    FontHistoricalForms -> "historical-forms"
    FontStylistic x -> "stylistic(" <> x <> ")"
    FontStyleset x -> "styleset(" <> x <> ")"
    FontCharacterVariant x -> "character-variant(" <> x <> ")"
    FontSwash x -> "swash(" <> x <> ")"
    FontOrnaments x -> "ornaments(" <> x <> ")"
    FontAnnotation x -> "annotation(" <> x <> ")"

instance ToCSS [FontVariantAlternate] where
  toCSS = \case
    [] -> "normal"
    xs -> intercalate " " $ toCSS <$> xs


data FontVariantCaps =
    FontNormalCaps
  | FontSmallCaps
  | FontAllSmallCaps
  | FontPetiteCaps
  | FontAllPetiteCaps
  | FontUnicase
  | FontTitlingCaps
  | FontCapsInherit
  | FontCapsInitial
  | FontCapsUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS FontVariantCaps where
  toCSS = \case
    FontNormalCaps -> "normal"
    FontSmallCaps -> "small-caps"
    FontAllSmallCaps -> "all-small-caps"
    FontPetiteCaps -> "petite-caps"
    FontAllPetiteCaps -> "all-petite-caps"
    FontUnicase -> "unicase"
    FontTitlingCaps -> "titling-caps"
    FontCapsInherit -> "inherit"
    FontCapsInitial -> "initial"
    FontCapsUnset -> "unset"


data FontVariantLigatures =
    FontLigaturesNormal
  | FontLigaturesNone
  | FontLigaturesCommon
  | FontLigaturesNoCommon
  | FontLigaturesDiscretionary
  | FontLigaturesNoDiscretionary
  | FontLigaturesHistorical
  | FontLigaturesNoHistorical
  | FontLigaturesContextual
  | FontLigaturesNoContextual
  | FontLigaturesInherit
  | FontLigaturesInitial
  | FontLigaturesUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS FontVariantLigatures where
  toCSS = \case
    FontLigaturesNormal -> "normal"
    FontLigaturesNone -> "none"
    FontLigaturesCommon -> "common-ligatures"
    FontLigaturesNoCommon -> "no-common-ligatures"
    FontLigaturesDiscretionary -> "discretionary-ligatures"
    FontLigaturesNoDiscretionary -> "no-discretionary-ligatures"
    FontLigaturesHistorical -> "historical-ligatures"
    FontLigaturesNoHistorical -> "no-historical-ligatures"
    FontLigaturesContextual -> "contextual"
    FontLigaturesNoContextual -> "no-contextual"
    FontLigaturesInherit -> "inherit"
    FontLigaturesInitial -> "initial"
    FontLigaturesUnset -> "unset"


data FontVariantNumeric =
    FontOrdinal
  | FontSlashedZero
  | FontLiningNums
  | FontOldstyleNums
  | FontProportionalNums
  | FontTabularNums
  | FontDiagonalFractions
  | FontStackedFractions
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS FontVariantNumeric where
  toCSS = \case
    FontOrdinal -> "ordinal"
    FontSlashedZero -> "slashed-zero"
    FontLiningNums -> "lining-nums"
    FontOldstyleNums -> "oldstyle-nums"
    FontProportionalNums -> "proportional-nums"
    FontTabularNums -> "tabular-nums"
    FontDiagonalFractions -> "diagonal-fractions"
    FontStackedFractions -> "stacked-fractions"

data FontVariantsNumeric =
    FontNumericVariants [FontVariantNumeric]
  | FontVariantsNumericInitial
  | FontVariantsNumericInherit
  | FontVariantsNumericUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS FontVariantsNumeric where
  toCSS = \case
    FontNumericVariants [] -> "normal"
    FontNumericVariants x -> intercalate " " $ toCSS <$> x
    FontVariantsNumericInitial -> "initial"
    FontVariantsNumericInherit -> "inherit"
    FontVariantsNumericUnset -> "unset"


data FontVariantPosition =
    FontNormalPosition
  | FontSubscript
  | FontSuperscript
  | FontPositionInherit
  | FontPositionInitial
  | FontPositionUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS FontVariantPosition where
  toCSS = \case
    FontNormalPosition -> "normal"
    FontSubscript -> "sub"
    FontSuperscript -> "super"
    FontPositionInherit -> "inherit"
    FontPositionInitial -> "initial"
    FontPositionUnset -> "unset"


data FontVariationSettings =
    FontVariationSettingValues [(Text, Double)]
  | FontVariationSettingsInitial
  | FontVariationSettingsInherit
  | FontVariationSettingsUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS FontVariationSettings where
  toCSS = \case
    FontVariationSettingValues x -> intercalate " "
      $ (\(s,v) -> s <> " " <> pack (show v)) <$> x
    FontVariationSettingsInitial -> "initial"
    FontVariationSettingsInherit -> "inherit"
    FontVariationSettingsUnset -> "unset"


data FontWeight =
    FontWeightNormal
  | FontWeightBold
  | FontWeightLighter
  | FontWeightBolder
  | FontWeightNumeric Int
  | FontWeightInitial
  | FontWeightInherit
  | FontWeightUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS FontWeight where
  toCSS = \case
    FontWeightNormal -> "normal"
    FontWeightBold -> "bold"
    FontWeightLighter -> "lighter"
    FontWeightBolder -> "bolder"
    FontWeightNumeric x -> pack (show x)
    FontWeightInitial -> "initial"
    FontWeightInherit -> "inherit"
    FontWeightUnset -> "unset"


newtype FlexFactor = FlexFactor Double
  deriving (Eq, Ord, Num, Fractional, Real, RealFrac, Floating, RealFloat, Generic, Read, Show)

instance ToCSS FlexFactor where
  toCSS (FlexFactor x) = pack (show x) <> "fr"


data GridAutoColumn =
    GridAutoColumnLength Length
  | GridAutoColumnPercent Percent
  | GridAutoColumnFlex FlexFactor
  | GridAutoColumnMaxContent
  | GridAutoColumnMinContent
  | GridAutoColumnMinMax FlexFactor FlexFactor
  | GridAutoColumnFitContent GridAutoColumn
  | GridAutoColumnAuto
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS GridAutoColumn where
  toCSS = \case
    GridAutoColumnLength x -> toCSS x
    GridAutoColumnPercent x -> toCSS x
    GridAutoColumnFlex x -> toCSS x
    GridAutoColumnMaxContent -> "max-content"
    GridAutoColumnMinContent -> "min-content"
    GridAutoColumnMinMax x y -> "minmax(" <> toCSS x <> ", " <> toCSS y <> ")"
    GridAutoColumnFitContent x -> "fit-content(" <> toCSS x <> ")"
    GridAutoColumnAuto -> "auto"


data GridAutoColumns = AutoColumns [GridAutoColumns]
                     | AutoColumnsInitial
                     | AutoColumnsInherit
                     | AutoColumnsUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS GridAutoColumns where
  toCSS = \case
    AutoColumns [] -> "auto"
    AutoColumns x -> intercalate " " $ toCSS <$> x
    AutoColumnsInitial -> "initial"
    AutoColumnsInherit -> "inherit"
    AutoColumnsUnset -> "unset"


data GridAutoFlow =
    AutoFlowRow
  | AutoFlowColumn
  | AutoFlowDense
  | AutoFlowRowDense
  | AutoFlowColumnDense
  | AutoFlowInitial
  | AutoFlowInherit
  | AutoFlowUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS GridAutoFlow where
  toCSS = \case
    AutoFlowRow -> "row"
    AutoFlowColumn -> "column"
    AutoFlowDense -> "dense"
    AutoFlowRowDense -> "row dense"
    AutoFlowColumnDense -> "column dense"
    AutoFlowInitial -> "initial"
    AutoFlowInherit -> "inherit"
    AutoFlowUnset -> "unset"


data GridAutoRow =
    GridAutoRowLength Length
  | GridAutoRowPercent Percent
  | GridAutoRowFlex FlexFactor
  | GridAutoRowMaxContent
  | GridAutoRowMinContent
  | GridAutoRowMinMax FlexFactor FlexFactor
  | GridAutoRowAuto
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS GridAutoRow where
  toCSS = \case
    GridAutoRowLength x -> toCSS x
    GridAutoRowPercent x -> toCSS x
    GridAutoRowFlex x -> toCSS x
    GridAutoRowMaxContent -> "max-content"
    GridAutoRowMinContent -> "min-content"
    GridAutoRowMinMax x y -> "minmax(" <> toCSS x <> ", " <> toCSS y <> ")"
    GridAutoRowAuto -> "auto"


data GridAutoRows = AutoRows [GridAutoRow]
                  | AutoRowsInitial
                  | AutoRowsInherit
                  | AutoRowsUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS GridAutoRows where
  toCSS = \case
    AutoRows [] -> "auto"
    AutoRows x -> intercalate " " $ toCSS <$> x
    AutoRowsInitial -> "initial"
    AutoRowsInherit -> "inherit"
    AutoRowsUnset -> "unset"


data GridLine = GridLineAuto
              | GridLineIdent Text
              | GridLineInt Int
              | GridLineIdentInt Text Int
              | GridLineSpanInt Int
              | GridLineSpanIdent Text
              | GridLineSpanIdentInt Text Int
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS GridLine where
  toCSS = \case
    GridLineAuto -> "auto"
    GridLineIdent x -> x
    GridLineInt x -> pack (show x)
    GridLineIdentInt x y -> x <> " " <> pack (show y)
    GridLineSpanInt x -> "span " <> pack (show x)
    GridLineSpanIdent x -> "span " <> x
    GridLineSpanIdentInt x y -> "span " <> x <> " " <> pack (show y)


data GridLines = GridLine GridLine
               | GridLines GridLine GridLine
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS GridLines where
  toCSS = \case
    GridLine x -> toCSS x
    GridLines x y -> toCSS x <> " / " <> toCSS y


data GridTemplateAreas = TemplateAreas [Text]
                       | TemplateAreasInitial
                       | TemplateAreasInherit
                       | TemplateAreasUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS GridTemplateAreas where
  toCSS = \case
    TemplateAreas [] -> "none"
    TemplateAreas x -> intercalate " " $ pack . show . unpack <$> x
    TemplateAreasInitial -> "initial"
    TemplateAreasInherit -> "inherit"
    TemplateAreasUnset -> "unset"


data HangingPunctuation =
    HangingPunctuationNone
  | HangingPunctuationFirst
  | HangingPunctuationLast
  | HangingPunctuationForceEnd
  | HangingPunctuationAllowEnd
  | HangingPunctuationFirstForceEnd
  | HangingPunctuationFirstAllowEnd
  | HangingPunctuationFirstLast
  | HangingPunctuationLastAllowEnd
  | HangingPunctuationLastForceEnd
  | HangingPunctuationFirstForceEndLast
  | HangingPunctuationFirstAllowEndLast
  | HangingPunctuationInherit
  | HangingPunctuationInitial
  | HangingPunctuationUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS HangingPunctuation where
  toCSS = \case
    HangingPunctuationNone -> "none"
    HangingPunctuationFirst -> "first"
    HangingPunctuationLast -> "last"
    HangingPunctuationForceEnd -> "force-end"
    HangingPunctuationAllowEnd -> "allow-end"
    HangingPunctuationFirstForceEnd -> "first force-end"
    HangingPunctuationFirstAllowEnd -> "first allow-end"
    HangingPunctuationFirstLast -> "first last"
    HangingPunctuationLastForceEnd -> "last force-end"
    HangingPunctuationFirstForceEndLast -> "first force-end last"
    HangingPunctuationFirstAllowEndLast -> "first allow-end last"
    HangingPunctuationInherit -> "inherit"
    HangingPunctuationInitial -> "initial"
    HangingPunctuationUnset -> "unset"


data Height = HeightAuto
            | HeightLength Length
            | HeightPercent Percent
            | HeightInherit
            | HeightInitial
            | HeightUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Height where
  toCSS = \case
    HeightAuto -> "auto"
    HeightLength x -> toCSS x
    HeightPercent x -> toCSS x
    HeightInherit -> "inherit"
    HeightInitial -> "initial"
    HeightUnset -> "unset"


data Hyphens = HyphensNone
             | HyphensManual
             | HyphensAuto
             | HyphensInherit
             | HyphensInitial
             | HyphensUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS Hyphens where
  toCSS = \case
    HyphensNone -> "none"
    HyphensManual -> "manual"
    HyphensAuto -> "auto"
    HyphensInherit -> "inherit"
    HyphensInitial -> "initial"
    HyphensUnset -> "unset"


data ImageRendering =
    ImageRenderingAuto
  | ImageRenderingCrispEdges
  | ImageRenderingPixelated
  | ImageRenderingInherit
  | ImageRenderingInitial
  | ImageRenderingUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS ImageRendering where
  toCSS = \case
    ImageRenderingAuto -> "auto"
    ImageRenderingCrispEdges -> "crisp-edges"
    ImageRenderingPixelated -> "pixelated"
    ImageRenderingInherit -> "inherit"
    ImageRenderingInitial -> "initial"
    ImageRenderingUnset -> "unset"


data InlineSize =
    InlineSizeLength Length
  | InlineSizePercent Percent
  | InlineSizeMaxContent
  | InlineSizeMinContent
  | InlineSizeFitContent Length
  | InlineSizeAuto
  | InlineSizeInherit
  | InlineSizeInitial
  | InlineSizeUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS InlineSize where
  toCSS = \case
    InlineSizeLength x -> toCSS x
    InlineSizePercent x -> toCSS x
    InlineSizeMaxContent -> "max-content"
    InlineSizeMinContent -> "min-content"
    InlineSizeFitContent x -> "fit-content(" <> toCSS x <> ")"
    InlineSizeAuto -> "auto"
    InlineSizeInherit -> "inherit"
    InlineSizeInitial -> "initial"


data InsetOffset =
    InsetLength Length
  | InsetPercent Percent
  | InsetAuto
  | InsetInherit
  | InsetInitial
  | InsetUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS InsetOffset where
  toCSS = \case
    InsetLength x -> toCSS x
    InsetPercent x -> toCSS x
    InsetAuto -> "auto"
    InsetInherit -> "inherit"
    InsetInitial -> "initial"
    InsetUnset -> "unset"


data Isolation = IsolationAuto
               | IsolationIsolate
               | IsolationInherit
               | IsolationInitial
               | IsolationUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS Isolation where
  toCSS = \case
    IsolationAuto -> "auto"
    IsolationIsolate -> "isolate"
    IsolationInherit -> "inherit"
    IsolationInitial -> "initial"
    IsolationUnset -> "unset"


data JustifyContent =
    JustifyContentCenter
  | JustifyContentStart
  | JustifyContentEnd
  | JustifyContentFlexStart
  | JustifyContentFlexEnd
  | JustifyContentLeft
  | JustifyContentRight
  | JustifyContentNormal
  | JustifyContentSpaceBetween
  | JustifyContentSpaceAround
  | JustifyContentSpaceEvenly
  | JustifyContentStretch
  | JustifyContentSafeCenter
  | JustifyContentUnsafeCenter
  | JustifyContentInherit
  | JustifyContentInitial
  | JustifyContentUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS JustifyContent where
  toCSS = \case
    JustifyContentCenter -> "center"
    JustifyContentStart -> "start"
    JustifyContentEnd -> "end"
    JustifyContentFlexStart -> "flex-start"
    JustifyContentFlexEnd -> "flex-end"
    JustifyContentLeft -> "left"
    JustifyContentRight -> "right"
    JustifyContentNormal -> "normal"
    JustifyContentSpaceBetween -> "space-between"
    JustifyContentSpaceAround -> "space-around"
    JustifyContentSpaceEvenly -> "space-evenly"
    JustifyContentStretch -> "stretch"
    JustifyContentSafeCenter -> "safe center"
    JustifyContentUnsafeCenter -> "unsafe center"
    JustifyContentInherit -> "inherit"
    JustifyContentInitial -> "initial"
    JustifyContentUnset -> "unset"


data JustifyItems =
    JustifyItemsAuto
  | JustifyItemsNormal
  | JustifyItemsStretch
  | JustifyItemsCenter
  | JustifyItemsStart
  | JustifyItemsEnd
  | JustifyItemsFlexStart
  | JustifyItemsFlexEnd
  | JustifyItemsSelfStart
  | JustifyItemsSelfEnd
  | JustifyItemsLeft
  | JustifyItemsRight
  | JustifyItemsBaseline
  | JustifyItemsFirstBaseline
  | JustifyItemsLastBaseline
  | JustifyItemsSafeCenter
  | JustifyItemsUnsafeCenter
  | JustifyItemsLegacyRight
  | JustifyItemsLegacyLeft
  | JustifyItemsLegacyCenter
  | JustifyItemsInherit
  | JustifyItemsInitial
  | JustifyItemsUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS JustifyItems where
  toCSS = \case
    JustifyItemsAuto -> "auto"
    JustifyItemsNormal -> "normal"
    JustifyItemsStretch -> "stretch"
    JustifyItemsCenter -> "center"
    JustifyItemsStart -> "start"
    JustifyItemsEnd -> "end"
    JustifyItemsFlexStart -> "flex-start"
    JustifyItemsFlexEnd -> "flex-end"
    JustifyItemsSelfStart -> "self-start"
    JustifyItemsSelfEnd -> "self-end"
    JustifyItemsLeft -> "left"
    JustifyItemsRight -> "right"
    JustifyItemsBaseline -> "baseline"
    JustifyItemsFirstBaseline -> "first baseline"
    JustifyItemsLastBaseline -> "last baseline"
    JustifyItemsSafeCenter -> "safe center"
    JustifyItemsUnsafeCenter -> "unsafe center"
    JustifyItemsLegacyRight -> "legacy right"
    JustifyItemsLegacyLeft -> "legacy left"
    JustifyItemsLegacyCenter -> "legacy center"
    JustifyItemsInherit -> "inherit"
    JustifyItemsInitial -> "initial"
    JustifyItemsUnset -> "unset"


data JustifySelf =
    JustifySelfAuto
  | JustifySelfNormal
  | JustifySelfStretch
  | JustifySelfCenter
  | JustifySelfStart
  | JustifySelfEnd
  | JustifySelfFlexStart
  | JustifySelfFlexEnd
  | JustifySelfSelfStart
  | JustifySelfSelfEnd
  | JustifySelfLeft
  | JustifySelfRight
  | JustifySelfBaseline
  | JustifySelfFirstBaseline
  | JustifySelfLastBaseline
  | JustifySelfSafeCenter
  | JustifySelfUnsafeCenter
  | JustifySelfInherit
  | JustifySelfInitial
  | JustifySelfUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS JustifySelf where
  toCSS = \case
    JustifySelfAuto -> "auto"
    JustifySelfNormal -> "normal"
    JustifySelfStretch -> "stretch"
    JustifySelfCenter -> "center"
    JustifySelfStart -> "start"
    JustifySelfEnd -> "end"
    JustifySelfFlexStart -> "flex-start"
    JustifySelfFlexEnd -> "flex-end"
    JustifySelfSelfStart -> "self-start"
    JustifySelfSelfEnd -> "self-end"
    JustifySelfLeft -> "left"
    JustifySelfRight -> "right"
    JustifySelfBaseline -> "baseline"
    JustifySelfFirstBaseline -> "first baseline"
    JustifySelfLastBaseline -> "last baseline"


data LetterSpacing = LetterSpacingNormal
                   | LetterSpacingLength Length
                   | LetterSpacingInherit
                   | LetterSpacingInitial
                   | LetterSpacingUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS LetterSpacing where
  toCSS = \case
    LetterSpacingNormal -> "normal"
    LetterSpacingLength x -> toCSS x
    LetterSpacingInherit -> "inherit"
    LetterSpacingInitial -> "initial"
    LetterSpacingUnset -> "unset"


data LineBreak =
    LineBreakAuto
  | LineBreakLoose
  | LineBreakNormal
  | LineBreakStrict
  | LineBreakAnywhere
  | LineBreakInitial
  | LineBreakInherit
  | LineBreakUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS LineBreak where
  toCSS = \case
    LineBreakAuto -> "auto"
    LineBreakLoose -> "loose"
    LineBreakNormal -> "normal"
    LineBreakStrict -> "strict"
    LineBreakAnywhere -> "anywhere"
    LineBreakInitial -> "initial"
    LineBreakInherit -> "inherit"
    LineBreakUnset -> "unset"


data LineHeight =
    LineHeightNormal
  | LineHeightProportion Proportion
  | LineHeightLength Length
  | LineHeightPercent Percent
  | LineHeightInherit
  | LineHeightInitial
  | LineHeightUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS LineHeight where
  toCSS = \case
    LineHeightNormal -> "normal"
    LineHeightProportion x -> toCSS x
    LineHeightLength x -> toCSS x
    LineHeightPercent x -> toCSS x
    LineHeightInitial -> "initial"
    LineHeightInherit -> "inherit"
    LineHeightUnset -> "unset"


data ListStylePosition =
    ListStylePositionInside
  | ListStylePositionOutside
  | ListStylePositionInherit
  | ListStylePositionInitial
  | ListStylePositionUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS ListStylePosition where
  toCSS = \case
    ListStylePositionInside -> "inside"
    ListStylePositionOutside -> "outside"
    ListStylePositionInherit -> "inherit"
    ListStylePositionInitial -> "initial"
    ListStylePositionUnset -> "unset"


data ListStyle =
    ListStyleDisc
  | ListStyleCircle
  | ListStyleSquare
  | ListStyleDecimal
  | ListStyleGeorgian
  | ListStyleTradChineseInformal
  | ListStyleKannada
  | ListStyleText Text
  | ListStyleIdent Text
  | ListStyleNone
  | ListStyleInherit
  | ListStyleInitial
  | ListStyleUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS ListStyle where
  toCSS = \case
    ListStyleDisc -> "disc"
    ListStyleCircle -> "circle"
    ListStyleSquare -> "square"
    ListStyleDecimal -> "decimal"
    ListStyleGeorgian -> "georgian"
    ListStyleTradChineseInformal -> "trad-chinese-informal"
    ListStyleKannada -> "kannada"
    ListStyleText x -> "'" <> x <> "'"
    ListStyleIdent x -> x
    ListStyleNone -> "none"
    ListStyleInherit -> "inherit"
    ListStyleInitial -> "initial"
    ListStyleUnset -> "unset"


data Margin = MarginLength Length
            | MarginPercent Percent
            | MarginAuto
            | MarginInherit
            | MarginInitial
            | MarginUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Margin where
  toCSS = \case
    MarginLength x -> toCSS x
    MarginPercent x -> toCSS x
    MarginAuto -> "auto"
    MarginInherit -> "inherit"
    MarginInitial -> "initial"
    MarginUnset -> "unset"            


data MaskBorderMode =
    MaskBorderLuminance
  | MaskBorderAlpha
  | MaskBorderInherit
  | MaskBorderInitial
  | MaskBorderUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS MaskBorderMode where
  toCSS = \case
    MaskBorderLuminance -> "luminance"
    MaskBorderAlpha -> "alpha"
    MaskBorderInherit -> "inherit"
    MaskBorderInitial -> "initial"
    MaskBorderUnset -> "unset"


data MaskBorderRepeat =
    MaskBorderRepeatStretch
  | MaskBorderRepeatRepeat
  | MaskBorderRepeatRound
  | MaskBorderRepeatSpace
  | MaskBorderRepeatRoundStretch
  | MaskBorderRepeatInherit
  | MaskBorderRepeatInitial
  | MaskBorderRepeatUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS MaskBorderRepeat where
  toCSS = \case
    MaskBorderRepeatStretch -> "stretch"
    MaskBorderRepeatRepeat -> "repeat"
    MaskBorderRepeatRound -> "round"
    MaskBorderRepeatRoundStretch -> "round stretch"
    MaskBorderRepeatInherit -> "inherit"
    MaskBorderRepeatInitial -> "initial"
    MaskBorderRepeatUnset -> "unset"


data MaskBorderSliceValue =
    MaskBorderOffset Double
  | MaskBorderOffsetPercent Percent
  | MaskBorderFill
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS MaskBorderSliceValue where
  toCSS = \case
    MaskBorderOffset x -> toCSS x
    MaskBorderOffsetPercent x -> toCSS x
    MaskBorderFill -> "fill"


data MaskBorderSlice =
    MaskBorderSliceAllSides MaskBorderSliceValue
  | MaskBorderSliceVertHoriz MaskBorderSliceValue MaskBorderSliceValue
  | MaskBorderSliceTopHorizBottom MaskBorderSliceValue MaskBorderSliceValue MaskBorderSliceValue
  | MaskBorderSliceTopRightBottomLeft MaskBorderSliceValue MaskBorderSliceValue MaskBorderSliceValue MaskBorderSliceValue
  | MaskBorderSliceInherit
  | MaskBorderSliceInitial
  | MaskBorderSliceUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS MaskBorderSlice where
  toCSS = \case
    MaskBorderSliceAllSides x -> toCSS x
    MaskBorderSliceVertHoriz x y -> toCSS x <> " " <> toCSS y
    MaskBorderSliceTopHorizBottom x y z -> toCSS x <> " " <> toCSS y <> " " <> toCSS z
    MaskBorderSliceTopRightBottomLeft w x y z -> toCSS w <> " " <> toCSS x <> " " <> toCSS y <> " " <> toCSS z
    MaskBorderSliceInitial -> "initial"
    MaskBorderSliceInherit -> "inherit"
    MaskBorderSliceUnset -> "unset"


data MaskBorderWidth =
    MaskBorderLength Length
  | MaskBorderWidthPercent Percent
  | MaskBorderWidthProportion Proportion
  | MaskBorderWidthAuto
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS MaskBorderWidth where
  toCSS = \case
    MaskBorderLength x -> toCSS x
    MaskBorderWidthPercent x -> toCSS x
    MaskBorderWidthProportion x -> toCSS x
    MaskBorderWidthAuto -> "auto"


data MaskBorderWidths =
    MaskBorderWidthAllSides MaskBorderWidth
  | MaskBorderWidthVertHoriz MaskBorderWidth MaskBorderWidth
  | MaskBorderWidthTopHorizBottom MaskBorderWidth MaskBorderWidth MaskBorderWidth
  | MaskBorderWidthTopRightBottomLeft MaskBorderWidth MaskBorderWidth MaskBorderWidth MaskBorderWidth
  | MaskBorderWidthInherit
  | MaskBorderWidthInitial
  | MaskBorderWidthUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS MaskBorderWidths where
  toCSS = \case
    MaskBorderWidthAllSides x -> toCSS x
    MaskBorderWidthVertHoriz x y -> toCSS x <> " " <> toCSS y
    MaskBorderWidthTopHorizBottom x y z -> toCSS x <> " " <> toCSS y <> " " <> toCSS z
    MaskBorderWidthTopRightBottomLeft w x y z -> toCSS w <> " " <> toCSS x <> " " <> toCSS y <> " " <> toCSS z
    MaskBorderWidthInherit -> "inherit"
    MaskBorderWidthInitial -> "initial"
    MaskBorderWidthUnset -> "unset"


data MaskClipValue =
    MaskClipContentBox
  | MaskClipPaddingBox
  | MaskClipBorderBox
  | MaskClipMarginBox
  | MaskClipFillBox
  | MaskClipStrokeBox
  | MaskClipViewBox
  | MaskNoClip
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)


instance ToCSS MaskClipValue where
  toCSS = \case
    MaskClipContentBox -> "content-box"
    MaskClipPaddingBox -> "padding-box"
    MaskClipBorderBox -> "border-box"
    MaskClipMarginBox -> "margin-box"
    MaskClipFillBox -> "fill-box"
    MaskClipStrokeBox -> "stroke-box"
    MaskClipViewBox -> "view-box"
    MaskNoClip -> "no-clip"


data MaskClip = MaskClipValues [MaskClipValue]
              | MaskClipInherit
              | MaskClipInitial
              | MaskClipUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS MaskClip where
  toCSS = \case
    MaskClipValues x -> listToCSS x
    MaskClipInherit -> "inherit"
    MaskClipInitial -> "initial"
    MaskClipUnset -> "unset"


data MaskCompositeValue =
    MaskCompositeAdd
  | MaskCompositeSubtract
  | MaskCompositeIntersect
  | MaskCompositeExclude
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS MaskCompositeValue where
  toCSS = \case
    MaskCompositeAdd -> "add"
    MaskCompositeSubtract -> "subtract"
    MaskCompositeIntersect -> "intersect"
    MaskCompositeExclude -> "exclude"


data MaskComposite = MaskCompositeValues [MaskCompositeValue]
                   | MaskCompositeInherit
                   | MaskCompositeInitial
                   | MaskCompositeUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS MaskComposite where
  toCSS = \case
    MaskCompositeValues x -> listToCSS x
    MaskCompositeInherit -> "inherit"
    MaskCompositeInitial -> "initial"
    MaskCompositeUnset -> "unset"


data MaskMode = MaskModeAlpha
              | MaskModeLuminance
              | MaskModeMatchSource
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS MaskMode where
  toCSS = \case
    MaskModeAlpha -> "alpha"
    MaskModeLuminance -> "luminance"
    MaskModeMatchSource -> "match-source"


data MaskModes = MaskModes [MaskMode]
               | MaskModeInherit
               | MaskModeInitial
               | MaskModeUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS MaskModes where
  toCSS = \case
    MaskModes x -> listToCSS x
    MaskModeInherit -> "inherit"
    MaskModeInitial -> "initial"
    MaskModeUnset -> "unset"


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
  | BorderCollapse BorderCollapse
  | BorderColor Color
  | BorderEndEndRadius Radius
  | BorderEndStartRadius Radius
  | BorderImageOutset BorderImageOutset
  | BorderImageRepeat BackgroundRepeat
  | BorderImageSource Image
  | BorderImageWidth BorderSizes
  | BorderInlineColor Color
  | BorderInlineEndColor Color
  | BorderInlineEndStyle BorderStyle
  | BorderInlineEndWidth BorderWidth
  | BorderInlineStartColor Color
  | BorderInlineStartStyle BorderStyle
  | BorderInlineStartWidth BorderWidth
  | BorderInlineWidth BorderWidth
  | BorderLeftColor Color
  | BorderLeftStyle BorderStyle
  | BorderLeftWidth BorderWidth
  | BorderRadius Radius
  | BorderRightColor Color
  | BorderRightStyle BorderStyle
  | BorderRightWidth BorderWidth
  | BorderSpacing BorderSpacing
  | BorderStartEndRadius Radius
  | BorderStartStartRadius Radius
  | BorderStyle BorderStyle
  | BorderTopColor Color
  | BorderTopLeftRadius Radius
  | BorderTopRightRadius Radius
  | BorderTopStyle BorderStyle
  | BorderTopWidth BorderWidth
  | BorderWidth BorderWidth
  | BottomOffset Offset
  | BoxDecorationBreak BoxDecorationBreak
  -- TODO box-shadow
  | BoxSizing BoxSizing
  | BreakAfter BreakAround
  | BreakBefore BreakAround
  | BreakInside BreakInside
  | CaptionSide CaptionSide
  | CaretColor Color
  | Clear Clear
  -- TODO: clip, clip-path
  | Color Color
  | ColorAdjust ColorAdjust
  | ColumnCount ColumnCount
  | ColumnFill ColumnFill
  | ColumnGap ColumnGap
  | ColumnRuleColor Color
  | ColumnRuleStyle BorderStyle
  | ColumnRuleWidth BorderWidth
  | ColumnSpan ColumnSpan
  | ColumnWidth ColumnWidth
  -- TODO content
  -- TODO counter-increment, counter-reset
  | Contain Contains
  | Cursor Cursors
  | Direction Direction
  | Display Display
  | EmptyCells EmptyCells
  | Filter Filter
  | FlexBasis FlexSize
  | FlexDirection FlexDirection
  | FlexGrow FlexGrow
  | FlexShrink FlexShrink
  | FlexWrap FlexWrap
  | Float Float'
  | FontFamily FontFamilies
  -- TODO font-feature-settings
  | FontKerning FontKerning
  -- TODO font-language-override
  | FontOpticalSizing FontOpticalSizing
  | FontSize FontSize
  | FontSizeAdjust FontSizeAdjust
  | FontStretch FontStretch
  | FontStyle FontStyle
  | FontSynthesis FontSynthesis
  | FontVariantAlternates [FontVariantAlternate]
  | FontVariantCaps FontVariantCaps
  -- TODO font-variant-east-asian
  | FontVariantLigatures FontVariantLigatures
  | FontVariantNumeric FontVariantsNumeric
  | FontVariantPosition FontVariantPosition
  | FontVariationSettings FontVariationSettings
  | FontWeight FontWeight
  | Gap Dimension
  | Gaps { rowGap :: Dimension, colGap :: Dimension }
  | GridAutoColumns GridAutoColumns
  | GridAutoFlow GridAutoFlow
  | GridAutoRows GridAutoRows
  | GridColumn GridLines
  | GridRow GridLines
  | GridTemplateAreas GridTemplateAreas
  -- TODO grid-template-rows grid-template-columns
  | HangingPunctuation HangingPunctuation
  | Height Height
  | Hyphens Hyphens
  | ImageRendering ImageRendering
  | InlineSize InlineSize
  | InsetBlockEnd InsetOffset
  | InsetBlockStart InsetOffset
  | InsetInlineEnd InsetOffset
  | InsetInlineStart InsetOffset
  | Isolation Isolation
  | JustifyContent JustifyContent
  | JustifyItems JustifyItems
  | JustifySelf JustifySelf
  | LetterSpacing LetterSpacing
  | LineBreak LineBreak
  | LineHeight LineHeight
  | ListStyleImage (Maybe Image)
  | ListStylePosition ListStylePosition
  | ListStyleType ListStyle
  | MarginBlockEnd Margin
  | MarginBlockStart Margin
  | MarginBottom Margin
  | MarginInlineEnd Margin
  | MarginInlineStart Margin
  | MarginLeft Margin
  | MarginRight Margin
  | MarginTop Margin
  | MaskBorderMode MaskBorderMode
  | MaskBorderRepeat MaskBorderRepeat
  | MaskBorderSlice MaskBorderSlice
  | MaskBorderSource (Maybe Image)
  | MaskBorderWidth MaskBorderWidth
  | MaskClip MaskClip
  | MaskComposite MaskComposite
  | MaskImage (Maybe Image)
  | MaskMode MaskModes
  | MaskOrigin MaskOrigin
  | MaskPosition MaskPositions
  deriving (Eq, Ord, Generic, Read, Show)


data MaskOrigin =
    MaskOriginContentBox
  | MaskOriginPaddingBox
  | MaskOriginBorderBox
  | MaskOriginFillBox
  | MaskOriginStrokeBox
  | MaskOriginViewBox
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS MaskOrigin where
  toCSS = \case
    MaskOriginContentBox -> "content-box"
    MaskOriginPaddingBox -> "padding-box"
    MaskOriginBorderBox -> "border-box"
    MaskOriginFillBox -> "fill-box"
    MaskOriginStrokeBox -> "stroke-box"
    MaskOriginViewBox -> "view-box"


data MaskOrigins =
    MaskOrigins [MaskOrigin]
  | MaskOriginInherit
  | MaskOriginInitial
  | MaskOriginUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS MaskOrigins where
  toCSS = \case
    MaskOrigins x -> listToCSS x
    MaskOriginInherit -> "inherit"
    MaskOriginInitial -> "initial"
    MaskOriginUnset -> "unset"


data MaskPosition =
    MaskPositionTop
  | MaskPositionBottom
  | MaskPositionLeft
  | MaskPositionRight
  | MaskPositionCenter
  | MaskPositionLength Length
  | MaskPositionPercent Percent
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS MaskPosition where
  toCSS = \case
    MaskPositionTop -> "top"
    MaskPositionBottom -> "bottom"
    MaskPositionLeft -> "left"
    MaskPositionRight -> "right"
    MaskPositionCenter -> "center"
    MaskPositionLength x -> toCSS x
    MaskPositionPercent x -> toCSS x


data MaskPositions =
    MaskPositions [MaskPosition]
  | MaskPositionInherit
  | MaskPositionInitial
  | MaskPositionUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS MaskPositions where
  toCSS = \case
    MaskPositions x -> listToCSS x
    MaskPositionInherit -> "inherit"
    MaskPositionInitial -> "initial"
    MaskPositionUnset -> "unset"


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
    BorderCollapse x -> "border-collapse: " <> toCSS x
    BorderColor x -> "border-color: " <> toCSS x
    BorderEndEndRadius x -> "border-end-end-radius: " <> toCSS x
    BorderImageOutset x -> "border-image-outset: " <> toCSS x
    BorderImageRepeat x -> "border-image-repeat: " <> toCSS x
    BorderImageSource x -> "border-image-source: " <> toCSS x
    BorderImageWidth x -> "border-image-width: " <> toCSS x
    BorderInlineColor x -> "border-inline-color: " <> toCSS x
    BorderInlineEndColor x -> "border-inline-end-color: " <> toCSS x
    BorderInlineEndStyle x -> "border-inline-end-style: " <> toCSS x
    BorderInlineEndWidth x -> "border-inline-end-width: " <> toCSS x
    BorderInlineStartColor x -> "border-inline-start-color: " <> toCSS x
    BorderInlineStartStyle x -> "border-inline-start-style: " <> toCSS x
    BorderInlineStartWidth x -> "border-inline-start-wdith: " <> toCSS x
    BorderInlineWidth x -> "border-inline-width: " <> toCSS x
    BorderLeftColor x -> "border-left-color: " <> toCSS x
    BorderLeftStyle x -> "border-left-style: " <> toCSS x
    BorderLeftWidth x -> "border-left-width: " <> toCSS x
    BorderRadius x -> "border-radisu: " <> toCSS x
    BorderRightColor x -> "border-right-color: " <> toCSS x
    BorderRightStyle x -> "border-right-style: " <> toCSS x
    BorderRightWidth x -> "border-right-width: " <> toCSS x
    BorderSpacing x -> "border-spacing: " <> toCSS x
    BorderStartEndRadius x -> "border-start-end-radius: " <> toCSS x
    BorderStartStartRadius x -> "border-start-start-radius:" <> toCSS x
    BorderStyle x -> "border-style: " <> toCSS x
    BorderTopColor x -> "border-top-color: " <> toCSS x
    BorderTopLeftRadius x -> "border-top-left-radius: " <> toCSS x
    BorderTopRightRadius x -> "border-top-right-radius: " <> toCSS x
    BorderTopStyle x -> "border-top-style: " <> toCSS x
    BorderTopWidth x -> "border-top-width: " <> toCSS x
    BorderWidth x -> "border-width: " <> toCSS x
    BottomOffset x -> "bottom: " <> toCSS x
    BoxDecorationBreak x -> "box-decoration-break: " <> toCSS x
    BoxSizing x -> "box-sizing: " <> toCSS x
    BreakAfter x -> "break-after: " <> toCSS x
    BreakBefore x -> "break-before: " <> toCSS x
    BreakInside x -> "break-inside: " <> toCSS x
    CaptionSide x -> "caption-side: " <> toCSS x
    CaretColor x -> "caret-color: " <> toCSS x
    Clear x -> "clear: " <> toCSS x
    Color x -> "color: " <> toCSS x
    ColorAdjust x -> "color-adjust: " <> toCSS x
    ColumnCount x -> "column-count: " <> toCSS x
    ColumnFill x -> "column-fill: " <> toCSS x
    ColumnGap x -> "column-gap: " <> toCSS x
    ColumnRuleColor x -> "column-rule-color: " <> toCSS x
    ColumnRuleStyle x -> "column-rule-style: " <> toCSS x
    ColumnRuleWidth x -> "column-rule-width: " <> toCSS x
    ColumnSpan x -> "column-span: " <> toCSS x
    ColumnWidth x -> "column-width: " <> toCSS x
    Contain x -> "contain: " <> toCSS x
    Cursor x -> "cursor: " <> toCSS x
    Direction x -> "direction: " <> toCSS x
    Display x -> "display: " <> toCSS x
    EmptyCells x -> "empty-cells: " <> toCSS x
    Filter x -> "filter: " <> toCSS x
    FlexBasis x -> "flex-basis: " <> toCSS x
    FlexDirection x -> "flex-direction: " <> toCSS x
    FlexGrow x -> "flex-grow: " <> toCSS x
    FlexShrink x -> "flex-shrink: " <> toCSS x
    FlexWrap x -> "flex-wrap: " <> toCSS x
    Float x -> "float: " <> toCSS x
    FontFamily x -> "font-family: " <> toCSS x
    FontKerning x -> "font-kerning: " <> toCSS x
    FontOpticalSizing x -> "font-optical-sizing: " <> toCSS x
    FontSize x -> "font-size: " <> toCSS x
    FontSizeAdjust x -> "font-size-adjust: " <> toCSS x
    FontStretch x -> "font-stretch: " <> toCSS x
    FontStyle x -> "font-style: " <> toCSS x
    FontSynthesis x -> "font-synthesis: " <> toCSS x
    FontVariantAlternates x -> "font-variant-alternates: " <> toCSS x
    FontVariantCaps x -> "font-variant-caps: " <> toCSS x
    FontVariantLigatures x -> "font-variant-ligatures: " <> toCSS x
    FontVariantNumeric x -> "font-variant-numeric: " <> toCSS x
    FontVariantPosition x -> "font-variant-posiiton: " <> toCSS x
    FontVariationSettings x -> "font-variation-settings: " <> toCSS x
    FontWeight x -> "font-weight: " <> toCSS x
    Gap x -> "gap: " <> toCSS x
    Gaps x y -> "gap: " <> toCSS x <> " " <> toCSS y
    GridAutoColumns x -> "grid-auto-columns: " <> toCSS x
    GridAutoFlow x -> "grid-auto-flow: " <> toCSS x
    GridAutoRows x -> "grid-auto-rows: " <> toCSS x
    GridColumn x -> "grid-column: " <> toCSS x
    GridRow x -> "grid-row: " <> toCSS x
    GridTemplateAreas x -> "grid-template-areas: " <> toCSS x
    HangingPunctuation x -> "hanging-punctuation: " <> toCSS x
    Height x -> "height: " <> toCSS x
    Hyphens x -> "hyphens: " <> toCSS x
    ImageRendering x -> "image-rendering: " <> toCSS x
    InlineSize x -> "inline-size: " <> toCSS x
    InsetBlockEnd x -> "inset-block-end: " <> toCSS x
    InsetBlockStart x -> "inset-block-start: " <> toCSS x
    InsetInlineEnd x -> "inset-inline-end: " <> toCSS x
    InsetInlineStart x -> "inset-inline-start: " <> toCSS x
    Isolation x -> "isolation: " <> toCSS x
    JustifyContent x -> "justify-content: " <> toCSS x
    JustifyItems x -> "justify-items: " <> toCSS x
    JustifySelf x -> "justify-self: " <> toCSS x
    LetterSpacing x -> "letter-spacing: " <> toCSS x
    LineBreak x -> "line-break: " <> toCSS x
    LineHeight x -> "line-height: " <> toCSS x
    ListStyleImage x -> "list-style-image: " <> toCSS x
    ListStylePosition x -> "list-style-position: " <> toCSS x
    ListStyleType x -> "list-style-type: " <> toCSS x
    MarginBlockEnd x -> "margin-block-end: " <> toCSS x
    MarginBlockStart x -> "margin-block-start: " <> toCSS x
    MarginBottom x -> "margin-bottom: " <> toCSS x
    MarginInlineEnd x -> "margin-inline-end: " <> toCSS x
    MarginInlineStart x -> "margin-inline-start: " <> toCSS x
    MarginLeft x -> "margin-left: " <> toCSS x
    MarginRight x -> "margin-right: " <> toCSS x
    MarginTop x -> "margin-top: " <> toCSS x
    MaskBorderMode x -> "mask-border-mode: " <> toCSS x
    MaskBorderRepeat x -> "mask-border-repeat: " <> toCSS x
    MaskBorderSlice x -> "mask-border-slice: " <> toCSS x
    MaskBorderSource x -> "mask-border-source: " <> toCSS x
    MaskBorderWidth x -> "mask-border-width: " <> toCSS x
    MaskClip x -> "mask-clip: " <> toCSS x
    MaskComposite x -> "mask-composite: " <> toCSS x
    MaskImage x -> "mask-image: " <> toCSS x
    MaskMode x -> "mask-mode: " <> toCSS x
    MaskOrigin x -> "mask-origin: " <> toCSS x
    MaskPosition x -> "mask-position: " <> toCSS x


type Style = [StyleProperty]

instance ToCSS Style where
  toCSS = intercalate "; " . fmap toCSS
