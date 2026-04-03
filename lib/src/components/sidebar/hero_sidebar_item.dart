import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../../tokens/hero_tokens.dart';
import 'hero_sidebar_style.dart';

final class HeroSidebarItem extends StatefulWidget {
  final String label;
  final IconData? icon;
  final Widget? trailing;
  final bool isSelected;
  final VoidCallback? onPressed;

  const HeroSidebarItem({
    super.key,
    required this.label,
    this.icon,
    this.trailing,
    this.isSelected = false,
    this.onPressed,
  });

  @override
  State<HeroSidebarItem> createState() => _HeroSidebarItemState();
}

class _HeroSidebarItemState extends State<HeroSidebarItem> {
  final _controller = WidgetStatesController();

  @override
  void initState() {
    super.initState();
    _controller.update(WidgetState.selected, widget.isSelected);
  }

  @override
  void didUpdateWidget(covariant HeroSidebarItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isSelected != widget.isSelected) {
      _controller.update(WidgetState.selected, widget.isSelected);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final labelStyle = heroSidebarItemLabelStyle
        .color($surfaceForeground())
        .variant(
          ContextVariant.widgetState(.selected),
          .color($accentSoftForeground()),
        );

    final iconStyle = heroSidebarItemIconStyle
        .color($surfaceForeground())
        .variant(
          ContextVariant.widgetState(.selected),
          .color($accentSoftForeground()),
        );

    return Pressable(
      onPress: widget.onPressed,
      controller: _controller,
      child: Box(
        style: heroSidebarItemStyle,
        child: Row(
          spacing: 10,
          children: [
            if (widget.icon != null)
              StyledIcon(
                icon: widget.icon!,
                style: iconStyle,
              ),
            Expanded(
              child: StyledText(
                widget.label,
                style: labelStyle,
              ),
            ),
            ?widget.trailing,
          ],
        ),
      ),
    );
  }
}
