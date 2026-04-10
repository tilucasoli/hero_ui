import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/remix.dart';

import '../../tokens/hero_tokens.dart';

part 'hero_sidebar_item_style.dart';

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
    return Pressable(
      onPress: widget.onPressed,
      controller: _controller,
      child: RowBox(
        style: HeroSidebarItemStyle._baseStyle(),
        children: [
          if (widget.icon != null)
            StyledIcon(icon: widget.icon!, style: HeroSidebarItemStyle._iconStyle()),
          Expanded(child: StyledText(widget.label, style: HeroSidebarItemStyle._labelStyle())),
          ?widget.trailing,
        ],
      ),
    );
  }
}
