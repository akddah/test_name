import 'package:flutter/material.dart';

class CustomSliverGrid extends StatelessWidget {
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount, crossCount;
  final EdgeInsetsGeometry? itemPadding, padding;
  const CustomSliverGrid({super.key, required this.itemBuilder, required this.itemCount, required this.crossCount, this.itemPadding, this.padding});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: padding ?? EdgeInsets.zero,
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              crossCount,
              (i) => Expanded(
                child: (index * crossCount) + i >= itemCount
                    ? const SizedBox.shrink()
                    : Padding(padding: itemPadding ?? EdgeInsets.zero, child: itemBuilder(context, (index * crossCount) + i)),
              ),
            ),
          ),
          childCount: (itemCount / 2).ceilToDouble().toInt(),
        ),
      ),
    );
  }
}


class CustomGrid extends StatelessWidget {
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount, crossCount;
  final EdgeInsetsGeometry? itemPadding, padding;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  const CustomGrid({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    required this.crossCount,
    this.itemPadding,
    this.padding,
    this.shrinkWrap = false,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: padding ?? EdgeInsets.zero,
      itemCount: (itemCount / 2).ceilToDouble().toInt(),
      itemBuilder: (context, index) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          crossCount,
          (i) => Expanded(
            child: (index * crossCount) + i >= itemCount
                ? const SizedBox.shrink()
                : Padding(padding: itemPadding ?? EdgeInsets.zero, child: itemBuilder(context, (index * crossCount) + i)),
          ),
        ),
      ),
    );
  }
}