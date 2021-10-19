import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_alchemy/constants/const_colors.dart';
import 'package:tech_alchemy/constants/const_icons.dart';
import 'package:tech_alchemy/pages/sub_pages/event_list/event_list_page.dart';
import 'package:tech_alchemy/widget/bottom_bar_widget/bottom_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: _appBarLayout(),
      body: _viewSelectedPageWidget(),
      bottomNavigationBar: _bottomWidget(),
    );
  }

  _appBarLayout() {
    final Size _pageSize = MediaQuery.of(context).size;
    return PreferredSize(
      child: AppBar(
        backgroundColor: AppColors.baseColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(
              _pageSize.width * .1,
              _pageSize.width * .1,
            ),
          ),
        ),
        shadowColor: AppColors.black,
        flexibleSpace: SafeArea(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: _pageSize.width * .05,
              ),
              child: Text(
                "Welcome",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                  letterSpacing: 1.5,
                  fontSize: _pageSize.width * .055,
                ),
              ),
            ),
          ),
        ),
      ),
      preferredSize: Size.fromHeight(_pageSize.height * .1),
    );
  }

  _bottomWidget() {
    final Size _pageSize = MediaQuery.of(context).size;
    return Container(
      height: _pageSize.height * .1,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            _pageSize.width * .075,
          ),
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.darkGrey,
            spreadRadius: 0,
            blurRadius: 15,
            offset: Offset(
              0.05,
              0.0,
            ),
          ),
        ],
      ),
      child: BottomBarWidget(
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastLinearToSlowEaseIn,
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          AppBottomBarItem(
            icon: SvgPicture.asset(
              AppIcons.homeIcon,
            ),
            selectedColor: AppColors.baseColor,
            unselectedColor: AppColors.darkGrey,
          ),
          AppBottomBarItem(
              icon: SvgPicture.asset(
                AppIcons.ticketIcon,
              ),
              selectedColor: AppColors.baseColor,
              unselectedColor: AppColors.darkGrey),
          AppBottomBarItem(
            icon: SvgPicture.asset(
              AppIcons.gamepadIcon,
            ),
            selectedColor: AppColors.baseColor,
            unselectedColor: AppColors.darkGrey,
          ),
          AppBottomBarItem(
            icon: SvgPicture.asset(
              AppIcons.userIcon,
            ),
            selectedColor: AppColors.baseColor,
            unselectedColor: AppColors.darkGrey,
          ),
          AppBottomBarItem(
            icon: SvgPicture.asset(
              AppIcons.settingIcon,
            ),
            selectedColor: AppColors.baseColor,
            unselectedColor: AppColors.darkGrey,
          ),
        ],
      ),
    );
  }

  _viewSelectedPageWidget() {
    if(_currentIndex==0){
      return const EventListPage();
    } else {
      return Container();
    }
  }
}
