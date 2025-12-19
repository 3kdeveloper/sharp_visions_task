import '../constants/exports.dart';

extension SkeletonExtension on Widget {
  GestureDetector onTap(VoidCallback? onTap, {Key? key}) =>
      GestureDetector(key: key, onTap: onTap, child: this);
}
