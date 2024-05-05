import 'package:crafty_bay/presentations/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AssetsPath.appLogoSVG,width: 100,);
  }
}
