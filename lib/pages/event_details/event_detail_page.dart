import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mailto/mailto.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:provider/provider.dart';
import 'package:tech_alchemy/bloc/events/events_bloc.dart';
import 'package:tech_alchemy/constants/const_colors.dart';
import 'package:tech_alchemy/constants/const_icons.dart';
import 'package:tech_alchemy/dao/app_database.dart';
import 'package:tech_alchemy/pages/event_details/components/check_out_bottom_sheet_widget.dart';
import 'package:tech_alchemy/pages/sub_pages/event_list/components/all_events_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetailPage extends StatefulWidget {
  final int eventId;

  const EventDetailPage({
    Key? key,
    required this.eventId,
  }) : super(key: key);

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  EventsBloc? eventsBloc;

  List<Widget> eventTagsWidget = [];

  bool _isLiked = false;

  CarouselSliderController? _sliderController;

  @override
  void initState() {
    super.initState();
    _sliderController = CarouselSliderController();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    eventsBloc = Provider.of<EventsBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    final Size pageSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: _eventsBodyLayout(pageSize: pageSize),
    );
  }

  _imageDetailsLayout({
    required EventDetail eventDetail,
    required Size pageSize,
  }) {
    return SizedBox(
      height: pageSize.height * .3,
      child: Stack(
        children: [
          SizedBox(
            height: pageSize.height * .3,
            child: CachedNetworkImage(
              imageUrl: eventDetail.mainImage!,
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
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    eventDetail.isPartnered
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
                        eventDetail.sport!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: pageSize.height * .025,
                ),
                Text(
                  eventDetail.eventName!,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: pageSize.height * .025,
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
                              eventDetail.eventDateTime!,
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
                        "£${eventDetail.price.toString()}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          color: AppColors.white,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: pageSize.height * .025,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _eventsBodyLayout({
    required Size pageSize,
  }) {
    return FutureBuilder(
      future: eventsBloc!.getSingleEventDetails(eventId: widget.eventId),
      builder: (BuildContext context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        } else {
          return ListView(
            children: [
              _imageDetailsLayout(
                eventDetail: (snapshot.data as EventDetail),
                pageSize: pageSize,
              ),
              _eventBasicInfoLayout(
                eventDetail: (snapshot.data as EventDetail),
                pageSize: pageSize,
              ),
              _eventDetailedInfoLayout(
                eventDetail: (snapshot.data as EventDetail),
                pageSize: pageSize,
              ),
            ],
          );
        }
      },
    );
  }

  _initiateEventTag({
    required EventDetail eventDetail,
  }) {
    eventTagsWidget = [];
    String? _tags = eventDetail.tags;
    _tags = _tags!.substring(1, _tags.length - 1);
    _tags.split(",").forEach((element) {
      eventTagsWidget.add(
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: _hashTagDecoration,
            child: Text(
              "#${element.substring(1, element.length - 1)}",
              style: _hashTagStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    });
  }

  final BoxDecoration _hashTagDecoration = const BoxDecoration(
    color: AppColors.lightPeach,
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  );

  final TextStyle _hashTagStyle = const TextStyle(
    color: AppColors.darkPeach,
    fontSize: 12,
  );

  _eventBasicInfoLayout({
    required EventDetail eventDetail,
    required Size pageSize,
  }) {
    _initiateEventTag(eventDetail: eventDetail);

    return Padding(
      padding: EdgeInsets.only(left: pageSize.width * .05),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: "Total prize: ",
                  style: const TextStyle(color: AppColors.coalBlack),
                  children: <TextSpan>[
                    TextSpan(
                      text: "£${eventDetail.totalPrize}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: AppColors.black),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: AppColors.darkGrey,
                    ),
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Icon(
                            Icons.person_add_alt,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 11.0),
                          child: Text(
                            "Share Event",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: _isLiked
                        ? const Icon(
                            Icons.favorite,
                            color: AppColors.red,
                            size: 27,
                          )
                        : const Icon(
                            Icons.favorite_border,
                            color: AppColors.darkGrey,
                            size: 25,
                          ),
                    onPressed: () {
                      setState(() {
                        _isLiked = !_isLiked;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: SvgPicture.asset(AppIcons.ticketIcon),
              ),
              Text(
                "${eventDetail.ticketsSold}/${eventDetail.maxTickets} attending",
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                  color: AppColors.baseColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: pageSize.height * .015,
          ),
          Row(
            children: eventTagsWidget,
          ),
        ],
      ),
    );
  }

  _eventDetailedInfoLayout({
    required EventDetail eventDetail,
    required Size pageSize,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: pageSize.width * .05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: pageSize.height * .015,
          ),
          const Text(
            "ABOUT:",
            style: TextStyle(color: AppColors.black, fontSize: 15),
          ),
          SizedBox(
            height: pageSize.height * .01,
          ),
          Text(
            "${eventDetail.description}",
            style: const TextStyle(color: AppColors.black, fontSize: 14),
          ),
          InkWell(
            onTap: () async {
              checkOutBottomSheet(
                eventId: eventDetail.eventId!,
              );
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
                  child: Text(
                "£${eventDetail.price} - I’M IN!",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              )),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          SizedBox(
            height: pageSize.height * .015,
          ),
          const Text(
            "VENUE INFORMATION:",
            style: TextStyle(color: AppColors.black, fontSize: 15),
          ),
          SizedBox(
            height: pageSize.height * .01,
          ),
          Text(
            "${eventDetail.venueInformation}",
            style: const TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
          const Divider(
            thickness: 1,
          ),
          SizedBox(
            height: pageSize.height * .015,
          ),
          const Text(
            "EVENT CREATED BY :",
            style: TextStyle(color: AppColors.black, fontSize: 15),
          ),
          SizedBox(
            height: pageSize.height * .01,
          ),
          Row(
            children: [
              const Icon(
                Icons.person_pin,
                size: 20,
                color: AppColors.darkGrey,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  "${eventDetail.eventCreator}",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
          SizedBox(
            height: pageSize.height * .015,
          ),
          const Divider(
            thickness: 1,
          ),
          SizedBox(
            height: pageSize.height * .015,
          ),
          const Text(
            "LOCATION :",
            style: TextStyle(color: AppColors.black, fontSize: 15),
          ),
          SizedBox(
            height: pageSize.height * .01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.location_pin,
                    size: 20,
                    color: AppColors.darkGrey,
                  ),
                  SizedBox(
                    // height: 60,
                    width: pageSize.width * .4,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        "${eventDetail.location}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => MapsLauncher.launchQuery(eventDetail.location!),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.baseColor),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "Take Me There ",
                          style: TextStyle(color: AppColors.baseColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: pageSize.height * .015,
          ),
          const Divider(
            thickness: 1,
          ),
          SizedBox(
            height: pageSize.height * .015,
          ),
          const Text(
            "CONTACT :",
            style: TextStyle(color: AppColors.black, fontSize: 15),
          ),
          SizedBox(
            height: pageSize.height * .01,
          ),
          RichText(
            text: TextSpan(
              text: "Send us an email at\n",
              style: const TextStyle(color: AppColors.coalBlack),
              children: <TextSpan>[
                TextSpan(
                  text: "contact@techalchemy.co",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.baseColor,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _launchEMail(mailId: "contact@techalchemy.co");
                    },
                ),
                const TextSpan(
                  text: " or call us at +1 991-681-0200",
                  style: TextStyle(
                    color: AppColors.coalBlack,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: pageSize.height * .015,
          ),
          const Divider(
            thickness: 1,
          ),
          SizedBox(
            height: pageSize.height * .015,
          ),
          const Text(
            "TEAM INFORMATION:",
            style: TextStyle(color: AppColors.black, fontSize: 15),
          ),
          SizedBox(
            height: pageSize.height * .01,
          ),
          Text(
            "${eventDetail.teamInformation}",
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: pageSize.height * .015,
          ),
          const Divider(
            thickness: 1,
          ),
          SizedBox(
            height: pageSize.height * .015,
          ),
          const Text(
            "SIMILAR EVENTS :",
            style: TextStyle(color: AppColors.black, fontSize: 15),
          ),
          SizedBox(
            height: pageSize.height * .015,
          ),
          _similarEventLayout(eventDetail: eventDetail, pageSize: pageSize)
        ],
      ),
    );
  }

  _similarEventLayout({
    required EventDetail eventDetail,
    required Size pageSize,
  }) {
    return FutureBuilder(
      future: eventsBloc!.getSimilarSportEvent(sports: eventDetail.sport!),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        } else {
          return SizedBox(
            height: pageSize.height * .5,
            child: CarouselSlider.builder(
              unlimitedMode: false,
              controller: _sliderController,
              itemCount: (snapshot.data as dynamic).length,
              slideBuilder: (index) {
                final eventResult = (snapshot.data as dynamic)[index];
                return Container(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventDetailPage(
                            eventId: eventResult.eventId,
                          ),
                        ),
                      );
                    },
                    child: AllEventsLayout(
                      imageUrl: eventResult.mainImage,
                      dateTime: eventResult.eventDateTime,
                      maxTickets: eventResult.maxTickets,
                      ticketsSold: eventResult.ticketsSold,
                      friendsAttending: eventResult.friendsAttending,
                      price: eventResult.price.toString(),
                      eventName: eventResult.eventName,
                      sport: eventResult.sport,
                      isPartnered: eventResult.isPartnered,
                      totalPrize: eventResult.totalPrize,
                      location: eventResult.location,
                    ),
                  ),
                );
              },
              slideTransform: const AccordionTransform(),
              initialPage: 0,
              enableAutoSlider: false,
            ),
          );
        }
      },
    );
  }

  Future checkOutBottomSheet({
    required int eventId,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      backgroundColor: AppColors.grey,
      builder: (context) => FractionallySizedBox(
        heightFactor: .7,
        child: CheckoutBottomSheetWidget(
          eventId: eventId,
          eventBloc: eventsBloc!,
        ),
      ),
    );
  }

  _launchEMail({
    required String mailId,
  }) {
    final mailtoLink = Mailto(
      to: [mailId],
      cc: [''],
      subject: 'Enquiry about tech alchemy',
      body: 'Hi,\nFlutter Developer. \nRegards,\nDeveloper',
    );

    launch(mailtoLink.toString());
  }
}
