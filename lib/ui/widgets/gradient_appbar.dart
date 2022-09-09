import 'package:flutter/material.dart';
import 'package:icab/configs/constants.dart';
import 'package:icab/configs/theme.dart';

class GradientAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget? leading;
  final String title;
  final List<Widget>? actions;

  GradientAppBar({
    Key? key,
    this.leading,
    required this.title,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            AppColors.textFaded,
          ],
          begin: FractionalOffset(0.0, 1.0),
          end: FractionalOffset(0.0, 0.0),
          stops: [0.0, 4.0],
          // tileMode: TileMode.clamp,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leading ?? const SizedBox.shrink(),
            Text(title),
            if (actions != null)
              ...actions!
            else ...[
              const SizedBox.shrink(),
            ],
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
