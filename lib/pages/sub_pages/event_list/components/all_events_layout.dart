import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_alchemy/constants/const_colors.dart';
import 'package:tech_alchemy/constants/const_icons.dart';

class AllEventsLayout extends StatelessWidget {
  final String imageUrl;
  final String dateTime;
  final String eventName;
  final int ticketsSold;
  final int maxTickets;
  final int friendsAttending;
  final String price;
  final bool isPartnered;
  final String sport;
  final int totalPrize;
  final String location;

  const AllEventsLayout({
    Key? key,
    required this.imageUrl,
    required this.dateTime,
    required this.eventName,
    required this.ticketsSold,
    required this.maxTickets,
    required this.friendsAttending,
    required this.price,
    required this.isPartnered,
    required this.sport,
    required this.totalPrize,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _pageSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: _pageSize.width * .05,
        vertical: _pageSize.height * .01,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _imageStackLayout(
            pageSize: _pageSize,
          ),
          _eventInfoLayout(
            pageSize: _pageSize,
          ),
          SizedBox(
            height: _pageSize.height * .01,
          ),
          _timerLayout(
            pageSize: _pageSize,
          ),
          SizedBox(
            height: _pageSize.height * .01,
          ),
          _attendingLayout(
            pageSize: _pageSize,
          ),
          SizedBox(
            height: _pageSize.height * .01,
          ),
          _locationLayout(
            pageSize: _pageSize,
          ),
          SizedBox(
            height: _pageSize.height * .05,
          ),
        ],
      ),
    );
  }

  _eventInfoLayout({
    required Size pageSize,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: pageSize.width * .05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              text: "Total prize: ",
              style: const TextStyle(
                color: AppColors.coalBlack,
                fontSize: 16,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "£${totalPrize.toString()}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              SvgPicture.asset(AppIcons.uploadIcon),
              const SizedBox(
                width: 25,
              ),
              SvgPicture.asset(AppIcons.heartIcon)
            ],
          )
        ],
      ),
    );
  }

  _imageStackLayout({
    required Size pageSize,
  }) {
    return SizedBox(
      height: pageSize.height * .25,
      width: pageSize.width,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(25),
            ),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.contain,
              placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Center(
                child: Icon(
                  Icons.error,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: pageSize.width * .05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    isPartnered
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: AppColors.skyBlue,
                            ),
                            padding: const EdgeInsets.all(5),
                            child: const Text(
                              "Partnered",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.white,
                              ),
                            ),
                          )
                        : Container(),
                    SizedBox(
                      width: pageSize.width * .05,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors.white,
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        sport,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
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
                    fontSize: 22,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
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
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(20),
                        ),
                        color: AppColors.skyBlue,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "£$price",
                        style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            color: AppColors.white),
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

  _attendingLayout({
    required Size pageSize,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: pageSize.width * .05,
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              right: pageSize.width * .025,
            ),
            child: SvgPicture.asset(
              AppIcons.ticketIcon,
              height: 20,
              width: 20,
            ),
          ),
          Text(
            "$ticketsSold/$maxTickets attending total",
            style: const TextStyle(
              decoration: TextDecoration.underline,
              color: AppColors.baseColor,
            ),
          ),
        ],
      ),
    );
  }

  _timerLayout({
    required Size pageSize,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: pageSize.width * .05,
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              right: pageSize.width * .025,
            ),
            child: SvgPicture.asset(
              AppIcons.timerIcon,
              height: 20,
              width: 20,
            ),
          ),
          RichText(
            text: const TextSpan(
              text: "Time left to Book: ",
              style: TextStyle(
                color: AppColors.skyBlue,
                fontWeight: FontWeight.w800,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "3 hours",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _locationLayout({
    required Size pageSize,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: pageSize.width * .05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    right: pageSize.width * .025,
                  ),
                  child: SvgPicture.asset(
                    AppIcons.locationIcon,
                    height: 20,
                  ),
                ),
                Expanded(
                  child: Text(
                    location,
                    style: const TextStyle(
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            "1 km",
            style: TextStyle(
              color: AppColors.black.withOpacity(.9),
            ),
          ),
        ],
      ),
    );
  }
}
