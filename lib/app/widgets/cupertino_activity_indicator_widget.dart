import 'package:flutter/cupertino.dart';

class CupertinoActivityIndicatorWidget extends StatelessWidget {
  const CupertinoActivityIndicatorWidget({super.key, this.color, this.radius});

  final Color? color;
  final double? radius;

  @override
  Widget build(BuildContext context) =>
      CupertinoActivityIndicator(color: color, radius: radius ?? 12);
}
