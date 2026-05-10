import 'package:mix/mix.dart';

// == Primitive Colors (do not change between light and dark) ==
const $white = ColorToken('hero.white');
const $black = ColorToken('hero.black');
const $snow = ColorToken('hero.snow');
const $eclipse = ColorToken('hero.eclipse');

// == Base Colors ==
const $background = ColorToken('hero.background');
const $foreground = ColorToken('hero.foreground');

// == Background Extended ==
const $backgroundSecondary = ColorToken('hero.backgroundSecondary');
const $backgroundTertiary = ColorToken('hero.backgroundTertiary');
const $backgroundInverse = ColorToken('hero.backgroundInverse');

// == Surface (cards, accordions, disclosure groups) ==
const $surface = ColorToken('hero.surface');
const $surfaceForeground = ColorToken('hero.surfaceForeground');
const $surfaceSecondary = ColorToken('hero.surfaceSecondary');
const $surfaceSecondaryForeground =
    ColorToken('hero.surfaceSecondaryForeground');
const $surfaceTertiary = ColorToken('hero.surfaceTertiary');
const $surfaceTertiaryForeground =
    ColorToken('hero.surfaceTertiaryForeground');

// == Overlay (tooltips, popovers, modals, menus) ==
const $overlay = ColorToken('hero.overlay');
const $overlayForeground = ColorToken('hero.overlayForeground');

// == Muted ==
const $muted = ColorToken('hero.muted');
const $scrollbar = ColorToken('hero.scrollbar');

// == Default ==
const $default = ColorToken('hero.default');
const $defaultForeground = ColorToken('hero.defaultForeground');

// == Accent ==
const $accent = ColorToken('hero.accent');
const $accentForeground = ColorToken('hero.accentForeground');

// == Field (form field defaults) ==
const $fieldBackground = ColorToken('hero.fieldBackground');
const $fieldForeground = ColorToken('hero.fieldForeground');
const $fieldPlaceholder = ColorToken('hero.fieldPlaceholder');
const $fieldBorder = ColorToken('hero.fieldBorder');

// == Success ==
const $success = ColorToken('hero.success');
const $successForeground = ColorToken('hero.successForeground');

// == Warning ==
const $warning = ColorToken('hero.warning');
const $warningForeground = ColorToken('hero.warningForeground');

// == Danger ==
const $danger = ColorToken('hero.danger');
const $dangerForeground = ColorToken('hero.dangerForeground');

// == Segment ==
const $segment = ColorToken('hero.segment');
const $segmentForeground = ColorToken('hero.segmentForeground');

// == Misc ==
const $border = ColorToken('hero.border');
const $separator = ColorToken('hero.separator');
const $focus = ColorToken('hero.focus');
const $link = ColorToken('hero.link');
const $backdrop = ColorToken('hero.backdrop');

// == Derived Colors (interaction states) ==
const $accentHover = ColorToken('hero.accentHover');
const $defaultHover = ColorToken('hero.defaultHover');
const $surfaceHover = ColorToken('hero.surfaceHover');

const $accentSoft = ColorToken('hero.accentSoft');
const $accentSoftForeground = ColorToken('hero.accentSoftForeground');
const $accentSoftHover = ColorToken('hero.accentSoftHover');

const $dangerHover = ColorToken('hero.dangerHover');
const $dangerSoft = ColorToken('hero.dangerSoft');
const $dangerSoftHover = ColorToken('hero.dangerSoftHover');
const $dangerSoftForeground = ColorToken('hero.dangerSoftForeground');

const $successHover = ColorToken('hero.successHover');
const $successSoft = ColorToken('hero.successSoft');
const $successSoftForeground = ColorToken('hero.successSoftForeground');
const $successSoftHover = ColorToken('hero.successSoftHover');

const $warningHover = ColorToken('hero.warningHover');
const $warningSoft = ColorToken('hero.warningSoft');
const $warningSoftForeground = ColorToken('hero.warningSoftForeground');
const $warningSoftHover = ColorToken('hero.warningSoftHover');

// == Border Extended ==
const $borderSecondary = ColorToken('hero.borderSecondary');
const $borderTertiary = ColorToken('hero.borderTertiary');

// == Separator Extended ==
const $separatorSecondary = ColorToken('hero.separatorSecondary');
const $separatorTertiary = ColorToken('hero.separatorTertiary');

// == Field Extended (interaction states) ==
const $fieldHover = ColorToken('hero.fieldHover');
const $fieldFocus = ColorToken('hero.fieldFocus');
const $fieldBorderHover = ColorToken('hero.fieldBorderHover');
const $fieldBorderFocus = ColorToken('hero.fieldBorderFocus');

// == Common Values ==
const $disabledOpacity = DoubleToken('hero.disabledOpacity');
const $borderWidth = DoubleToken('hero.borderWidth');
const $ringOffsetWidth = DoubleToken('hero.ringOffsetWidth');

// == Spacing ==
const $spacing = SpaceToken('hero.spacing');

// == Radius ==
const $radius = RadiusToken('hero.radius');
const $fieldRadius = RadiusToken('hero.fieldRadius');

// == Text Styles: Title ==
const $titleH1 = TextStyleToken('hero.title.h1');
const $titleH2 = TextStyleToken('hero.title.h2');
const $titleH3 = TextStyleToken('hero.title.h3');
const $titleH4 = TextStyleToken('hero.title.h4');
const $titleH5 = TextStyleToken('hero.title.h5');
const $titleH6 = TextStyleToken('hero.title.h6');

// == Text Styles: Label ==
const $labelXLarge = TextStyleToken('hero.label.xlarge');
const $labelLarge = TextStyleToken('hero.label.large');
const $labelMedium = TextStyleToken('hero.label.medium');
const $labelSmall = TextStyleToken('hero.label.small');
const $labelXSmall = TextStyleToken('hero.label.xsmall');

// == Text Styles: Paragraph ==
const $paragraphXLarge = TextStyleToken('hero.paragraph.xlarge');
const $paragraphLarge = TextStyleToken('hero.paragraph.large');
const $paragraphMedium = TextStyleToken('hero.paragraph.medium');
const $paragraphSmall = TextStyleToken('hero.paragraph.small');
const $paragraphXSmall = TextStyleToken('hero.paragraph.xsmall');

// == Text Styles: Subheading ==
const $subheadingMedium = TextStyleToken('hero.subheading.medium');
const $subheadingSmall = TextStyleToken('hero.subheading.small');
const $subheadingXSmall = TextStyleToken('hero.subheading.xsmall');
const $subheading2XSmall = TextStyleToken('hero.subheading.2xsmall');

// == Text Styles: Doc ==
const $docLabel = TextStyleToken('hero.doc.label');
const $docParagraph = TextStyleToken('hero.doc.paragraph');
