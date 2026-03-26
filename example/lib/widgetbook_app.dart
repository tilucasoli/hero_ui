import 'package:flutter/material.dart';
import 'package:hero_ui/hero_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class HeroUiWidgetbookApp extends StatelessWidget {
  const HeroUiWidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: [
        WidgetbookCategory(
          name: 'Components',
          children: [
            WidgetbookComponent(
              name: 'HeroButton',
              useCases: [
                WidgetbookUseCase(
                  name: 'Playground',
                  builder: (context) {
                    final variant = context.knobs.object
                        .dropdown<HeroButtonVariant>(
                          label: 'Variant',
                          options: HeroButtonVariant.values,
                          initialOption: .primary,
                          labelBuilder: (value) => value.name,
                        );
                    final size = context.knobs.object.dropdown<HeroButtonSize>(
                      label: 'Size',
                      options: HeroButtonSize.values,
                      initialOption: .md,
                      labelBuilder: (value) => value.name,
                    );
                    final label = context.knobs.string(
                      label: 'Label',
                      initialValue: 'Continue',
                    );
                    final enabled = context.knobs.boolean(
                      label: 'Enabled',
                      initialValue: true,
                    );
                    final loading = context.knobs.boolean(
                      label: 'Loading',
                      initialValue: false,
                    );
                    final iconLeft = context.knobs.boolean(
                      label: 'Leading icon',
                      initialValue: false,
                    );
                    final iconRight = context.knobs.boolean(
                      label: 'Trailing icon',
                      initialValue: false,
                    );
                    final fullWidth = context.knobs.boolean(
                      label: 'Full width',
                      initialValue: false,
                    );
                    final iconOnly = context.knobs.boolean(
                      label: 'Icon only',
                      initialValue: false,
                    );

                    return _preview(
                      HeroButton(
                        variant: variant,
                        size: size,
                        label: iconOnly ? null : label,
                        iconLeft: iconLeft ? Icons.arrow_back : null,
                        iconRight: iconRight ? Icons.arrow_forward : null,
                        iconOnly: iconOnly,
                        loading: loading,
                        enabled: enabled,
                        fullWidth: fullWidth,
                        onPressed: () {},
                      ),
                    );
                  },
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'HeroButtonGroup',
              useCases: [
                WidgetbookUseCase(
                  name: 'Playground',
                  builder: (context) {
                    final variant = context.knobs.object
                        .dropdown<HeroButtonVariant>(
                          label: 'Variant',
                          options: HeroButtonVariant.values,
                          initialOption: .primary,
                          labelBuilder: (value) => value.name,
                        );
                    final size = context.knobs.object.dropdown<HeroButtonSize>(
                      label: 'Size',
                      options: HeroButtonSize.values,
                      initialOption: .md,
                      labelBuilder: (value) => value.name,
                    );
                    final enabled = context.knobs.boolean(
                      label: 'Enabled',
                      initialValue: true,
                    );
                    final fullWidth = context.knobs.boolean(
                      label: 'Full width',
                      initialValue: false,
                    );
                    final withSeparator = context.knobs.boolean(
                      label: 'Show separators',
                      initialValue: true,
                    );
                    final orientation = context.knobs.object.dropdown<Axis>(
                      label: 'Orientation',
                      options: Axis.values,
                      initialOption: Axis.horizontal,
                      labelBuilder: (value) => value.name,
                    );

                    final children = <Widget>[
                      const HeroButton(label: 'Overview', onPressed: _noop),
                      if (withSeparator) const HeroButtonGroupSeparator(),
                      const HeroButton(label: 'Specs', onPressed: _noop),
                      if (withSeparator) const HeroButtonGroupSeparator(),
                      const HeroButton(label: 'Reviews', onPressed: _noop),
                    ];

                    final group = HeroButtonGroup(
                      variant: variant,
                      size: size,
                      enabled: enabled,
                      fullWidth: fullWidth,
                      orientation: orientation,
                      children: children,
                    );

                    if (fullWidth) {
                      return _preview(SizedBox(width: 420, child: group));
                    }

                    return _preview(group);
                  },
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'HeroSwitch',
              useCases: [
                WidgetbookUseCase(
                  name: 'Playground',
                  builder: (context) {
                    final size = context.knobs.object.dropdown<HeroSwitchSize>(
                      label: 'Size',
                      options: HeroSwitchSize.values,
                      initialOption: .md,
                      labelBuilder: (value) => value.name,
                    );
                    final enabled = context.knobs.boolean(
                      label: 'Enabled',
                      initialValue: true,
                    );
                    final selected = context.knobs.boolean(
                      label: 'Initially selected',
                      initialValue: false,
                    );

                    return _preview(
                      _InteractiveHeroSwitch(
                        initiallySelected: selected,
                        size: size,
                        enabled: enabled,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Light', data: ThemeData.light()),
            WidgetbookTheme(name: 'Dark', data: ThemeData.dark()),
          ],
        ),
        ViewportAddon(Viewports.all),
        TextScaleAddon(),
        BuilderAddon(
          name: 'Hero Theme',
          builder: (_, child) {
            return HeroTheme.fromSeeds(
              accent: Colors.blueAccent,
              danger: Colors.redAccent,
              child: child,
            );
          },
        ),
      ],
    );
  }
}

Widget _preview(Widget child) {
  return Center(
    child: Padding(padding: const EdgeInsets.all(24), child: child),
  );
}

class _InteractiveHeroSwitch extends StatefulWidget {
  final bool initiallySelected;
  final HeroSwitchSize size;
  final bool enabled;

  const _InteractiveHeroSwitch({
    required this.initiallySelected,
    required this.size,
    required this.enabled,
  });

  @override
  State<_InteractiveHeroSwitch> createState() => _InteractiveHeroSwitchState();
}

class _InteractiveHeroSwitchState extends State<_InteractiveHeroSwitch> {
  late bool selected = widget.initiallySelected;

  @override
  void didUpdateWidget(covariant _InteractiveHeroSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initiallySelected != widget.initiallySelected) {
      selected = widget.initiallySelected;
    }
  }

  @override
  Widget build(BuildContext context) {
    return HeroSwitch(
      selected: selected,
      onChanged: widget.enabled
          ? (value) {
              setState(() {
                selected = value;
              });
            }
          : (_) {},
      enabled: widget.enabled,
      size: widget.size,
    );
  }
}

void _noop() {}
