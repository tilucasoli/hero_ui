part of 'hero_sidebar.dart';

final class HeroSidebarStyle {
  HeroSidebarStyle._();

  static FlexBoxStyler _baseStyle() {
    return FlexBoxStyler()
        .crossAxisAlignment(.stretch)
        .color($background())
        .width(260)
        .padding(.horizontal(12).vertical(16));
  }

  static TextStyler _sectionTitleStyle() {
    return TextStyler()
        .style($subheadingXSmall.mix())
        .color($muted())
        .wrap(.padding(.fromLTRB(12, 16, 12, 8)));
  }
}
