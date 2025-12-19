import 'package:flutter/cupertino.dart';

import '../../core/constants/exports.dart';

class CupertinoActivityIndicatorWidget extends StatelessWidget {
  const CupertinoActivityIndicatorWidget({super.key, this.color, this.radius});

  final Color? color;
  final double? radius;

  @override
  Widget build(BuildContext context) => CupertinoActivityIndicator(
    color: color ?? AppColors.primaryColor,
    radius: radius ?? 12,
  );
}
