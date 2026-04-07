import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';

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
    final labelStyle = TextStyler()
        .style($labelSmall.mix())
        .color($foreground());

    final iconStyle = IconStyler()
        .size(18)
        .color($muted())
        .variant(
          ContextVariant.widgetState(.selected),
          .color($accentSoftForeground()),
        );

    final heroSidebarItemStyle = FlexBoxStyler()
        .borderRounded(8)
        .paddingX(12)
        .paddingY(8)
        .color($background())
        .spacing(10)
        .marginY(1)
        .scale(1)
        .onHovered(.color($default()))
        .variant(ContextVariant.widgetState(.selected), .color($default()))
        .onPressed(.scale(0.98))
        .animate(.ease(150.ms));

    return Pressable(
      onPress: widget.onPressed,
      controller: _controller,
      child: RowBox(
        style: heroSidebarItemStyle,
        children: [
          if (widget.icon != null)
            StyledIcon(icon: widget.icon!, style: iconStyle),
          Expanded(child: StyledText(widget.label, style: labelStyle)),
          ?widget.trailing,
        ],
      ),
    );
  }
}
