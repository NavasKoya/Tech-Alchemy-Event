import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_alchemy/constants/const_colors.dart';
import 'package:tech_alchemy/constants/const_icons.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseColor,
      body: _logoLayout(),
      bottomNavigationBar: _bottomLayout(context),
    );
  }

  _logoLayout() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.white,
        ),
        padding: const EdgeInsets.all(15),
        // child: SvgPicture.asset(AppIcons.logoIcon,),
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }

  _bottomLayout(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              AppIcons.refreshIcon,
              color: AppColors.white.withOpacity(.6),
            ),
            Text(
              "© 2020 Are you in App. All rights reserved",
              style: TextStyle(
                color: AppColors.white.withOpacity(.6),
              ),
            )
          ],
        ),
      ),
    );
  }
}
