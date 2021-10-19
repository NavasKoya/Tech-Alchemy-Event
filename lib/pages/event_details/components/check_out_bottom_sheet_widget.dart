import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_alchemy/bloc/events/events_bloc.dart';
import 'package:tech_alchemy/constants/const_colors.dart';
import 'package:tech_alchemy/constants/const_icons.dart';
import 'package:tech_alchemy/dao/app_database.dart';
import 'package:tech_alchemy/pages/event_details/components/purchased_bottom_sheet_widget.dart';

class CheckoutBottomSheetWidget extends StatefulWidget {
  final EventsBloc eventBloc;
  final int eventId;

  const CheckoutBottomSheetWidget({
    Key? key,
    required this.eventBloc,
    required this.eventId,
  }) : super(key: key);

  @override
  State<CheckoutBottomSheetWidget> createState() =>
      _CheckoutBottomSheetWidgetState();
}

class _CheckoutBottomSheetWidgetState extends State<CheckoutBottomSheetWidget> {
  String selectedPaymentMode = "visa";

  bool isPaymentProcessing = false;

  @override
  Widget build(BuildContext context) {
    final Size pageSize = MediaQuery.of(context).size;

    return FutureBuilder(
        future: widget.eventBloc.getSingleCheckoutData(eventId: widget.eventId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          } else {
            return Column(
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
                _checkoutHeaderLayout(pageSize: pageSize),
                _ticketDesignLayout(
                  checkoutDetails: (snapshot.data as Checkout),
                  pageSize: pageSize,
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: pageSize.width * .05),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Choose your payment method",
                    style: TextStyle(
                      color: AppColors.black.withOpacity(.8),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                _paymentOptionsLayout(
                  checkoutDetails: (snapshot.data as Checkout),
                  pageSize: pageSize,
                ),
                _paymentButtonLayout(
                  checkoutDetails: (snapshot.data as Checkout),
                  pageSize: pageSize,
                ),
              ],
            );
          }
        });
  }

  _checkoutHeaderLayout({required Size pageSize}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: pageSize.width * .05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Row(
              children: [
                if (!isPaymentProcessing)
                  Padding(
                    padding: EdgeInsets.only(
                      right: pageSize.width * .025,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                      ),
                    ),
                  ),
                const Text(
                  "Purchase",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          if (!isPaymentProcessing)
            InkWell(
              onTap: () {
                Navigator.pop(context);
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

  _ticketDesignLayout({
    required Checkout checkoutDetails,
    required Size pageSize,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.baseColor,
            AppColors.baseColor,
            AppColors.baseColor.withOpacity(.9),
            AppColors.lightBaseColor,
          ],
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      margin: EdgeInsets.symmetric(horizontal: pageSize.width * .05),
      child: Column(
        children: [
          SizedBox(
            height: pageSize.height * .015,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: pageSize.width * .05,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    checkoutDetails.eventName!,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ),
                checkoutDetails.isPrivate
                    ? Container(
                        padding: const EdgeInsets.all(
                          5,
                        ),
                        decoration: ShapeDecoration(
                          color: AppColors.pink,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "PRIVATE",
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          SizedBox(
            height: pageSize.height * .01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: pageSize.width * .05,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  AppIcons.timerIcon,
                  color: AppColors.white,
                  height: 20,
                ),
                SizedBox(width: pageSize.width * .025),
                Text(
                  checkoutDetails.eventDateTime!,
                  style: const TextStyle(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: pageSize.height * .015,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: pageSize.width * .05,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  AppIcons.locationIcon,
                  color: AppColors.white,
                  height: 20,
                ),
                SizedBox(width: pageSize.width * .025),
                Text(
                  checkoutDetails.location!,
                  style: const TextStyle(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: pageSize.height * .01,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 8,
                  height: 15,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              const DottedLine(
                dashColor: Colors.white,
                dashLength: 6,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 8,
                  height: 15,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      bottomLeft: Radius.circular(100),
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: pageSize.height * .015,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: pageSize.width * .05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total Price",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "£${checkoutDetails.price}",
                  style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: pageSize.height * .005,
          ),
          Padding(
            padding: EdgeInsets.only(right: pageSize.width * .05),
            child: const Align(
              alignment: Alignment.topRight,
              child: Text(
                "(including 10% booking fee)",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.white,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ),
          SizedBox(
            height: pageSize.height * .015,
          ),
        ],
      ),
    );
  }

  _paymentOptionsLayout({
    required Checkout checkoutDetails,
    required Size pageSize,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: pageSize.width * .05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                selectedPaymentMode = "visa";
              });
            },
            child: PaymentMethodCardWidget(
              iconPath: AppIcons.visaIcon,
              isSelected: selectedPaymentMode == "visa" ? true : false,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedPaymentMode = "master";
              });
            },
            child: PaymentMethodCardWidget(
              iconPath: AppIcons.masterIcon,
              isSelected: selectedPaymentMode == "master" ? true : false,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedPaymentMode = "paypal";
              });
            },
            child: PaymentMethodCardWidget(
              iconPath: AppIcons.paypalIcon,
              isSelected: selectedPaymentMode == "paypal" ? true : false,
            ),
          ),
        ],
      ),
    );
  }

  _paymentButtonLayout({
    required Checkout checkoutDetails,
    required Size pageSize,
  }) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(
        horizontal: pageSize.width * .075,
        vertical: pageSize.height * .025,
      ),
      child: InkWell(
        onTap: () {
          _performPurchaseTicket(checkoutDetails: checkoutDetails);
        },
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: AppColors.green,
          ),
          margin: EdgeInsets.symmetric(
            vertical: pageSize.height * .015,
          ),
          padding: EdgeInsets.symmetric(vertical: pageSize.height * .015),
          child: Center(
            child: isPaymentProcessing
                ? const CircularProgressIndicator(
                    color: AppColors.white,
                  )
                : const Text(
                    "PAY NOW",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Future purchasedBottomSheet({
    required String orderId,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      backgroundColor: AppColors.white,
      builder: (context) => FractionallySizedBox(
        heightFactor: .7,
        child: PurchasedBottomSheetWidget(
          orderId: orderId,
        ),
      ),
    );
  }

  void _performPurchaseTicket({required Checkout checkoutDetails}) async {
    setState(() {
      isPaymentProcessing = true;
    });
    await widget.eventBloc
        .performPurchaseTicketBloc(
      dateTime: DateTime.now().toString(),
      purchaseAmount: checkoutDetails.price.toString(),
      paymentMethodType: selectedPaymentMode,
      eventId: widget.eventId,
    )
        .then((value) {
      Navigator.pop(context);
      purchasedBottomSheet(orderId: value["id"].toString());
    });
  }
}

class PaymentMethodCardWidget extends StatelessWidget {
  final String iconPath;
  final bool isSelected;

  const PaymentMethodCardWidget({
    Key? key,
    required this.iconPath,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size pageSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          height: pageSize.height * .125,
          width: pageSize.width * .25,
          padding: EdgeInsets.symmetric(
            horizontal: pageSize.width * .05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(
                iconPath,
                height: pageSize.height * .075,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? AppColors.skyBlue : AppColors.white,
                  border: Border.all(
                    color: isSelected ? Colors.transparent : AppColors.black,
                  ),
                ),
                padding: const EdgeInsets.all(5),
                child: const Icon(
                  Icons.check,
                  color: AppColors.black,
                ),
              )
            ],
          ),
        ),
        isSelected
            ? Container()
            : Container(
                color: AppColors.grey.withOpacity(.8),
                height: pageSize.height * .125,
                width: pageSize.width * .25,
              ),
      ],
    );
  }
}
