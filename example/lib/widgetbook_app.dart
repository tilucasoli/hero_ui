import 'package:flutter/material.dart';
import 'package:hero_ui/hero_ui.dart';
import 'package:mix/mix.dart';
import 'package:widgetbook/widgetbook.dart';

class HeroUiWidgetbookApp extends StatelessWidget {
  const HeroUiWidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HeroTheme(
      data: HeroThemeData.light(),
      child: Widgetbook.material(
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
                      final size = context.knobs.object
                          .dropdown<HeroButtonSize>(
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
                      return _preview(
                        HeroButton(
                          variant: variant,
                          size: size,
                          label: label,
                          iconLeft: iconLeft ? Icons.arrow_back : null,
                          iconRight: iconRight ? Icons.arrow_forward : null,
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
                name: 'HeroIconButton',
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
                      final size = context.knobs.object
                          .dropdown<HeroButtonSize>(
                            label: 'Size',
                            options: HeroButtonSize.values,
                            initialOption: .md,
                            labelBuilder: (value) => value.name,
                          );
                      final enabled = context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      );
                      final loading = context.knobs.boolean(
                        label: 'Loading',
                        initialValue: false,
                      );

                      return _preview(
                        HeroIconButton(
                          variant: variant,
                          size: size,
                          icon: Icons.favorite,
                          loading: loading,
                          enabled: enabled,
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
                      final size = context.knobs.object
                          .dropdown<HeroButtonSize>(
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

                      final childrenButton = <Widget>[
                        const HeroButton(label: 'Overview', onPressed: _noop),
                        if (withSeparator) const HeroButtonGroupSeparator(),
                        const HeroButton(label: 'Specs', onPressed: _noop),
                        if (withSeparator) const HeroButtonGroupSeparator(),
                        const HeroButton(label: 'Reviews', onPressed: _noop),
                      ];

                      final groupButton = HeroButtonGroup(
                        variant: variant,
                        size: size,
                        enabled: enabled,
                        fullWidth: fullWidth,
                        orientation: orientation,
                        children: childrenButton,
                      );

                      final childrenIconButton = <Widget>[
                        const HeroButton(label: 'Reviews', onPressed: _noop),
                        if (withSeparator) const HeroButtonGroupSeparator(),
                        const HeroIconButton(
                          icon: Icons.favorite,
                          onPressed: _noop,
                        ),
                      ];
                      final groupIconButton = HeroButtonGroup(
                        variant: variant,
                        size: size,
                        enabled: enabled,
                        fullWidth: fullWidth,
                        orientation: orientation,
                        children: childrenIconButton,
                      );

                      return _preview(
                        Column(
                          spacing: 16,
                          mainAxisSize: .min,
                          children: [groupButton, groupIconButton],
                        ),
                      );
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
                      final size = context.knobs.object
                          .dropdown<HeroSwitchSize>(
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
              WidgetbookComponent(
                name: 'HeroSlider',
                useCases: [
                  WidgetbookUseCase(
                    name: 'Playground',
                    builder: (context) {
                      final size = context.knobs.object
                          .dropdown<HeroSliderSize>(
                            label: 'Size',
                            options: HeroSliderSize.values,
                            initialOption: .md,
                            labelBuilder: (value) => value.name,
                          );
                      final enabled = context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      );
                      final initialValue = context.knobs.double.slider(
                        label: 'Initial value',
                        initialValue: 30,
                        min: 0,
                        max: 100,
                      );
                      final showOutput = context.knobs.boolean(
                        label: 'Show output',
                        initialValue: true,
                      );
                      final label = context.knobs.string(
                        label: 'Label',
                        initialValue: 'Volume',
                      );

                      return _preview(
                        SizedBox(
                          width: 320,
                          child: _InteractiveHeroSlider(
                            size: size,
                            enabled: enabled,
                            initiallyValue: initialValue,
                            label: label.isEmpty ? null : label,
                            showOutput: showOutput,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              WidgetbookComponent(
                name: 'HeroCheckbox',
                useCases: [
                  WidgetbookUseCase(
                    name: 'Playground',
                    builder: (context) {
                      final size = context.knobs.object
                          .dropdown<HeroCheckboxSize>(
                            label: 'Size',
                            options: HeroCheckboxSize.values,
                            initialOption: .md,
                            labelBuilder: (value) => value.name,
                          );
                      final enabled = context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      );
                      return _preview(
                        _InteractiveHeroCheckbox(size: size, enabled: enabled),
                      );
                    },
                  ),
                ],
              ),
              WidgetbookComponent(
                name: 'HeroRadioGroup',
                useCases: [
                  WidgetbookUseCase(
                    name: 'Playground',
                    builder: (context) {
                      final size = context.knobs.object.dropdown<HeroRadioSize>(
                        label: 'Size',
                        options: HeroRadioSize.values,
                        initialOption: .md,
                        labelBuilder: (value) => value.name,
                      );
                      final enabled = context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      );

                      return _preview(
                        _InteractiveHeroRadioGroup(
                          size: size,
                          enabled: enabled,
                        ),
                      );
                    },
                  ),
                ],
              ),
              WidgetbookComponent(
                name: 'HeroTextField',
                useCases: [
                  WidgetbookUseCase(
                    name: 'Playground',
                    builder: (context) {
                      final enabled = context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      );
                      final error = context.knobs.boolean(
                        label: 'Error',
                        initialValue: false,
                      );
                      final fullWidth = context.knobs.boolean(
                        label: 'Full width',
                        initialValue: false,
                      );
                      final label = context.knobs.string(
                        label: 'Label',
                        initialValue: 'Email',
                      );
                      final hintText = context.knobs.string(
                        label: 'Hint text',
                        initialValue: 'you@example.com',
                      );
                      final helperText = context.knobs.string(
                        label: 'Helper text',
                        initialValue: '',
                      );
                      final obscureText = context.knobs.boolean(
                        label: 'Obscure text',
                        initialValue: false,
                      );
                      final readOnly = context.knobs.boolean(
                        label: 'Read only',
                        initialValue: false,
                      );

                      final child = HeroTextField(
                        enabled: enabled,
                        error: error,
                        fullWidth: fullWidth,
                        label: label.isEmpty ? null : label,
                        hintText: hintText.isEmpty ? null : hintText,
                        helperText: helperText.isEmpty ? null : helperText,
                        obscureText: obscureText,
                        readOnly: readOnly,
                      );

                      if (fullWidth) {
                        return _preview(SizedBox(width: 320, child: child));
                      }

                      return _preview(SizedBox(width: 280, child: child));
                    },
                  ),
                ],
              ),
              WidgetbookComponent(
                name: 'HeroSelect',
                useCases: [
                  WidgetbookUseCase(
                    name: 'Playground',
                    builder: (context) {
                      final variant = context.knobs.object
                          .dropdown<HeroSelectVariant>(
                            label: 'Variant',
                            options: HeroSelectVariant.values,
                            initialOption: .primary,
                            labelBuilder: (value) => value.name,
                          );
                      final enabled = context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      );
                      final error = context.knobs.boolean(
                        label: 'Error',
                        initialValue: false,
                      );
                      final fullWidth = context.knobs.boolean(
                        label: 'Full width',
                        initialValue: false,
                      );
                      final placeholder = context.knobs.string(
                        label: 'Placeholder',
                        initialValue: 'Select a state',
                      );

                      final child = _InteractiveHeroSelect(
                        variant: variant,
                        enabled: enabled,
                        error: error,
                        placeholder: placeholder,
                      );

                      if (fullWidth) {
                        return _preview(SizedBox(width: 320, child: child));
                      }

                      return _preview(SizedBox(width: 256, child: child));
                    },
                  ),
                ],
              ),
              WidgetbookComponent(
                name: 'HeroCard',
                useCases: [
                  WidgetbookUseCase(
                    name: 'Playground',
                    builder: (context) {
                      final variant = context.knobs.object
                          .dropdown<HeroCardVariant>(
                            label: 'Variant',
                            options: HeroCardVariant.values,
                            initialOption: .defaultVariant,
                            labelBuilder: (value) => value.name,
                          );

                      return _preview(
                        SizedBox(
                          width: 340,
                          child: HeroCard(
                            variant: variant,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                HeroCardHeader(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 6,
                                    children: [
                                      HeroCardTitle('Card Title'),
                                      HeroCardDescription(
                                        'Card description goes here.',
                                      ),
                                    ],
                                  ),
                                ),
                                HeroCardContent(
                                  child: Text('Card content goes here.'),
                                ),
                                HeroCardFooter(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    spacing: 8,
                                    children: [
                                      HeroButton(
                                        variant: .ghost,
                                        size: .sm,
                                        label: 'Cancel',
                                        onPressed: _noop,
                                      ),
                                      HeroButton(
                                        size: .sm,
                                        label: 'Submit',
                                        onPressed: _noop,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              WidgetbookComponent(
                name: 'HeroLinkButton',
                useCases: [
                  WidgetbookUseCase(
                    name: 'Playground',
                    builder: (context) {
                      final size = context.knobs.object
                          .dropdown<HeroLinkButtonSize>(
                            label: 'Size',
                            options: HeroLinkButtonSize.values,
                            initialOption: .md,
                            labelBuilder: (value) => value.name,
                          );
                      final label = context.knobs.string(
                        label: 'Label',
                        initialValue: 'Learn more',
                      );
                      final enabled = context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      );
                      final iconLeft = context.knobs.boolean(
                        label: 'Leading icon',
                        initialValue: false,
                      );
                      final iconRight = context.knobs.boolean(
                        label: 'Trailing icon',
                        initialValue: false,
                      );

                      return _preview(
                        HeroLinkButton(
                          label: label,
                          size: size,
                          enabled: enabled,
                          iconLeft: iconLeft ? Icons.arrow_back : null,
                          iconRight: iconRight
                              ? Icons.arrow_outward_rounded
                              : null,
                          onPressed: _noop,
                        ),
                      );
                    },
                  ),
                ],
              ),
              WidgetbookComponent(
                name: 'HeroSidebar',
                useCases: [
                  WidgetbookUseCase(
                    name: 'Playground',
                    builder: (context) {
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 500,
                          child: HeroSidebar(
                            header: StyledText(
                              'My App',
                              style: TextStyler()
                                  .style($labelLarge.mix())
                                  .color($surfaceForeground()),
                            ),
                            footer: StyledText(
                              'v1.0.0',
                              style: TextStyler()
                                  .style($paragraphSmall.mix())
                                  .color($muted()),
                            ),
                            children: [
                              HeroSidebarSection(
                                title: 'Navigation',
                                children: [
                                  HeroSidebarItem(
                                    label: 'Home',
                                    icon: Icons.home_outlined,
                                    selected: true,
                                    onPressed: _noop,
                                  ),
                                  HeroSidebarItem(
                                    label: 'Search',
                                    icon: Icons.search,
                                    onPressed: _noop,
                                  ),
                                  HeroSidebarItem(
                                    label: 'Notifications',
                                    icon: Icons.notifications_outlined,
                                    onPressed: _noop,
                                  ),
                                ],
                              ),
                              HeroSidebarSection(
                                title: 'Account',
                                children: [
                                  HeroSidebarItem(
                                    label: 'Profile',
                                    icon: Icons.person_outline,
                                    onPressed: _noop,
                                  ),
                                  HeroSidebarItem(
                                    label: 'Settings',
                                    icon: Icons.settings_outlined,
                                    onPressed: _noop,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          WidgetbookCategory(
            name: 'Blocks',
            children: [
              WidgetbookComponent(
                name: 'AuthBlock',
                useCases: [
                  WidgetbookUseCase(
                    name: 'Playground',
                    builder: (context) {
                      return const AuthBlock();
                    },
                  ),
                ],
              ),
              WidgetbookComponent(
                name: 'DashboardBlock',
                useCases: [
                  WidgetbookUseCase(
                    name: 'Playground',
                    builder: (context) {
                      return Scaffold(
                        body: SizedBox.expand(
                          child: _InteractiveDashboardBlock(),
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
            builder: (context, child) {
              final brightness = Theme.of(context).brightness;
              final data = brightness == Brightness.dark
                  ? HeroThemeData.dark()
                  : HeroThemeData.light();
              return HeroTheme(data: data, child: child);
            },
          ),
        ],
      ),
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

class _InteractiveHeroSlider extends StatefulWidget {
  final HeroSliderSize size;
  final bool enabled;
  final double initiallyValue;
  final String? label;
  final bool showOutput;

  const _InteractiveHeroSlider({
    required this.size,
    required this.enabled,
    required this.initiallyValue,
    required this.label,
    required this.showOutput,
  });

  @override
  State<_InteractiveHeroSlider> createState() => _InteractiveHeroSliderState();
}

class _InteractiveHeroSliderState extends State<_InteractiveHeroSlider> {
  late double value = widget.initiallyValue;

  @override
  void didUpdateWidget(covariant _InteractiveHeroSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initiallyValue != widget.initiallyValue) {
      value = widget.initiallyValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return HeroSlider(
      value: value,
      onChanged: widget.enabled
          ? (nextValue) {
              setState(() {
                value = nextValue;
              });
            }
          : (_) {},
      enabled: widget.enabled,
      size: widget.size,
      label: widget.label,
      showOutput: widget.showOutput,
    );
  }
}

class _InteractiveHeroSelect extends StatefulWidget {
  final HeroSelectVariant variant;
  final bool enabled;
  final bool error;
  final String placeholder;

  const _InteractiveHeroSelect({
    required this.variant,
    required this.enabled,
    required this.error,
    required this.placeholder,
  });

  @override
  State<_InteractiveHeroSelect> createState() => _InteractiveHeroSelectState();
}

class _InteractiveHeroSelectState extends State<_InteractiveHeroSelect> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return HeroSelect<String>(
      variant: widget.variant,
      enabled: widget.enabled,
      error: widget.error,
      placeholder: widget.placeholder,
      selectedValue: selectedValue,
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
      },
      items: const [
        HeroSelectItem(value: 'california', label: 'California'),
        HeroSelectItem(value: 'texas', label: 'Texas'),
        HeroSelectItem(value: 'florida', label: 'Florida'),
        HeroSelectItem(value: 'new-york', label: 'New York'),
        HeroSelectItem(value: 'washington', label: 'Washington'),
        HeroSelectItem(value: 'illinois', label: 'Illinois'),
      ],
    );
  }
}

class _InteractiveHeroCheckbox extends StatefulWidget {
  final HeroCheckboxSize size;
  final bool enabled;

  const _InteractiveHeroCheckbox({required this.size, required this.enabled});

  @override
  State<_InteractiveHeroCheckbox> createState() =>
      _InteractiveHeroCheckboxState();
}

class _InteractiveHeroCheckboxState extends State<_InteractiveHeroCheckbox> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return HeroCheckbox(
      selected: selected,
      onChanged: widget.enabled
          ? (value) {
              setState(() {
                selected = value ?? false;
              });
            }
          : null,
      enabled: widget.enabled,
      size: widget.size,
    );
  }
}

class _InteractiveHeroRadioGroup extends StatefulWidget {
  final HeroRadioSize size;
  final bool enabled;

  const _InteractiveHeroRadioGroup({required this.size, required this.enabled});

  @override
  State<_InteractiveHeroRadioGroup> createState() =>
      _InteractiveHeroRadioGroupState();
}

class _InteractiveHeroRadioGroupState
    extends State<_InteractiveHeroRadioGroup> {
  String? selected = 'option1';

  @override
  Widget build(BuildContext context) {
    return HeroRadioGroup<String>(
      groupValue: selected,
      onChanged: widget.enabled
          ? (value) {
              setState(() {
                selected = value;
              });
            }
          : (_) {},

      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          HeroRadio<String>(
            value: 'option1',
            size: widget.size,
            enabled: widget.enabled,
          ),
          HeroRadio<String>(
            value: 'option2',
            size: widget.size,
            enabled: widget.enabled,
          ),
          HeroRadio<String>(
            value: 'option3',
            size: widget.size,
            enabled: widget.enabled,
          ),
        ],
      ),
    );
  }
}

class _InteractiveDashboardBlock extends StatefulWidget {
  const _InteractiveDashboardBlock();

  @override
  State<_InteractiveDashboardBlock> createState() =>
      _InteractiveDashboardBlockState();
}

class _InteractiveDashboardBlockState
    extends State<_InteractiveDashboardBlock> {
  String selectedItem = 'overview';

  @override
  Widget build(BuildContext context) {
    return DashboardBlock(
      header: ColumnBox(
        style: FlexBoxStyler().spacing(16).padding(.horizontal(4)),
        children: [
          Box(
            style: BoxStyler()
                .size(32, 32)
                .margin(.horizontal(4))
                .color($success())
                .shapeSuperellipse(borderRadius: .all(.circular(10)))
                .wrap(.align(alignment: .centerLeft)),
          ),
          HeroTextField(
            hintText: 'Search',
            leading: StyledIcon(
              icon: Icons.search,
              style: IconStyler()
                  .size(20)
                  .color($fieldPlaceholder.resolve(context)),
            ),
            style: .new()
                .hintColor($fieldPlaceholder())
                .color($fieldForeground())
                .hintColor($fieldPlaceholder())
                .backgroundColor($fieldBackground())
                .borderAll(color: $fieldBorder(), width: 1)
                .onFocused(
                  .new()
                      .backgroundColor($background())
                      .borderAll(color: $accent()),
                ),
          ),
        ],
      ),
      footer: Builder(
        builder: (context) {
          return Column(
            spacing: 12,
            children: [
              HeroSidebarItem(
                label: 'Settings',
                icon: Icons.settings_outlined,
                // isSelected: selectedItem == 'overview',
                onPressed: () => showDialog(
                  context: context,
                  useRootNavigator: false,
                  builder: (context) => Center(
                    child: HeroCard(
                      child: FractionallySizedBox(
                        widthFactor: 0.6,
                        heightFactor: 0.7,
                        child: DashboardBlock(
                          sidebarChildren: [
                            HeroSidebarSection(
                              title: 'Workspace',
                              children: [
                                HeroSidebarItem(
                                  label: 'Account',
                                  icon: Icons.person_outline,
                                  onPressed: () => Navigator.pop(context),
                                ),
                                HeroSidebarItem(
                                  label: 'Preferences',
                                  icon: Icons.settings_outlined,
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const HeroDivider(),
              Row(
                spacing: 8,
                children: [
                  Box(
                    style: BoxStyler()
                        .color($default.resolve(context))
                        .borderAll(color: $border.resolve(context), width: 1)
                        .borderRounded(40)
                        .size(40, 40)
                        .alignment(.center),
                    child: StyledText(
                      'JB',
                      style: TextStyler()
                          .style($labelLarge.mix())
                          .color($defaultForeground.resolve(context))
                          .height(1.0),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StyledText(
                        'James Brown',
                        style: TextStyler()
                            .style($labelSmall.mix())
                            .color($surfaceForeground()),
                      ),
                      StyledText(
                        'james.brown@example.com',
                        style: TextStyler()
                            .style($paragraphXSmall.mix())
                            .color($muted()),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
      sidebarChildren: [
        HeroSidebarSection(
          title: 'Main',
          children: [
            HeroSidebarItem(
              label: 'Overview',
              icon: Icons.dashboard_outlined,
              selected: selectedItem == 'overview',
              onPressed: () => setState(() => selectedItem = 'overview'),
            ),
            HeroSidebarItem(
              label: 'Analytics',
              icon: Icons.bar_chart_outlined,
              selected: selectedItem == 'analytics',
              onPressed: () => setState(() => selectedItem = 'analytics'),
            ),
            HeroSidebarItem(
              label: 'Reports',
              icon: Icons.description_outlined,
              selected: selectedItem == 'reports',
              onPressed: () => setState(() => selectedItem = 'reports'),
            ),
          ],
        ),
        HeroSidebarSection(
          title: 'Settings',
          children: [
            HeroSidebarItem(
              label: 'Account',
              icon: Icons.person_outline,
              selected: selectedItem == 'account',
              onPressed: () => setState(() => selectedItem = 'account'),
            ),
          ],
        ),
      ],
      child: Center(
        child: StyledText(
          selectedItem[0].toUpperCase() + selectedItem.substring(1),
          style: TextStyler().style($titleH4.mix()).color($muted()),
        ),
      ),
    );
  }
}

void _noop() {}
