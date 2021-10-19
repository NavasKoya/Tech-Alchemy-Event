import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_alchemy/constants/const_colors.dart';
import 'package:tech_alchemy/constants/const_icons.dart';

class RecommendedEventsLayout extends StatelessWidget {
  final String imageUrl;
  final String dateTime;
  final String eventName;
  final int ticketsSold;
  final int maxTickets;
  final int friendsAttending;
  final String price;

  const RecommendedEventsLayout({
    Key? key,
    required this.imageUrl,
    required this.dateTime,
    required this.eventName,
    required this.ticketsSold,
    required this.maxTickets,
    required this.friendsAttending,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.clockIcon,
                      color: AppColors.white,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        dateTime,
                        style: const TextStyle(
                          color: AppColors.white,
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  eventName,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: _blackBoxDecoration(),
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.ticketIcon,
                            color: AppColors.white,
                          ),
                          Text(
                            "$ticketsSold/$maxTickets",
                            style: const TextStyle(
                              color: AppColors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: _blackBoxDecoration(),
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.ticketIcon,
                            color: AppColors.white,
                          ),
                          Text(
                            "+$friendsAttending friends",
                            style: const TextStyle(
                              color: AppColors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.skyBlue,
                          borderRadius: BorderRadius.circular(25)),
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        "£$price",
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          color: AppColors.white,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Decoration _blackBoxDecoration() {
    return BoxDecoration(
      color: AppColors.black,
      borderRadius: BorderRadius.circular(25),
      border: Border.all(
        color: AppColors.white,
      ),
    );
  }
}
