import 'package:flutter/material.dart';
import 'package:hero_ui/hero_ui.dart';
import 'package:mix_atlas/mix_atlas.dart';

final heroAtlasCatalog = AtlasCatalog(
  id: 'hero-ui',
  label: 'Hero UI',
  themes: [
    AtlasTheme(
      'light',
      label: 'Light',
      background: HeroThemeData.light().background,
      builder: (_, child) => HeroTheme(
        data: HeroThemeData.light().copyWith(fontFamily: 'Roboto'),
        child: child,
      ),
    ),
    AtlasTheme(
      'dark',
      label: 'Dark',
      brightness: Brightness.dark,
      background: HeroThemeData.dark().background,
      builder: (_, child) => HeroTheme(
        data: HeroThemeData.dark().copyWith(fontFamily: 'Roboto'),
        child: child,
      ),
    ),
  ],
  atlases: [_buttonAtlas],
);

final _buttonAtlas = ComponentAtlas(
  id: 'button',
  label: 'Hero Button',
  rowAxes: const [AtlasAxis('variant', 'Variant'), AtlasAxis('size', 'Size')],
  scenarios: const [
    ...AtlasScenarios.interactive,
    AtlasScenario('loading', label: 'Loading', props: {'loading': true}),
  ],
  rows: [
    for (final variant in HeroButtonVariant.values)
      for (final size in HeroButtonSize.values) _buttonRow(variant, size),
  ],
);

AtlasRow _buttonRow(HeroButtonVariant variant, HeroButtonSize size) {
  return AtlasRow(
    '${variant.name}-${size.name}',
    (context, cell) => HeroButton(
      variant: variant,
      size: size,
      label: 'Button',
      leadingIcon: Icons.add,
      enabled: !cell.disabled,
      loading: cell.propOr('loading', false),
      onPressed: () {},
    ),
    values: {
      'variant': AtlasAxisValue(variant.name, _title(variant.name)),
      'size': AtlasAxisValue(size.name, size.name.toUpperCase()),
    },
  );
}

String _title(String value) {
  final words = value.replaceAllMapped(
    RegExp(r'([a-z])([A-Z])'),
    (match) => '${match[1]} ${match[2]}',
  );

  return '${words[0].toUpperCase()}${words.substring(1)}';
}
