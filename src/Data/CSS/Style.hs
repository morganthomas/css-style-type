{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE LambdaCase                 #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE StandaloneDeriving         #-}
{-# OPTIONS_GHC -Wunused-binds          #-}


module Data.CSS.Style
  ( ToCSS (..)
  , AlignContent (..)
  , AlignItems (..)
  , AlignSelf (..)
  , All (..)
  , Duration (..)
  , AnimationDirection (..)
  , AnimationFillMode (..)
  , AnimationIterationCount (..)
  , AnimationName (..)
  , PausedOrRunning (..)
  , AnimationPlayState (..)
  , JumpTerm (..)
  , AnimationTimingFunction (..)
  , Length (..)
  , Percent (..)
  , Dimension (..)
  , Color (..)
  , Brightness (..)
  , Contrast (..)
  , Proportion (..)
  , Angle (..)
  , FilterFunction (..)
  , FilterUrl (..)
  , Filter (..)
  , Visibility (..)
  , BackgroundAttachment (..)
  , BackgroundAttachments (..)
  , BlendMode (..)
  , BlendModes (..)
  , BackgroundClip (..)
  , BackgroundOrigin (..)
  , ImageUrl (..)
  , LeftOrRight (..)
  , TopOrBottom (..)
  , GradientAngle (..)
  , LinearColorStop (..)
  , AngularColorStop (..)
  , PositionXKeyword (..)
  , PositionYKeyword (..)
  , PositionX (..)
  , PositionY (..)
  , Position (..)
  , Positions (..)
  , RadialShape (..)
  , RadialShapeExtent (..)
  , LinearGradient (..)
  , RadialGradient (..)
  , ConicGradient (..)
  , RepeatingGradient (..)
  , Gradient (..)
  , Image (..)
  , BackgroundRepeat1D (..)
  , BackgroundRepeat (..)
  , BackgroundSize (..)
  , BackgroundSizes (..)
  , Size (..)
  , BorderSizes (..)
  , BorderStyle (..)
  , Radius (..)
  , BorderWidth (..)
  , BorderCollapse (..)
  , BorderImageOutset (..)
  , BorderSpacing (..)
  , Offset (..)
  , BoxDecorationBreak (..)
  , BoxSizing (..)
  , BreakAround (..)
  , BreakInside (..)
  , CaptionSide (..)
  , Clear (..)
  , ColorAdjust (..)
  , ColumnCount (..)
  , ColumnFill (..)
  , ColumnGap (..)
  , ColumnSpan (..)
  , ColumnWidth (..)
  , Contain (..)
  , Contains (..)
  , Cursor (..)
  , Cursors (..)
  , Direction (..)
  , Display (..)
  , EmptyCells (..)
  , FlexSize (..)
  , FlexDirection (..)
  , FlexGrow (..)
  , FlexShrink (..)
  , FlexWrap (..)
  , Float' (..)
  , FontFamily (..)
  , FontFamilies (..)
  , FontKerning (..)
  , FontOpticalSizing (..)
  , FontSize (..)
  , FontSizeAdjust (..)
  , FontStretch (..)
  , FontStyle (..)
  , FontSynthesis (..)
  , FontVariantAlternate (..)
  , FontVariantCaps (..)
  , FontVariantLigatures (..)
  , FontVariantNumeric (..)
  , FontVariantsNumeric (..)
  , FontVariantPosition (..)
  , FontVariationSettings (..)
  , FontWeight (..)
  , FlexFactor (..)
  , GridAutoColumn (..)
  , GridAutoColumns (..)
  , GridAutoFlow (..)
  , GridAutoRow (..)
  , GridAutoRows (..)
  , GridLine (..)
  , GridLines (..)
  , GridTemplateAreas (..)
  , HangingPunctuation (..)
  , Height (..)
  , Hyphens (..)
  , ImageRendering (..)
  , InlineSize (..)
  , InsetOffset (..)
  , Isolation (..)
  , JustifyContent (..)
  , JustifyItems (..)
  , JustifySelf (..)
  , LetterSpacing (..)
  , LineBreak (..)
  , LineHeight (..)
  , ListStylePosition (..)
  , ListStyle (..)
  , Margin (..)
  , MaskBorderMode (..)
  , MaskBorderRepeat (..)
  , MaskBorderSliceValue (..)
  , MaskBorderSlice (..)
  , MaskBorderWidth (..)
  , MaskBorderWidths (..)
  , MaskClipValue (..)
  , MaskClip (..)
  , MaskCompositeValue (..)
  , MaskComposite (..)
  , MaskMode (..)
  , MaskModes (..)
  , MaskOrigin (..)
  , MaskOrigins (..)
  , MaskPosition (..)
  , MaskPositions (..)
  , MaskRepeat (..)
  , MaskRepeats (..)
  , MaskSize (..)
  , MaskSizeXY (..)
  , MaskSizes (..)
  , MaskType (..)
  , ZoomFactor (..)
  , MixBlendMode (..)
  , ObjectFit (..)
  , ObjectPosition (..)
  , OffsetPosition (..)
  , RaySize (..)
  , RayContain (..)
  , FillRule (..)
  , Path (..)
  , ShapeRadius (..)
  , BasicShape (..)
  , OffsetRotation (..)
  , Order (..)
  , Orientation (..)
  , Orphans (..)
  , OutlineOffset (..)
  , OverflowAnchor (..)
  , OverflowMode (..)
  , OverflowWrap (..)
  , OverscrollBehavior (..)
  , Padding (..)
  , PaintOrderItem (..)
  , Perspective (..)
  , PerspectiveOrigin (..)
  , PlaceContent (..)
  , PointerEvents (..)
  , PositionMode (..)
  , Quotes (..)
  , Resize (..)
  , Axis (..)
  , Vector3D (..)
  , Rotate (..)
  , RowGap (..)
  , Scale (..)
  , ScrollBehavior (..)
  , ScrollMargin (..)
  , ScrollPadding (..)
  , ScrollbarColor (..)
  , ScrollbarWidth (..)
  , ShapeImageThreshold (..)
  , ShapeMargin (..)
  , ShapeOutside (..)
  , TabSize (..)
  , TableLayout (..)
  , TextAlignKeyword (..)
  , TextAlign (..)
  , TextAlignLast (..)
  , TextCombineUpright (..)
  , TextDecorationLineType (..)
  , TextDecorationLine (..)
  , TextDecorationStyle (..)
  , TextDecorationThickness (..)
  , TextEmphasisStyleValue (..)
  , TextEmphasisStyle (..)
  , TextEmphasisPositionHorizontal (..)
  , TextEmphasisPositionVertical (..)
  , TextEmphasisPosition (..)
  , TextIndent (..)
  , TextJustify (..)
  , TextOrientation (..)
  , TextOverflow (..)
  , TextRendering (..)
  , Shadow (..)
  , TextShadow (..)
  , TextTransform (..)
  , TextUnderlineOffset (..)
  , TextUnderlinePosition (..)
  , TouchActionEnablement (..)
  , TouchActionPanHorizontal (..)
  , TouchActionPanVertical (..)
  , TouchActionPinchZoom (..)
  , TouchAction (..)
  , Col4 (..)
  , Matrix4x4 (..)
  , Transform (..)
  , Transforms (..)
  , TransformBox (..)
  , TransformStyle (..)
  , Durations (..)
  , TransitionProperties (..)
  , TransitionTimingFunction (..)
  , TransitionTimingFunctions (..)
  , UnicodeBidi (..)
  , UnicodeRangePoint (..)
  , UnicodeRange (..)
  , VerticalAlign (..)
  , WritingMode (..)
  , StyleProperty (..)
  , Style
  ) where

import Data.Maybe (fromMaybe, maybeToList)
import Data.String
import Data.Text
import GHC.Generics
import Numeric (showHex)


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
                | Collapse
                | Inherit
                | Initial
                | Unset
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS Visibility where
  toCSS = \case
    Visible -> "visible"
    Hidden -> "hidden"
    Collapse -> "collapse"
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


data LeftOrRight = Left'' | Right''
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS LeftOrRight where
  toCSS = \case
    Left'' -> "left"
    Right'' -> "right"


data TopOrBottom = Top'' | Bottom''
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS TopOrBottom where
  toCSS = \case
    Top'' -> "top"
    Bottom'' -> "bottom"


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


data PositionXKeyword = PositionLeft
                      | PositionRight
                      | PositionXCenter
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS PositionXKeyword where
  toCSS = \case
    PositionLeft -> "left"
    PositionRight -> "right"
    PositionXCenter -> "center"

data PositionYKeyword = PositionTop
                      | PositionBottom
                      | PositionYCenter
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS PositionYKeyword where
  toCSS = \case
    PositionTop -> "top"
    PositionBottom -> "bottom"
    PositionYCenter -> "center"

data PositionX = XKw PositionXKeyword
               | XLen Length
               | XPct Percent
               | XKwLen PositionXKeyword Length
               | XKwPct PositionXKeyword Percent
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS PositionX where
  toCSS = \case
    XKw x -> toCSS x
    XLen x -> toCSS x
    XPct x -> toCSS x
    XKwLen x y -> toCSS x <> " " <> toCSS y
    XKwPct x y -> toCSS x <> " " <> toCSS y

data PositionY = YKw PositionYKeyword
               | YLen Length
               | YPct Percent
               | YKwLen PositionYKeyword Length
               | YKwPct PositionYKeyword Percent
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS PositionY where
  toCSS = \case
    YKw x -> toCSS x
    YLen x -> toCSS x
    YPct x -> toCSS x
    YKwLen x y -> toCSS x <> " " <> toCSS y
    YKwPct x y -> toCSS x <> " " <> toCSS y

data Position = PositionXKw PositionXKeyword
              | PositionYKw PositionYKeyword
              | PositionXLen Length
              | PositionXPct Percent
              | PositionXY PositionX PositionY
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Position where
  toCSS = \case
    PositionXKw x -> toCSS x
    PositionYKw x -> toCSS x
    PositionXLen x -> toCSS x
    PositionXPct x -> toCSS x
    PositionXY x y -> toCSS x <> " " <> toCSS y


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


data BackgroundRepeat1D = Repeat | RepeatSpace | RepeatRound | NoRepeat
  deriving (Eq, Ord, Enum, Bounded, Generic, Read, Show)

instance ToCSS BackgroundRepeat1D where
  toCSS = \case
    Repeat -> "repeat"
    RepeatSpace -> "space"
    RepeatRound -> "round"
    NoRepeat -> "no-repeat"


data BackgroundRepeat = RepeatXY BackgroundRepeat1D BackgroundRepeat1D
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
          | SizeInitial
          | SizeInherit
          | SizeUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Size where
  toCSS = \case
    SizeLength x -> toCSS x
    SizePercent x -> toCSS x
    SizeAuto -> "auto"
    SizeMaxContent -> "max-content"
    SizeMinContent -> "min-content"
    SizeFitContent x -> "fit-content(" <> toCSS x <> ")"
    SizeInitial -> "initial"
    SizeInherit -> "inherit"
    SizeUnset -> "unset"


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


data MaskRepeat = MaskRepeatYes
                | MaskRepeatSpace
                | MaskRepeatRound
                | MaskRepeatNo
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS MaskRepeat where
  toCSS = \case
    MaskRepeatYes -> "repeat"
    MaskRepeatSpace -> "space"
    MaskRepeatRound -> "round"
    MaskRepeatNo -> "no-repeat"

newtype MaskRepeatXY = MaskRepeatXY (MaskRepeat, MaskRepeat)
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS MaskRepeatXY where
  toCSS (MaskRepeatXY (x,y)) = toCSS x <> " " <> toCSS y

data MaskRepeats = MaskRepeats [MaskRepeatXY]
                 | MaskRepeatInherit
                 | MaskRepeatInitial
                 | MaskRepeatUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS MaskRepeats where
  toCSS = \case
    MaskRepeats x -> listToCSS x
    MaskRepeatInherit -> "inherit"
    MaskRepeatInitial -> "initial"
    MaskRepeatUnset -> "unset"


data MaskSize = MaskSizeLength Length
              | MaskSizePercent Percent
              | MaskSizeAuto
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS MaskSize where
  toCSS = \case
    MaskSizeLength x -> toCSS x
    MaskSizePercent x -> toCSS x
    MaskSizeAuto -> "auto"

data MaskSizeXY = MaskSizeCover
                | MaskSizeContain
                | MaskSizeX MaskSize
                | MaskSizeXY MaskSize MaskSize
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS MaskSizeXY where
  toCSS = \case
    MaskSizeCover -> "cover"
    MaskSizeContain -> "contain"
    MaskSizeX x -> toCSS x
    MaskSizeXY x y -> toCSS x <> " " <> toCSS y

data MaskSizes = MaskSizes [MaskSizeXY]
               | MaskSizeInherit
               | MaskSizeInitial
               | MaskSizeUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS MaskSizes where
  toCSS = \case
    MaskSizes x -> listToCSS x
    MaskSizeInherit -> "inherit"
    MaskSizeInitial -> "initial"
    MaskSizeUnset -> "unset"


data MaskType = MaskLuminance
              | MaskAlpha
              | MaskTypeInherit
              | MaskTypeInitial
              | MaskTypeUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS MaskType where
  toCSS = \case
    MaskAlpha -> "alpha"
    MaskLuminance -> "luminance"
    MaskTypeInherit -> "inherit"
    MaskTypeInitial -> "initial"
    MaskTypeUnset -> "unset"


data ZoomFactor = ZoomAuto
                | ZoomProportion Proportion
                | ZoomPercent Percent
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS ZoomFactor where
  toCSS = \case
    ZoomAuto -> "auto"
    ZoomProportion x -> toCSS x
    ZoomPercent x -> toCSS x


data MixBlendMode = MixBlendNormal
                  | MixBlendMultiply
                  | MixBlendScreen
                  | MixBlendOverlay
                  | MixBlendDarken
                  | MixBlendLighten
                  | MixBlendColorDodge
                  | MixBlendColorBurn
                  | MixBlendHardLight
                  | MixBlendSoftLight
                  | MixBlendDifference
                  | MixBlendExclusion
                  | MixBlendHue
                  | MixBlendSaturation
                  | MixBlendColor
                  | MixBlendLuminosity
                  | MixBlendModeInitial
                  | MixBlendModeInherit
                  | MixBlendModeUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS MixBlendMode where
  toCSS = \case
    MixBlendNormal -> "normal"
    MixBlendMultiply -> "multiply"
    MixBlendScreen -> "screen"
    MixBlendOverlay -> "overlay"
    MixBlendDarken -> "darken"
    MixBlendLighten -> "lighten"
    MixBlendColorDodge -> "color-dodge"
    MixBlendColorBurn -> "color-burn"
    MixBlendHardLight -> "hard-light"
    MixBlendSoftLight -> "soft-light"
    MixBlendDifference -> "difference"
    MixBlendExclusion -> "exclusion"
    MixBlendHue -> "hue"
    MixBlendSaturation -> "saturation"
    MixBlendColor -> "color"
    MixBlendLuminosity -> "luminosity"
    MixBlendModeInitial -> "initial"
    MixBlendModeInherit -> "inherit"
    MixBlendModeUnset -> "unset"


data ObjectFit = ObjectFitFill
               | ObjectFitContain
               | ObjectFitCover
               | ObjectFitNone
               | ObjectFitScaleDown
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS ObjectFit where
  toCSS = \case
    ObjectFitFill -> "fill"
    ObjectFitContain -> "contain"
    ObjectFitCover -> "cover"
    ObjectFitNone -> "none"
    ObjectFitScaleDown -> "scale-down"


data ObjectPosition = ObjectPos Position
                    | ObjectPosInitial
                    | ObjectPosInherit
                    | ObjectPosUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS ObjectPosition where
  toCSS = \case
    ObjectPos x -> toCSS x
    ObjectPosInitial -> "initial"
    ObjectPosInherit -> "inherit"
    ObjectPosUnset -> "unset"


data OffsetPosition = OffsetPosAuto
                    | OffsetPos Position
                    | OffsetPosInherit
                    | OffsetPosInitial
                    | OffsetPosUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS OffsetPosition where
  toCSS = \case
    OffsetPosAuto -> "auto"
    OffsetPos x -> toCSS x
    OffsetPosInherit -> "inherit"
    OffsetPosInitial -> "initial"
    OffsetPosUnset -> "unset"


data RaySize = SizeClosestSide
             | SizeFarthestSide
             | SizeClosestCorner
             | SizeFarthestCorner
             | RayLength Length
             | RayPercent Percent
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS RaySize where
  toCSS = \case
    SizeClosestSide -> "closest-side"
    SizeFarthestSide -> "farthest-side"
    SizeClosestCorner -> "closest-corner"
    SizeFarthestCorner -> "farthest-corner"
    RayLength x -> toCSS x
    RayPercent x -> toCSS x

data RayContain = RayContain
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS RayContain where
  toCSS _ = "contain"

data FillRule = NonZero | EvenOdd
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS FillRule where
  toCSS = \case
    NonZero -> "nonzero"
    EvenOdd -> "evenodd"

data Path = NoPath
          | Ray Angle (Maybe RaySize) (Maybe RayContain)
          | Path (Maybe FillRule) Text
          | PathUrl Text
          | PathShape BasicShape
          | PathBorderBox
          | PathPaddingBox
          | PathContentBox
          | PathMarginBox
          | PathFillBox
          | PathStrokeBox
          | PathViewBox
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Path where
  toCSS = \case
    NoPath -> "none"
    Ray x y z -> "ray(" <> toCSS x <> " " <> maybeToCSS y <> " " <> maybeToCSS z <> ")"
    Path (Just x) y -> "path(" <> toCSS x <> ", '" <> y <> "')"
    Path Nothing x -> "path('" <> x <> "')"
    PathUrl x -> "url(" <> x <> ")"
    PathShape x -> toCSS x
    PathBorderBox -> "border-box"
    PathPaddingBox -> "padding-box"
    PathContentBox -> "content-box"
    PathMarginBox -> "margin-box"
    PathFillBox -> "fill-box"
    PathStrokeBox -> "stroke-box"
    PathViewBox -> "view-box"


data ShapeRadius = ShapeRadiusLength Length
                 | ShapeRadiusPercent Percent
                 | ShapeRadiusClosestSide
                 | ShapeRadiusFarthestSide
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS ShapeRadius where
  toCSS = \case
    ShapeRadiusLength x -> toCSS x
    ShapeRadiusPercent x -> toCSS x
    ShapeRadiusClosestSide -> "closest-side"
    ShapeRadiusFarthestSide -> "farthest-side"

data BasicShape = ShapePath Path
                | ShapeInset [Dimension] (Maybe Radius)
                | ShapeCircle (Maybe ShapeRadius) (Maybe Position)
                | ShapeEllipse (Maybe (ShapeRadius, ShapeRadius)) (Maybe Position)
                | ShapePolygon (Maybe FillRule) [(Dimension, Dimension)]
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS BasicShape where
  toCSS = \case
    ShapePath x -> toCSS x
    ShapeInset x (Just y) -> "inset(" <> intercalate " " (toCSS <$> x) <> " round " <> toCSS y <> ")"
    ShapeInset x Nothing -> "inset(" <> intercalate " " (toCSS <$> x) <> ")"
    ShapeCircle Nothing Nothing -> "circle()"
    ShapeCircle (Just x) Nothing -> "circle(" <> toCSS x <> ")"
    ShapeCircle Nothing (Just x) -> "circle(at " <> toCSS x <> ")"
    ShapeCircle (Just x) (Just y) -> "circle(" <> toCSS x <> " at " <> toCSS y <> ")"
    ShapeEllipse Nothing Nothing -> "ellipse()"
    ShapeEllipse (Just (x,y)) Nothing -> "ellipse(" <> toCSS x <> " " <> toCSS y <> ")"
    ShapeEllipse Nothing (Just x) -> "ellipse(at " <> toCSS x <> ")"
    ShapeEllipse (Just (x,y)) (Just z) -> "ellipse(" <> toCSS x <> " " <> toCSS y <> " at " <> toCSS z <> ")"
    ShapePolygon Nothing x -> "polygon(" <> intercalate "," ((\(y,z) -> toCSS y <> " " <> toCSS z) <$> x) <> ")"
    ShapePolygon (Just w) x -> "polygon(" <> toCSS w <> ", " <> intercalate "," ((\(y,z) -> toCSS y <> " " <> toCSS z) <$> x) <> ")"


data OffsetRotation = OffsetRotateAuto
                    | OffsetRotateAngle Angle
                    | OffsetRotateAutoAngle Angle
                    | OffsetRotateReverse
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS OffsetRotation where
  toCSS = \case
    OffsetRotateAuto -> "auto"
    OffsetRotateAngle x -> toCSS x
    OffsetRotateAutoAngle x -> "auto " <> toCSS x
    OffsetRotateReverse -> "reverse"


data Order = OrderVal Int
           | OrderInherit
           | OrderInitial
           | OrderUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Order where
  toCSS = \case
    OrderVal x -> toCSS x
    OrderInherit -> "inherit"
    OrderInitial -> "initial"
    OrderUnset -> "unset"


data Orientation = OrientationAuto
                 | OrientationPortrait
                 | OrientationLandscape
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS Orientation where
  toCSS = \case
    OrientationAuto -> "auto"
    OrientationPortrait -> "portrait"
    OrientationLandscape -> "landscape"


data Orphans = OrphansVal Int
             | OrphansInherit
             | OrphansInitial
             | OrphansUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Orphans where
  toCSS = \case
    OrphansVal x -> toCSS x
    OrphansInherit -> "inherit"
    OrphansInitial -> "initial"
    OrphansUnset -> "unset"


data OutlineOffset = OutlineOffsetLength Length
                   | OutlineOffsetInherit
                   | OutlineOffsetInitial
                   | OutlineOffsetUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS OutlineOffset where
  toCSS = \case
    OutlineOffsetLength x -> toCSS x
    OutlineOffsetInitial -> "initial"
    OutlineOffsetInherit -> "inherit"
    OutlineOffsetUnset -> "unset"


data OverflowAnchor = OverflowAnchorAuto
                    | OverflowAnchorNone
                    | OverflowAnchorInherit
                    | OverflowAnchorInitial
                    | OverflowAnchorUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS OverflowAnchor where
  toCSS = \case
    OverflowAnchorAuto -> "auto"
    OverflowAnchorNone -> "none"
    OverflowAnchorInherit -> "inherit"
    OverflowAnchorInitial -> "initial"
    OverflowAnchorUnset -> "unset"


data OverflowMode = OverflowVisible
                  | OverflowHidden
                  | OverflowClip
                  | OverflowScroll
                  | OverflowAuto
                  | OverflowInherit
                  | OverflowInitial
                  | OverflowUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS OverflowMode where
  toCSS = \case
    OverflowVisible -> "visible"
    OverflowHidden -> "hidden"
    OverflowScroll -> "scroll"
    OverflowClip -> "clip"
    OverflowAuto -> "auto"
    OverflowInherit -> "inherit"
    OverflowInitial -> "initial"
    OverflowUnset -> "unset"


data OverflowWrap = OverflowWrapNormal
                  | OverflowWrapBreakWord
                  | OverflowWrapAnywhere
                  | OverflowWrapInherit
                  | OverflowWrapInitial
                  | OverflowWrapUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS OverflowWrap where
  toCSS = \case
    OverflowWrapNormal -> "normal"
    OverflowWrapBreakWord -> "break-word"
    OverflowWrapAnywhere -> "anywhere"
    OverflowWrapInherit -> "inherit"
    OverflowWrapInitial -> "initial"
    OverflowWrapUnset -> "unset"


data OverscrollBehavior = OverscrollAuto
                        | OverscrollContain
                        | OverscrollNone
                        | OverscrollInitial
                        | OverscrollInherit
                        | OverscrollUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS OverscrollBehavior where
  toCSS = \case
    OverscrollAuto -> "auto"
    OverscrollContain -> "contain"
    OverscrollNone -> "none"
    OverscrollInitial -> "initial"
    OverscrollInherit -> "inherit"
    OverscrollUnset -> "unset"


data Padding = PaddingLength Length
             | PaddingPercent Percent
             | PaddingInherit
             | PaddingInitial
             | PaddingUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Padding where
  toCSS = \case
    PaddingLength x -> toCSS x
    PaddingPercent x -> toCSS x
    PaddingInherit -> "inherit"
    PaddingInitial -> "initial"
    PaddingUnset -> "unset"


data PaintOrderItem = PaintFill
                    | PaintStroke
                    | PaintMarkers
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS PaintOrderItem where
  toCSS = \case
    PaintFill -> "fill"
    PaintStroke -> "stroke"
    PaintMarkers -> "markers"


data Perspective = PerspectiveNone
                 | PerspectiveLength Length
                 | PerspectiveInherit
                 | PerspectiveInitial
                 | PerspectiveUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Perspective where
  toCSS = \case
    PerspectiveNone -> "none"
    PerspectiveLength x -> toCSS x
    PerspectiveInherit -> "inherit"
    PerspectiveInitial -> "initial"
    PerspectiveUnset -> "unset"


data PerspectiveOrigin =
    PerspectiveOriginPosition Position
  | PerspectiveOriginInherit
  | PerspectiveOriginInitial
  | PerspectiveOriginUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS PerspectiveOrigin where
  toCSS = \case
    PerspectiveOriginPosition x -> toCSS x
    PerspectiveOriginInherit -> "inherit"
    PerspectiveOriginInitial -> "initial"
    PerspectiveOriginUnset -> "unset"


data PlaceContent =
    PlaceContentStart
  | PlaceContentEnd
  | PlaceContentFlexStart
  | PlaceContentFlexEnd
  | PlaceContentCenter
  | PlaceContentLeft
  | PlaceContentRight
  | PlaceContentSpaceBetween
  | PlaceContentBaseline
  | PlaceContentFirstBaseline
  | PlaceContentLastBaseline
  | PlaceContentSpaceAround
  | PlaceContentSpaceEvenly
  | PlaceContentStretch
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS PlaceContent where
  toCSS = \case
    PlaceContentStart -> "start"
    PlaceContentEnd -> "end"
    PlaceContentFlexStart -> "flex-start"
    PlaceContentFlexEnd -> "flex-end"
    PlaceContentCenter -> "center"
    PlaceContentLeft -> "left"
    PlaceContentRight -> "right"
    PlaceContentSpaceBetween -> "space-between"
    PlaceContentBaseline -> "baseline"
    PlaceContentFirstBaseline -> "first baseline"
    PlaceContentLastBaseline -> "last baseline"
    PlaceContentSpaceAround -> "space-around"
    PlaceContentSpaceEvenly -> "space-evenly"
    PlaceContentStretch -> "stretch"


data PointerEvents =
    PointerEventsAuto
  | PointerEventsNone
  | PointerEventsVisiblePainted
  | PointerEventsVisibleFill
  | PointerEventsVisibleStroke
  | PointerEventsVisible
  | PointerEventsPainted
  | PointerEventsFill
  | PointerEventsStroke
  | PointerEventsAll
  | PointerEventsInherit
  | PointerEventsInitial
  | PointerEventsUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS PointerEvents where
  toCSS = \case
    PointerEventsAuto -> "auto"
    PointerEventsNone -> "none"
    PointerEventsVisiblePainted -> "visiblePaitned"
    PointerEventsVisibleFill -> "visibleFill"
    PointerEventsVisibleStroke -> "visibleStroke"
    PointerEventsVisible -> "visible"
    PointerEventsPainted -> "painted"
    PointerEventsFill -> "fill"
    PointerEventsStroke -> "stroke"
    PointerEventsAll -> "all"
    PointerEventsInherit -> "inherit"
    PointerEventsInitial -> "initial"
    PointerEventsUnset -> "unset"


data PositionMode =
    PositionStatic
  | PositionRelative
  | PositionAbsolute
  | PositionFixed
  | PositionSticky
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS PositionMode where
  toCSS = \case
    PositionStatic -> "static"
    PositionRelative -> "relative"
    PositionAbsolute -> "absolute"
    PositionFixed -> "fixed"
    PositionSticky -> "sticky"


data Quotes = QuotesNone
            | QuotesAuto
            | QuotesVals [(Text,Text)]
            | QuotesInherit
            | QuotesInitial
            | QuotesUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Quotes where
  toCSS = \case
    QuotesNone -> "none"
    QuotesAuto -> "auto"
    QuotesVals x -> intercalate " " $ (\(y,z) -> "\"" <> y <> "\" \"" <> z <> "\"") <$> x
    QuotesInherit -> "inherit"
    QuotesInitial -> "initial"
    QuotesUnset -> "unset"


data Resize =
    ResizeNone
  | ResizeBoth
  | ResizeHorizontal
  | ResizeVertical
  | ResizeBlock
  | ResizeInline
  | ResizeInherit
  | ResizeInitial
  | ResizeUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS Resize where
  toCSS = \case
    ResizeNone -> "none"
    ResizeBoth -> "both"
    ResizeHorizontal -> "horizontal"
    ResizeVertical -> "vertical"
    ResizeBlock -> "block"
    ResizeInline -> "inline"
    ResizeInherit -> "inherit"
    ResizeInitial -> "initial"
    ResizeUnset -> "unset"


data Axis = XAxis | YAxis | ZAxis
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS Axis where
  toCSS = \case
    XAxis -> "x"
    YAxis -> "y"
    ZAxis -> "z"


data Vector3D = Vector3D Double Double Double
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Vector3D where
  toCSS (Vector3D x y z) = intercalate " " $ toCSS <$> [x,y,z]


data Rotate = RotateNone
            | RotateAngle Angle
            | RotateAxis Axis Angle
            | RotateVec Vector3D Angle
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Rotate where
  toCSS = \case
    RotateNone -> "none"
    RotateAngle x -> toCSS x
    RotateAxis x y -> toCSS x <> " " <> toCSS y
    RotateVec x y -> toCSS x <> " " <> toCSS y


data RowGap = RowGapLength Length
            | RowGapPercent Percent
            | RowGapInherit
            | RowGapInitial
            | RowGapUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS RowGap where
  toCSS = \case
    RowGapLength x -> toCSS x
    RowGapPercent x -> toCSS x
    RowGapInherit -> "inherit"
    RowGapInitial -> "initial"
    RowGapUnset -> "unset"


data Scale = Scale1D Double
           | Scale2D Double Double
           | Scale3D Double Double Double
           | ScaleNone
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Scale where
  toCSS = \case
    Scale1D x -> toCSS x
    Scale2D x y -> toCSS x <> " " <> toCSS y
    Scale3D x y z -> toCSS x <> " " <> toCSS y <> " " <> toCSS z
    ScaleNone -> "none"


data ScrollBehavior = ScrollBehaviorAuto
                    | ScrollBehaviorSmooth
                    | ScrollBehaviorInherit
                    | ScrollBehaviorInitial
                    | ScrollBehaviorUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS ScrollBehavior where
  toCSS = \case
    ScrollBehaviorAuto -> "auto"
    ScrollBehaviorSmooth -> "smooth"
    ScrollBehaviorInherit -> "inherit"
    ScrollBehaviorInitial -> "initial"
    ScrollBehaviorUnset -> "unset"


data ScrollMargin = ScrollMarginLength Length
                  | ScrollMarginInherit
                  | ScrollMarginInitial
                  | ScrollMarginUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS ScrollMargin where
  toCSS = \case
    ScrollMarginLength x -> toCSS x
    ScrollMarginInherit -> "inherit"
    ScrollMarginInitial -> "initial"
    ScrollMarginUnset -> "unset"


data ScrollPadding = ScrollPaddingAuto
                   | ScrollPaddingLength Length
                   | ScrollPaddingPercent Percent
                   | ScrollPaddingInherit
                   | ScrollPaddingInitial
                   | ScrollPaddingUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS ScrollPadding where
  toCSS = \case
    ScrollPaddingAuto -> "auto"
    ScrollPaddingLength x -> toCSS x
    ScrollPaddingPercent x -> toCSS x
    ScrollPaddingInherit -> "inherit"
    ScrollPaddingInitial -> "initial"
    ScrollPaddingUnset -> "unset"


data ScrollbarColor =
    ScrollbarColorAuto
  | ScrollbarColorDark
  | ScrollbarColorLight
  | ScrollbarColors Color Color
  | ScrollbarColorInherit
  | ScrollbarColorInitial
  | ScrollbarColorUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS ScrollbarColor where
  toCSS = \case
    ScrollbarColorAuto -> "auto"
    ScrollbarColorDark -> "dark"
    ScrollbarColorLight -> "light"
    ScrollbarColors x y -> toCSS x <> " " <> toCSS y
    ScrollbarColorInherit -> "inherit"
    ScrollbarColorInitial -> "initial"
    ScrollbarColorUnset -> "unset"


data ScrollbarWidth =
    ScrollbarWidthAuto
  | ScrollbarWidthThin
  | ScrollbarWidthNone
  | ScrollbarWidthInherit
  | ScrollbarWidthInitial
  | ScrollbarWidthUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS ScrollbarWidth where
  toCSS = \case
    ScrollbarWidthAuto -> "auto"
    ScrollbarWidthThin -> "thin"
    ScrollbarWidthNone -> "none"
    ScrollbarWidthInherit -> "inherit"
    ScrollbarWidthInitial -> "initial"
    ScrollbarWidthUnset -> "unset"


data ShapeImageThreshold = ShapeImageThresholdVal Double
                         | ShapeImageThresholdInherit
                         | ShapeImageThresholdInitial
                         | ShapeImageThresholdUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS ShapeImageThreshold where
  toCSS = \case
    ShapeImageThresholdVal x -> toCSS x
    ShapeImageThresholdInherit -> "inherit"
    ShapeImageThresholdInitial -> "initial"
    ShapeImageThresholdUnset -> "unset"


data ShapeMargin = ShapeMarginLength Length
                 | ShapeMarginPercent Percent
                 | ShapeMarginInherit
                 | ShapeMarginInitial
                 | ShapeMarginUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS ShapeMargin where
  toCSS = \case
    ShapeMarginLength x -> toCSS x
    ShapeMarginPercent x -> toCSS x
    ShapeMarginInherit -> "inherit"
    ShapeMarginInitial -> "initial"
    ShapeMarginUnset -> "unset"


data ShapeOutside = ShapeOutsideNone
                  | ShapeOutsideMarginBox
                  | ShapeOutsideBorderBox
                  | ShapeOutsidePaddingBox
                  | ShapeOutsideContentBox
                  | ShapeOutsideBasicShape BasicShape
                  | ShapeOutsideImage Image
                  | ShapeOutsideInitial
                  | ShapeOutsideInherit
                  | ShapeOutsideUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS ShapeOutside where
  toCSS = \case
    ShapeOutsideNone -> "none"
    ShapeOutsideMarginBox -> "margin-box"
    ShapeOutsideBorderBox -> "border-box"
    ShapeOutsideContentBox -> "content-box"
    ShapeOutsidePaddingBox -> "padding-box"
    ShapeOutsideBasicShape x -> toCSS x
    ShapeOutsideImage x -> toCSS x
    ShapeOutsideInitial -> "initial"
    ShapeOutsideInherit -> "inherit"
    ShapeOutsideUnset -> "unset"


data TabSize = TabSizeInt Int
             | TabSizeLength Length
             | TabSizeInherit
             | TabSizeInitial
             | TabSizeUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS TabSize where
  toCSS = \case
    TabSizeInt x -> toCSS x
    TabSizeLength x -> toCSS x
    TabSizeInherit -> "inherit"
    TabSizeInitial -> "initial"
    TabSizeUnset -> "unset"


data TableLayout = TableLayoutAuto
                 | TableLayoutFixed
                 | TableLayoutInherit
                 | TableLayoutInitial
                 | TableLayoutUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS TableLayout where
  toCSS = \case
    TableLayoutAuto -> "auto"
    TableLayoutFixed -> "fixed"
    TableLayoutInherit -> "inherit"
    TableLayoutInitial -> "initial"
    TableLayoutUnset -> "unset"


data TextAlignKeyword = TextAlignLeft
                      | TextAlignRight
                      | TextAlignStart
                      | TextAlignEnd
                      | TextAlignCenter
                      | TextAlignJustify
                      | TextAlignJustifyAll
                      | TextAlignMatchParent
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS TextAlignKeyword where
  toCSS = \case
    TextAlignLeft -> "left"
    TextAlignRight -> "right"
    TextAlignStart -> "start"
    TextAlignEnd -> "end"
    TextAlignCenter -> "center"
    TextAlignJustify -> "justify"
    TextAlignJustifyAll -> "justify-all"
    TextAlignMatchParent -> "match-parent"

data TextAlign = TextAlignKeyword TextAlignKeyword
               | TextAlignChar Text
               | TextAlignCharPlusKeyword Text TextAlignKeyword
               | TextAlignInherit
               | TextAlignInitial
               | TextAlignUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS TextAlign where
  toCSS = \case
    TextAlignKeyword x -> toCSS x
    TextAlignChar x -> "\"" <> x <> "\""
    TextAlignInherit -> "inherit"
    TextAlignInitial -> "initial"
    TextAlignUnset -> "unset"


data TextAlignLast = TextAlignLastAuto
                   | TextAlignLastStart
                   | TextAlignLastEnd
                   | TextAlignLastLeft
                   | TextAlignLastRight
                   | TextAlignLastCenter
                   | TextAlignLastJustify
                   | TextAlignLastInherit
                   | TextAlignLastInitial
                   | TextAlignLastUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS TextAlignLast where
  toCSS = \case
    TextAlignLastAuto -> "auto"
    TextAlignLastStart -> "start"
    TextAlignLastEnd -> "end"
    TextAlignLastLeft -> "left"
    TextAlignLastRight -> "right"
    TextAlignLastCenter -> "center"
    TextAlignLastJustify -> "justify"
    TextAlignLastInherit -> "inherit"
    TextAlignLastInitial -> "initial"
    TextAlignLastUnset -> "unset"


data TextCombineUpright = TextCombineUprightNone
                        | TextCombineUprightAll
                        | TextCombineUprightDigits
                        | TextCombineUprightDigitsN Int
                        | TextCombineUprightInherit
                        | TextCombineUprightInitial
                        | TextCombineUprightUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS TextCombineUpright where
  toCSS = \case
    TextCombineUprightNone -> "none"
    TextCombineUprightAll -> "all"
    TextCombineUprightDigits -> "digits"
    TextCombineUprightDigitsN n -> "digits " <> toCSS n
    TextCombineUprightInherit -> "inherit"
    TextCombineUprightInitial -> "initial"
    TextCombineUprightUnset -> "unset"


data TextDecorationLineType = TextDecorationUnderline
                            | TextDecorationOverline
                            | TextDecorationLineThrough
                            | TextDecorationBlink
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS TextDecorationLineType where
  toCSS = \case
    TextDecorationUnderline -> "underline"
    TextDecorationOverline -> "overline"
    TextDecorationLineThrough -> "line-through"
    TextDecorationBlink -> "blink"


data TextDecorationLine = TextDecorationLines [TextDecorationLineType]
                        | TextDecorationSpellingError
                        | TextDecorationGrammarError
                        | TextDecorationLineInherit
                        | TextDecorationLineInitial
                        | TextDecorationLineUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS TextDecorationLine where
  toCSS = \case
    TextDecorationLines [] -> "none"
    TextDecorationLines x -> intercalate " " $ toCSS <$> x
    TextDecorationSpellingError -> "spelling-error"
    TextDecorationGrammarError -> "grammar-error"
    TextDecorationLineInherit -> "inherit"
    TextDecorationLineInitial -> "initial"
    TextDecorationLineUnset -> "unset"


data TextDecorationStyle =
    TextDecorationSolid
  | TextDecorationDouble
  | TextDecorationDotted
  | TextDecorationDashed
  | TextDecorationWavy
  | TextDecorationStyleInherit
  | TextDecorationStyleInitial
  | TextDecorationStyleUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS TextDecorationStyle where
  toCSS = \case
    TextDecorationSolid -> "solid"
    TextDecorationDouble -> "double"
    TextDecorationDotted -> "dotted"
    TextDecorationDashed -> "dashed"
    TextDecorationWavy -> "wavy"
    TextDecorationStyleInherit -> "inherit"
    TextDecorationStyleInitial -> "initial"
    TextDecorationStyleUnset -> "unset"


data TextDecorationThickness =
    TextDecorationThicknessAuto
  | TextDecorationThicknessFromFont
  | TextDecorationThicknessLength Length
  | TextDecorationThicknessPercent Percent
  | TextDecorationThicknessInherit
  | TextDecorationThicknessInitial
  | TextDecorationThicknessUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS TextDecorationThickness where
  toCSS = \case
    TextDecorationThicknessAuto -> "auto"
    TextDecorationThicknessFromFont -> "from-font"
    TextDecorationThicknessLength x -> toCSS x
    TextDecorationThicknessPercent x -> toCSS x
    TextDecorationThicknessInherit -> "inherit"
    TextDecorationThicknessInitial -> "initial"
    TextDecorationThicknessUnset -> "unset"


data TextEmphasisStyleValue =
    TextEmphasisChar Text
  | TextEmphasisFilled
  | TextEmphasisOpen
  | TextEmphasisSesame
  | TextEmphasisDot
  | TextEmphasisCircle
  | TextEmphasisDoubleCircle
  | TextEmphasisTriangle
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS TextEmphasisStyleValue where
  toCSS = \case
    TextEmphasisChar x -> "'" <> x <> "'"
    TextEmphasisFilled -> "filled"
    TextEmphasisOpen -> "open"
    TextEmphasisSesame -> "sesame"
    TextEmphasisDot -> "dot"
    TextEmphasisCircle -> "circle"
    TextEmphasisDoubleCircle -> "double-circle"
    TextEmphasisTriangle -> "triangle"

data TextEmphasisStyle = TextEmphasisStyles [TextEmphasisStyleValue]
                       | TextEmphasisStyleInherit
                       | TextEmphasisStyleInitial
                       | TextEmphasisStyleUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS TextEmphasisStyle where
  toCSS = \case
    TextEmphasisStyles [] -> "none"
    TextEmphasisStyleInherit -> "inherit"
    TextEmphasisStyleInitial -> "initial"
    TextEmphasisStyleUnset -> "unset"


data TextEmphasisPositionHorizontal = TextEmphasisOver
                                    | TextEmphasisUnder
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS TextEmphasisPositionHorizontal where
  toCSS = \case
    TextEmphasisOver -> "over"
    TextEmphasisUnder -> "under"


data TextEmphasisPositionVertical = TextEmphasisRight
                                  | TextEmphasisLeft
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS TextEmphasisPositionVertical where
  toCSS = \case
    TextEmphasisRight -> "right"
    TextEmphasisLeft -> "left"


data TextEmphasisPosition = TextEmphasisPositions
                            TextEmphasisPositionHorizontal
                            TextEmphasisPositionVertical
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS TextEmphasisPosition where
  toCSS = \case
    TextEmphasisPositions x y -> toCSS x <> " " <> toCSS y


data TextIndent = TextIndentLength Length
                | TextIndentPercent Percent
                | TextIndentEachLine Dimension
                | TextIndentHanging Dimension
                | TextIndentInherit
                | TextIndentInitial
                | TextIndentUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS TextIndent where
  toCSS = \case
    TextIndentLength x -> toCSS x
    TextIndentPercent x -> toCSS x
    TextIndentEachLine x -> toCSS x <> " each-line"
    TextIndentHanging x -> toCSS x <> " hanging"
    TextIndentInherit -> "inherit"
    TextIndentInitial -> "initial"
    TextIndentUnset -> "unset"


data TextJustify = TextJustifyNone
                 | TextJustifyAuto
                 | TextJustifyInterWord
                 | TextJustifyInterCharacter
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS TextJustify where
  toCSS = \case
    TextJustifyNone -> "none"
    TextJustifyAuto -> "auto"
    TextJustifyInterWord -> "inter-word"
    TextJustifyInterCharacter -> "inter-character"


data TextOrientation =
    TextOrientationMixed
  | TextOrientationUpright
  | TextOrientationSidewaysRight
  | TextOrientationSideways
  | TextOrientationUseGlyphOrientation
  | TextOrientationInherit
  | TextOrientationInitial
  | TextOrientationUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS TextOrientation where
  toCSS = \case
    TextOrientationMixed -> "mixed"
    TextOrientationUpright -> "upright"
    TextOrientationSidewaysRight -> "sideways-right"
    TextOrientationSideways -> "sideways"
    TextOrientationUseGlyphOrientation -> "use-glyph-orientation"
    TextOrientationInherit -> "inherit"
    TextOrientationInitial -> "initial"
    TextOrientationUnset -> "unset"


data TextOverflow = TextOverflowClip
                  | TextOverflowEllipsis
                  | TextOverflowString Text
                  | TextOverflowFade
                  | TextOverflowFadeLength Length
                  | TextOverflowFadePercent Percent
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS TextOverflow where
  toCSS = \case
    TextOverflowClip -> "clip"
    TextOverflowEllipsis -> "ellipsis"
    TextOverflowString x -> "\"" <> x <> "\""
    TextOverflowFade -> "fade"
    TextOverflowFadeLength x -> "fade(" <> toCSS x <> ")"
    TextOverflowFadePercent x -> "fade(" <> toCSS x <> ")"


data TextRendering =
    TextRenderingAuto
  | TextRenderingOptimizeSpeed
  | TextRenderingOptimizeLegibility
  | TextRenderingGeometricPrecision
  | TextRenderingInherit
  | TextRenderingInitial
  | TextRenderingUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS TextRendering where
  toCSS = \case
    TextRenderingAuto -> "auto"
    TextRenderingOptimizeSpeed -> "optimizeSpeed"
    TextRenderingOptimizeLegibility -> "optimizeLegibility"
    TextRenderingGeometricPrecision -> "geometricPrecision"
    TextRenderingInherit -> "inherit"
    TextRenderingInitial -> "initial"
    TextRenderingUnset -> "unset"


data Shadow = Shadow { shadowOffsetX    :: Length
                     , shadowOffsetY    :: Length
                     , shadowBlurRadius :: Length
                     , shadowColor      :: Color }
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Shadow where
  toCSS (Shadow x r y c) = toCSS x <> " " <> toCSS y <> " " <> toCSS r <> " " <> toCSS c

data TextShadow = TextShadows [Shadow]
                | TextShadowInherit
                | TextShadowInitial
                | TextShadowUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS TextShadow where
  toCSS = \case
    TextShadows x -> listToCSS x
    TextShadowInherit -> "inherit"
    TextShadowInitial -> "initial"
    TextShadowUnset -> "unset"


data TextTransform =
    TextTransformNone
  | TextTransformCapitalize
  | TextTransformUppercase
  | TextTransformLowercase
  | TextTransformFullWidth
  | TextTransformFullSizeKana
  | TextTransformInherit
  | TextTransformInitial
  | TextTransformUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS TextTransform where
  toCSS = \case
    TextTransformNone -> "none"
    TextTransformCapitalize -> "capitalize"
    TextTransformUppercase -> "uppercase"
    TextTransformLowercase -> "lowercase"
    TextTransformFullWidth -> "full-width"
    TextTransformFullSizeKana -> "full-size-kana"
    TextTransformInherit -> "inherit"
    TextTransformInitial -> "initial"
    TextTransformUnset -> "unset"


data TextUnderlineOffset =
    TextUnderlineOffsetAuto
  | TextUnderlineOffsetLength Length
  | TextUnderlineOffsetPercent Percent
  | TextUnderlineOffsetInherit
  | TextUnderlineOffsetInitial
  | TextUnderlineOffsetUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS TextUnderlineOffset where
  toCSS = \case
    TextUnderlineOffsetAuto -> "auto"
    TextUnderlineOffsetLength x -> toCSS x
    TextUnderlineOffsetPercent x -> toCSS x
    TextUnderlineOffsetInherit -> "inherit"
    TextUnderlineOffsetInitial -> "initial"
    TextUnderlineOffsetUnset -> "unset"


data TextUnderlinePosition =
    TextUnderlinePositionAuto
  | TextUnderlinePositionLeft
  | TextUnderlinePositionRight
  | TextUnderlinePositionUnder
  | TextUnderlinePositionUnderLeft
  | TextUnderlinePositionUnderRight
  | TextUnderlinePositionInherit
  | TextUnderlinePositionInitial
  | TextUnderlinePositionUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS TextUnderlinePosition where
  toCSS = \case
    TextUnderlinePositionAuto -> "auto"
    TextUnderlinePositionLeft -> "left"
    TextUnderlinePositionRight -> "right"
    TextUnderlinePositionUnder -> "under"
    TextUnderlinePositionUnderLeft -> "under left"
    TextUnderlinePositionUnderRight -> "under right"
    TextUnderlinePositionInherit -> "inherit"
    TextUnderlinePositionInitial -> "initial"
    TextUnderlinePositionUnset -> "unset"


data TouchActionEnablement =
    TouchActionAuto
  | TouchActionNone
  | TouchActionManipulation
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS TouchActionEnablement where
  toCSS = \case
    TouchActionAuto -> "auto"
    TouchActionNone -> "none"
    TouchActionManipulation -> "manipulation"


data TouchActionPanHorizontal =
    TouchActionPanX
  | TouchActionPanLeft
  | TouchActionPanRight
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS TouchActionPanHorizontal where
  toCSS = \case
    TouchActionPanX -> "pan-x"
    TouchActionPanLeft -> "pan-left"
    TouchActionPanRight -> "pan-right"


data TouchActionPanVertical =
    TouchActionPanY
  | TouchActionPanUp
  | TouchActionPanDown
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS TouchActionPanVertical where
  toCSS = \case
    TouchActionPanY -> "pan-y"
    TouchActionPanUp -> "pan-up"
    TouchActionPanDown -> "pan-down"


data TouchActionPinchZoom = TouchActionPinchZoom | TouchActionNoPinchZoom
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS TouchActionPinchZoom where
  toCSS = \case
    TouchActionPinchZoom -> "pinch-zoom"
    TouchActionNoPinchZoom -> ""


data TouchAction = TouchActions (Maybe TouchActionEnablement)
                                (Maybe TouchActionPanHorizontal)
                                (Maybe TouchActionPanVertical)
                                (Maybe TouchActionPinchZoom)
                 | TouchActionInherit
                 | TouchActionInitial
                 | TouchActionUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS TouchAction where
  toCSS (TouchActions en ph pv pz) = maybeToCSS en
                           <> " " <> maybeToCSS ph
                           <> " " <> maybeToCSS pv
                           <> " " <> maybeToCSS pz
  toCSS TouchActionInherit = "inherit"
  toCSS TouchActionInitial = "initial"
  toCSS TouchActionUnset   = "unset"


data Col4 = Col4 Double Double Double Double
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Col4 where
  toCSS (Col4 a b c d) = listToCSS [a,b,c,d]


data Matrix4x4 = Matrix4x4 Col4 Col4 Col4 Col4
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Matrix4x4 where
  toCSS (Matrix4x4 a b c d) = listToCSS [a,b,c,d]


data TransformBox =
    TransformContentBox
  | TransformBorderBox
  | TransformFillBox
  | TransformStrokeBox
  | TransformViewBox
  | TransformBoxInherit
  | TransformBoxInitial
  | TransformBoxUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS TransformBox where
  toCSS = \case
    TransformContentBox -> "content-box"
    TransformBorderBox -> "border-box"
    TransformFillBox -> "fill-box"
    TransformStrokeBox -> "stroke-box"
    TransformViewBox -> "view-box"
    TransformBoxInherit -> "inherit"
    TransformBoxInitial -> "initial"
    TransformBoxUnset -> "unset"


data Transform =
    TransformNone
  | TransformMatrix Double Double Double Double Double Double
  | TransformMatrix3D Matrix4x4
  | TransformPerspective Length
  | TransformRotate Angle
  | TransformRotate3D Double Double Double Angle
  | TransformRotateX Angle
  | TransformRotateY Angle
  | TransformRotateZ Angle
  | TransformTranslate Length Percent
  | TransformTranslate3D Length Percent Length
  | TransformTranslateX Length
  | TransformTranslateY Length
  | TransformTranslateZ Length
  | TransformScale Double Double
  | TransformScale3D Double Double Double
  | TransformScaleX Double
  | TransformScaleY Double
  | TransformScaleZ Double
  | TransformSkew Angle Angle
  | TransformSkewX Angle
  | TransformSkewY Angle
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Transform where
  toCSS = \case
    TransformNone -> "none"
    TransformMatrix a b c d e f -> "matrix(" <> listToCSS [a,b,c,d,e,f] <> ")"
    TransformMatrix3D x -> "matrix3d(" <> toCSS x <> ")"
    TransformPerspective x -> "perspective(" <> toCSS x <> ")"
    TransformRotate x -> "rotate(" <> toCSS x <> ")"
    TransformRotate3D a b c d -> "rotate3d(" <> toCSS a <> ", " <> toCSS a <> ", " <> toCSS c <> ", " <> toCSS d <> ")"
    TransformRotateX x -> "rotateX(" <> toCSS x <> ")"
    TransformRotateY x -> "rotateY(" <> toCSS x <> ")"
    TransformRotateZ x -> "rotateZ(" <> toCSS x <> ")"
    TransformTranslate x y -> "translate(" <> toCSS x <> "," <> toCSS y <> ")"
    TransformTranslateX x -> "translateX(" <> toCSS x <> ")"
    TransformTranslateY x -> "translateY(" <> toCSS x <> ")"
    TransformTranslateZ x -> "translateZ(" <> toCSS x <> ")"
    TransformScale x y -> "scale(" <> toCSS x <> ", " <> toCSS y <> ")"
    TransformScale3D a b c -> "scale3d(" <> toCSS a <> ", " <> toCSS b <> ", " <> toCSS c
    TransformScaleX x -> "scaleX(" <> toCSS x <> ")"
    TransformScaleY x -> "scaleY(" <> toCSS x <> ")"
    TransformScaleZ x -> "scaleZ(" <> toCSS x <> ")"
    TransformSkew a b -> "skew(" <> toCSS a <> ", " <> toCSS b <> ")"
    TransformSkewX x -> "skew(" <> toCSS x <> ")"
    TransformSkewY x -> "skew(" <> toCSS x <> ")"


data Transforms = Transforms [Transform]
                | TransformInherit
                | TransformInitial
                | TransformUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Transforms where
  toCSS = \case
    Transforms [] -> "none"
    Transforms x -> intercalate " " $ toCSS <$> x
    TransformInherit -> "inherit"
    TransformInitial -> "initial"
    TransformUnset -> "unset"


data TransformStyle =
    TransformStyleFlat
  | TransformStylePreserve3D
  | TransformStyleInherit
  | TransformStyleInitial
  | TransformStyleUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS TransformStyle where
  toCSS = \case
    TransformStyleFlat -> "flat"
    TransformStylePreserve3D -> "preserve-3d"
    TransformStyleInherit -> "inherit"
    TransformStyleInitial -> "initial"
    TransformStyleUnset -> "unset"


data Durations = Durations [Duration]
               | DurationInherit
               | DurationInitial
               | DurationUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Durations where
  toCSS = \case
    Durations x -> listToCSS x
    DurationInherit -> "inherit"
    DurationInitial -> "initial"
    DurationUnset -> "unset"


data TransitionProperties = TransitionProperties [Text]
                          | TransitionNone
                          | TransitionAll
                          | TransitionInherit
                          | TransitionInitial
                          | TransitionUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS TransitionProperties where
  toCSS = \case
    TransitionProperties x -> listToCSS x
    TransitionNone -> "none"
    TransitionAll -> "all"
    TransitionInherit -> "inherit"
    TransitionInitial -> "initial"
    TransitionUnset -> "unset"


data TransitionTimingFunction =
    TimingEase
  | TimingEaseIn
  | TimingEaseOut
  | TimingEaseInOut
  | TimingLinear
  | TimingStepStart
  | TimingStepEnd
  | TimingSteps Int JumpTerm
  | TimingCubicBezier Double Double Double Double
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS TransitionTimingFunction where
  toCSS = \case
    TimingEase -> "ease"
    TimingEaseIn -> "ease-in"
    TimingEaseOut -> "ease-out"
    TimingEaseInOut -> "ease-in-out"
    TimingLinear -> "linear"
    TimingStepStart -> "step-start"
    TimingStepEnd -> "step-end"
    TimingSteps n j -> "steps(" <> toCSS n <> ", " <> toCSS j <> ")"
    TimingCubicBezier a b c d -> "cubic-bezier(" <> listToCSS [a,b,c,d] <> ")"


data TransitionTimingFunctions = TransitionTimingFunctions [TransitionTimingFunction]
                               | TransitionTimingFunctionInherit
                               | TransitionTimingFunctionInitial
                               | TransitionTimingFunctionUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS TransitionTimingFunctions where
  toCSS = \case
    TransitionTimingFunctions x -> listToCSS x
    TransitionTimingFunctionInherit -> "inherit"
    TransitionTimingFunctionInitial -> "initial"
    TransitionTimingFunctionUnset -> "unset"


data UnicodeBidi =
    UnicodeBidiNormal
  | UnicodeBidiEmbed
  | UnicodeBidiIsolate
  | UnicodeBidiOverride
  | UnicodeBidiIsolateOverride
  | UnicodeBidiPlainText
  | UnicodeBidiInherit
  | UnicodeBidiInitial
  | UnicodeBidiUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS UnicodeBidi where
  toCSS = \case
    UnicodeBidiNormal -> "normal"
    UnicodeBidiEmbed -> "embed"
    UnicodeBidiOverride -> "override"
    UnicodeBidiIsolateOverride -> "isolate-override"
    UnicodeBidiPlainText -> "plaintext"
    UnicodeBidiInherit -> "inherit"
    UnicodeBidiInitial -> "initial"
    UnicodeBidiUnset -> "unset"


data UnicodeRangePoint = UnicodeRangePoint Integer
                       | UnicodeRangeWildcard Text
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS UnicodeRangePoint where
  toCSS = \case
    UnicodeRangePoint x -> "U+" <> pack (showHex x "")
    UnicodeRangeWildcard x -> "U+" <> x


data UnicodeRange = UnicodeRange1 UnicodeRangePoint
                  | UnicodeRange2 UnicodeRangePoint UnicodeRangePoint
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS UnicodeRange where
  toCSS = \case
    UnicodeRange1 x -> toCSS x
    UnicodeRange2 x y -> toCSS x <> "-" <> toCSS y


data VerticalAlign =
    VerticalAlignBaseline
  | VerticalAlignSub
  | VerticalAlignSuper
  | VerticalAlignTextTop
  | VerticalAlignTextBottom
  | VerticalAlignMiddle
  | VerticalAlignTop
  | VerticalAlignBottom
  | VerticalAlignLength Length
  | VerticalAlignPercent Percent
  | VerticalAlignInherit
  | VerticalAlignInitial
  | VerticalAlignUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS VerticalAlign where
  toCSS = \case
    VerticalAlignBaseline -> "baseline"
    VerticalAlignSub -> "sub"
    VerticalAlignSuper -> "super"
    VerticalAlignTextTop -> "text-top"
    VerticalAlignTextBottom -> "text-bottom"
    VerticalAlignMiddle -> "middle"
    VerticalAlignTop -> "top"
    VerticalAlignBottom -> "bottom"
    VerticalAlignLength x -> toCSS x
    VerticalAlignPercent x -> toCSS x
    VerticalAlignInherit -> "inherit"
    VerticalAlignInitial -> "initial"
    VerticalAlignUnset -> "unset"


data WhiteSpace =
    WhiteSpaceNormal
  | WhiteSpaceNoWrap
  | WhiteSpacePre
  | WhiteSpacePreWrap
  | WhiteSpacePreLine
  | WhiteSpaceBreakSpaces
  | WhiteSpaceInherit
  | WhiteSpaceInitial
  | WhiteSpaceUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS WhiteSpace where
  toCSS = \case
    WhiteSpaceNormal -> "normal"
    WhiteSpaceNoWrap -> "nowrap"
    WhiteSpacePre -> "pre"
    WhiteSpacePreWrap -> "pre-wrap"
    WhiteSpacePreLine -> "pre-line"
    WhiteSpaceBreakSpaces -> "break-spaces"
    WhiteSpaceInitial -> "initial"
    WhiteSpaceInherit -> "inherit"
    WhiteSpaceUnset -> "unset"


data Widows = WidowMin Int
            | WidowMinInherit
            | WidowMinInitial
            | WidowMinUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS Widows where
  toCSS = \case
    WidowMin x -> toCSS x
    WidowMinInherit -> "inherit"
    WidowMinInitial -> "initial"
    WidowMinUnset -> "unset" 


data WillChange =
    WillChangeAuto
  | WillChangeScrollPosition
  | WillChangeContents
  | WillChangeProperties [Text]
  | WillChangeInherit
  | WillChangeInitial
  | WillChangeUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS WillChange where
  toCSS = \case
    WillChangeAuto -> "auto"
    WillChangeScrollPosition -> "scroll-position"
    WillChangeContents -> "contents"
    WillChangeProperties x -> listToCSS x
    WillChangeInherit -> "inherit"
    WillChangeInitial -> "initial"
    WillChangeUnset -> "unset"


data WordBreak = WordBreakNormal
               | WordBreakAll
               | WordBreakKeepAll
               | WordBreakWord
               | WordBreakInherit
               | WordBreakInitial
               | WordBreakUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS WordBreak where
  toCSS = \case
    WordBreakNormal -> "normal"
    WordBreakAll -> "break-all"
    WordBreakKeepAll -> "keep-all"
    WordBreakWord -> "break-word"
    WordBreakInherit -> "inherit"
    WordBreakInitial -> "initial"
    WordBreakUnset -> "unset"


data WordSpacing =
    WordSpacingNormal
  | WordSpacingLength Length
  | WordSpacingPercent Percent
  | WordSpacingInherit
  | WordSpacingInitial
  | WordSpacingUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS WordSpacing where
  toCSS = \case
    WordSpacingNormal -> "normal"
    WordSpacingLength x -> toCSS x
    WordSpacingPercent x -> toCSS x
    WordSpacingInherit -> "inherit"
    WordSpacingInitial -> "initial"
    WordSpacingUnset -> "unset"


data WritingMode = WritingModeHorizontalTb
                 | WritingModeVerticalRl
                 | WritingModeVerticalLr
                 | WritingModeInherit
                 | WritingModeInitial
                 | WritingModeUnset
  deriving (Eq, Ord, Bounded, Enum, Generic, Read, Show)

instance ToCSS WritingMode where
  toCSS = \case
    WritingModeHorizontalTb -> "horizontal-tb"
    WritingModeVerticalRl -> "vertical-rl"
    WritingModeVerticalLr -> "vertical-lr"
    WritingModeInherit -> "inherit"
    WritingModeInitial -> "initial"
    WritingModeUnset -> "unset"


data ZIndex = ZIndexAuto
            | ZIndexLayer Int
            | ZIndexInherit
            | ZIndexInitial
            | ZIndexUnset
  deriving (Eq, Ord, Generic, Read, Show)

instance ToCSS ZIndex where
  toCSS = \case
    ZIndexAuto -> "auto"
    ZIndexLayer x -> toCSS x
    ZIndexInherit -> "inherit"
    ZIndexInitial -> "initial"
    ZIndexUnset -> "unset"


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
  | Bottom' Offset
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
  | Left' Offset
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
  | MaskRepeat MaskRepeats
  | MaskSize MaskSizes
  | MaskType MaskType
  | MaxBlockSize Size
  | MaxHeight Size
  | MaxWidth Size
  | MinBlockSize Size
  | MinHeight Size
  | MinInlineSize Size
  | MinWidth Size
  | MinZoom ZoomFactor
  | MixBlendMode MixBlendMode
  -- TODO negative (counter)
  | ObjectFit ObjectFit
  | ObjectPosition ObjectPosition
  | OffsetAnchor OffsetPosition
  | OffsetDistance Dimension
  | OffsetPath Path
  | OffsetPosition OffsetPosition
  | OffsetRotate OffsetRotation
  | Opacity Proportion
  | Order Order
  | Orientation Orientation
  | Orphans Orphans
  | OutlineColor Color
  | OutlineOffset OutlineOffset
  | OutlineStyle BorderStyle
  | OutlineStyleAuto
  | OutlineWidth BorderWidth
  | OverflowAnchor OverflowAnchor
  | OverflowBlock OverflowMode
  | OverflowInline OverflowMode
  | OverflowWrap OverflowWrap
  | OverflowX OverflowMode
  | OverflowY OverflowMode
  | Overflow OverflowMode
  | OverscrollBehavior OverscrollBehavior
  | OverscrollBehaviorBlock OverscrollBehavior
  | OverscrollBehaviorInline OverscrollBehavior
  | OverscrollBehaviorX OverscrollBehavior
  | OverscrollBehaviorY OverscrollBehavior
  | Padding Padding
  | PaddingBlockEnd Padding
  | PaddingBlockStart Padding
  | PaddingBlock Padding
  | PaddingBottom Padding
  | PaddingInlineEnd Padding
  | PaddingInlineStart Padding
  | PaddingInline Padding
  | PaddingLeft Padding
  | PaddingRight Padding
  | PaddingTop Padding
  | PaintOrderNormal
  | PaintOrder [PaintOrderItem]
  | Perspective Perspective
  | PerspectiveOrigin PerspectiveOrigin
  | PlaceContent PlaceContent
  -- TODO place-items, place-self
  | PointerEvents PointerEvents
  | Position PositionMode
  -- TODO: prefix (counters)
  | Quotes Quotes
  | Resize Resize
  | Right' Offset
  | Rotate Rotate
  | RowGap RowGap
  | Scale Scale
  | ScrollBehavior ScrollBehavior
  | ScrollMarginBottom ScrollMargin
  | ScrollMarginLeft ScrollMargin
  | ScrollMarginRight ScrollMargin
  | ScrollMarginTop ScrollMargin
  | ScrollMargin ScrollMargin
  | ScrollMarginBlockEnd ScrollMargin
  | ScrollMarginBlockStart ScrollMargin
  | ScrollMarginBlock ScrollMargin
  | ScrollMarginInlineEnd ScrollMargin
  | ScrollMarginInlineStart ScrollMargin
  | ScrollMarginInline ScrollMargin
  | ScrollPadding ScrollPadding
  | ScrollPaddingBlock ScrollPadding
  | ScrollPaddingBlockEnd ScrollPadding
  | ScrollPaddingBlockStart ScrollPadding
  | ScrollPaddingBottom ScrollPadding
  | ScrollPaddingInline ScrollPadding
  | ScrollPaddingInlineEnd ScrollPadding
  | ScrollPaddingInlineStart ScrollPadding
  | ScrollPaddingLeft ScrollPadding
  | ScrollPaddingRight ScrollPadding
  | ScrollPaddingTop ScrollPadding
  -- TODO scroll-snap-align, scroll-snap-stop, scroll-snap-type
  | ScrollbarColor ScrollbarColor
  | ScrollbarWidth ScrollbarWidth
  | ShapeImageThreshold ShapeImageThreshold
  | ShapeMargin ShapeMargin
  | ShapeOutside ShapeOutside
  | StyleSyntax Text
  | TabSize TabSize
  | TableLayout TableLayout
  | TextAlign TextAlign
  | TextAlignLast TextAlignLast
  | TextCombineUpright TextCombineUpright
  | TextDecorationColor Color
  | TextDecorationLine TextDecorationLine
  | TextDecorationStyle TextDecorationStyle
  | TextDecorationThickness TextDecorationThickness
  | TextEmphasisColor Color
  | TextEmphasisPosition TextEmphasisPosition
  | TextEmphasisStyle TextEmphasisStyle
  | TextIndent TextIndent
  | TextJustify TextJustify
  | TextOrientation TextOrientation
  | TextOverflow TextOverflow
  | TextRendering TextRendering
  | TextShadow TextShadow
  | TextTransform TextTransform
  | TextUnderlineOffset TextUnderlineOffset
  | TextUnderlinePosition TextUnderlinePosition
  | Top' Offset
  | TouchAction TouchAction
  | Transform Transforms
  | TransformBox TransformBox
  | TransformOrigin Position
  | TransformStyle TransformStyle
  | TransitionDelay Durations
  | TransitionDuration Durations
  | TransitionProperty TransitionProperties
  | TransitionTimingFunction TransitionTimingFunctions
  | UnicodeBidi UnicodeBidi
  | UnicodeRange UnicodeRange
  | VerticalAlign VerticalAlign
  | Visibility Visibility
  | WhiteSpace WhiteSpace
  | Widows Widows
  | Width' Offset
  | WillChange WillChange
  | WordBreak WordBreak
  | WordSpacing WordSpacing
  | WritingMode WritingMode
  | ZIndex ZIndex
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
    Bottom' x -> "bottom: " <> toCSS x
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
    Left' x -> "left: " <> toCSS x
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
    MaskRepeat x -> "mask-repeat: " <> toCSS x
    MaskSize x -> "mask-size: " <> toCSS x
    MaskType x -> "mask-type: " <> toCSS x
    MaxBlockSize x -> "max-block-size: " <> toCSS x
    MaxHeight x -> "max-height: " <> toCSS x
    MaxWidth x -> "max-width: " <> toCSS x
    MinBlockSize x -> "min-block-size: " <> toCSS x
    MinHeight x -> "min-height: " <> toCSS x
    MinInlineSize x -> "min-inline-size: " <> toCSS x
    MinWidth x -> "min-width: " <> toCSS x
    MinZoom x -> "min-zoom: " <> toCSS x
    MixBlendMode x -> "mix-blend-mode: " <> toCSS x
    ObjectFit x -> "object-fit: " <> toCSS x
    ObjectPosition x -> "object-poisition: " <> toCSS x
    OffsetAnchor x -> "offset-anchor: " <> toCSS x
    OffsetDistance x -> "offset-distance: " <> toCSS x
    OffsetPath x -> "offset-path: " <> toCSS x
    OffsetPosition x -> "offset-position: " <> toCSS x
    OffsetRotate x -> "offset-rotate: " <> toCSS x
    Opacity x -> "opacity: " <> toCSS x
    Order x -> "order: " <> toCSS x
    Orientation x -> "orientation: " <> toCSS x
    Orphans x -> "orphans: " <> toCSS x
    OutlineColor x -> "outline-color: " <> toCSS x
    OutlineOffset x -> "outline-offset: " <> toCSS x
    OutlineStyleAuto -> "outline-style: auto"
    OutlineStyle x -> "outline-style: " <> toCSS x
    OutlineWidth x -> "outline-width: " <> toCSS x
    OverflowAnchor x -> "overflow-anchor: " <> toCSS x
    OverflowBlock x -> "overflow-block: " <> toCSS x
    OverflowInline x -> "overflow-inline: " <> toCSS x
    OverflowWrap x -> "overflow-wrap: " <> toCSS x
    OverflowX x -> "overflow-x: " <> toCSS x
    OverflowY x -> "overflow-y: " <> toCSS x
    Overflow x -> "overflow: " <> toCSS x
    OverscrollBehavior x -> "overscroll-behavior: " <> toCSS x
    OverscrollBehaviorBlock x -> "overscroll-behavior-block: " <> toCSS x
    OverscrollBehaviorInline x -> "overscroll-behavior-inline: " <> toCSS x
    OverscrollBehaviorX x -> "overscroll-behavior-x: " <> toCSS x
    OverscrollBehaviorY x -> "overscroll-behavior-y: " <> toCSS x
    Padding x -> "padding: " <> toCSS x
    PaddingBlockEnd x -> "padding-block-end: " <> toCSS x
    PaddingBlockStart x -> "padding-block-start: " <> toCSS x
    PaddingBlock x -> "padding-block: " <> toCSS x
    PaddingBottom x -> "padding-bottom: " <> toCSS x
    PaddingInlineEnd x -> "padding-inline-end: " <> toCSS x
    PaddingInlineStart x -> "padding-inline-start: " <> toCSS x
    PaddingInline x -> "padding-inline: " <> toCSS x
    PaddingLeft x -> "padding-left: " <> toCSS x
    PaddingRight x -> "padding-right: " <> toCSS x
    PaddingTop x -> "padding-top: " <> toCSS x
    PaintOrderNormal -> "paint-order: normal"
    PaintOrder x -> "paint-order: " <> intercalate " " (toCSS <$> x)
    Perspective x -> "perspective: " <> toCSS x
    PerspectiveOrigin x -> "perspective-origin: " <> toCSS x
    PlaceContent x -> "place-content: " <> toCSS x
    PointerEvents x -> "pointer-events: " <> toCSS x
    Position x -> "position: " <> toCSS x
    Quotes x -> "quotes: " <> toCSS x
    Resize x -> "resize: " <> toCSS x
    Right' x -> "right: " <> toCSS x
    Rotate x -> "rotate: " <> toCSS x
    RowGap x -> "row-gap: " <> toCSS x
    Scale x -> "scale: " <> toCSS x
    ScrollBehavior x -> "scroll-behavior: " <> toCSS x
    ScrollMarginBottom x -> "scroll-margin-bottom: " <> toCSS x
    ScrollMarginLeft x -> "scroll-margin-left: " <> toCSS x
    ScrollMarginRight x -> "scroll-margin-right: " <> toCSS x
    ScrollMarginTop x -> "scroll-margin-top: " <> toCSS x
    ScrollMargin x -> "scroll-margin: " <> toCSS x
    ScrollMarginBlockEnd x -> "scroll-margin-block-end: " <> toCSS x
    ScrollMarginBlockStart x -> "scroll-margin-block-start: " <> toCSS x
    ScrollMarginBlock x -> "scroll-margin-block: " <> toCSS x
    ScrollMarginInlineEnd x -> "scroll-margin-inline-end: " <> toCSS x
    ScrollMarginInlineStart x -> "scroll-margin-inline-start: " <> toCSS x
    ScrollMarginInline x -> "scroll-margin-inline: " <> toCSS x
    ScrollPadding x -> "scroll-padding: " <> toCSS x
    ScrollPaddingBlock x -> "scroll-padding-block: " <> toCSS x
    ScrollPaddingBlockEnd x -> "scroll-padding-block-end: " <> toCSS x
    ScrollPaddingBlockStart x -> "scroll-padding-block-start: " <> toCSS x
    ScrollPaddingBottom x -> "scroll-padding-bottom: " <> toCSS x
    ScrollPaddingInline x -> "scroll-padding-inline: " <> toCSS x
    ScrollPaddingInlineEnd x -> "scroll-padding-inline-end: " <> toCSS x
    ScrollPaddingInlineStart x -> "scroll-padding-inline-start: " <> toCSS x
    ScrollPaddingLeft x -> "scroll-padding-left: " <> toCSS x
    ScrollPaddingRight x -> "scroll-padding-right: " <> toCSS x
    ScrollPaddingTop x -> "scroll-padding-top: " <> toCSS x
    ScrollbarColor x -> "scrollbar-color: " <> toCSS x
    ScrollbarWidth x -> "scrollbar-width: " <> toCSS x
    ShapeImageThreshold x -> "shape-image-threshold: " <> toCSS x
    ShapeMargin x -> "shape-margin: " <> toCSS x
    ShapeOutside x -> "shape-outside: " <> toCSS x
    StyleSyntax x -> x
    TabSize x -> "tab-size: " <> toCSS x
    TableLayout x -> "table-layout: " <> toCSS x
    TextAlign x -> "text-align: " <> toCSS x
    TextCombineUpright x -> "text-combine-upright: " <> toCSS x
    TextDecorationColor x -> "text-decoration-color: " <> toCSS x
    TextDecorationThickness x -> "text-decoration-thickness: " <> toCSS x
    TextEmphasisColor x -> "text-emphasis-color: " <> toCSS x
    TextEmphasisPosition x -> "text-emphasis-position: " <> toCSS x
    TextEmphasisStyle x -> "text-emphasis-style: " <> toCSS x
    TextIndent x -> "text-indent: " <> toCSS x
    TextJustify x -> "text-justify: " <> toCSS x
    TextOrientation x -> "text-orientation: " <> toCSS x
    TextOverflow x -> "text-overflow: " <> toCSS x
    TextRendering x -> "text-rendering: " <> toCSS x
    TextShadow x -> "text-shadow: " <> toCSS x
    TextTransform x -> "text-transform: " <> toCSS x
    TextUnderlineOffset x -> "text-underline-offset: " <> toCSS x
    TextUnderlinePosition x -> "text-underline-position: " <> toCSS x
    Top' x -> "top: " <> toCSS x
    TouchAction x -> "touch-action: " <> toCSS x
    Transform x -> "transform: " <> toCSS x
    TransformBox x -> "transform-box: " <> toCSS x
    TransformOrigin x -> "transform-origin: " <> toCSS x
    TransformStyle x -> "transform-style: " <> toCSS x
    TransitionDelay x -> "transition-delay: " <> toCSS x
    TransitionDuration x -> "transition-duration: " <> toCSS x
    TransitionProperty x -> "transition-property: " <> toCSS x
    TransitionTimingFunction x -> "transition-timing-function: " <> toCSS x
    UnicodeBidi x -> "unicode-bidi: " <> toCSS x
    UnicodeRange x -> "unicode-range: " <> toCSS x
    VerticalAlign x -> "vertical-align: " <> toCSS x
    Visibility x -> "visibility: " <> toCSS x
    WhiteSpace x -> "white-space: " <> toCSS x
    Widows x -> "widows: " <> toCSS x
    Width' x -> "width: " <> toCSS x
    WillChange x -> "will-change: " <> toCSS x
    WordBreak x -> "word-break: " <> toCSS x
    WordSpacing x -> "word-spacing: " <> toCSS x
    WritingMode x -> "writing-mode: " <> toCSS x
    ZIndex x -> "z-index: " <> toCSS x


type Style = [StyleProperty]
