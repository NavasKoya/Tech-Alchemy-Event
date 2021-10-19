import 'package:flutter/material.dart';
import 'package:tech_alchemy/constants/const_colors.dart';
import 'package:tech_alchemy/pages/home_page.dart';

class PurchasedBottomSheetWidget extends StatelessWidget {
  final String orderId;

  const PurchasedBottomSheetWidget({Key? key, required this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size pageSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () => _onBackPressed(context: context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: pageSize.height * .01,
              width: pageSize.width * .1,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: AppColors.darkGrey,
              ),
            ),
          ),
          _purchasedHeaderLayout(
            pageSize: pageSize,
            context: context,
          ),
          _thanksLayout(pageSize: pageSize),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: pageSize.width * .05),
            child: const Divider(
              thickness: 1,
            ),
          ),
          Text(
            "Your booking ID",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 18,
              color: AppColors.black.withOpacity(.9),
            ),
          ),
          Text(
            "#$orderId",
            style: const TextStyle(
              color: AppColors.skyBlue,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: pageSize.width * .05),
            child: const Divider(
              thickness: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: pageSize.width * .05),
            child: const Text(
              "You will need this booking ID to enter inside the event. You can view this code inside your profile / booked events",
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 14,
                color: AppColors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          _closeButtonLayout(context: context, pageSize: pageSize),
          SizedBox(
            height: pageSize.height * .025,
          ),
        ],
      ),
    );
  }

  _purchasedHeaderLayout({
    required Size pageSize,
    required BuildContext context,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: pageSize.width * .05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Purchased",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          InkWell(
            onTap: () {
              _onBackPressed(context: context);
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.black,
                ),
              ),
              padding: const EdgeInsets.all(2),
              child: const Icon(
                Icons.close,
                size: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _onBackPressed({required BuildContext context}) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
        (Route<dynamic> route) => false);
  }

  _thanksLayout({required Size pageSize}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: pageSize.height * .025,
        ),
        const Center(
          child: Icon(
            Icons.check_circle_rounded,
            size: 75,
            color: AppColors.green,
          ),
        ),
        SizedBox(
          height: pageSize.height * .02,
        ),
        const Text(
          "Thank you!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 45,
            wordSpacing: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: pageSize.height * .01,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: pageSize.width * .075),
          child: Text(
            "Your payment was made successfully!",
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 20,
              color: AppColors.black.withOpacity(.8),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  _closeButtonLayout({required BuildContext context, required Size pageSize}) {
    return InkWell(
      onTap: () {
        _onBackPressed(context: context);
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: AppColors.baseColor,
        ),
        margin: EdgeInsets.symmetric(
            vertical: pageSize.height * .015, horizontal: pageSize.width * .05),
        padding: EdgeInsets.symmetric(vertical: pageSize.height * .018),
        child: const Center(
            child: Text(
          "CLOSE",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        )),
      ),
    );
  }
}
