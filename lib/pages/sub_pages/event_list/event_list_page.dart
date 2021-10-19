import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_alchemy/bloc/bloc_provider.dart';
import 'package:tech_alchemy/bloc/events/events_bloc.dart';
import 'package:tech_alchemy/constants/const_colors.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:tech_alchemy/pages/event_details/event_detail_page.dart';
import 'package:tech_alchemy/pages/sub_pages/event_list/components/all_events_layout.dart';
import 'package:tech_alchemy/pages/sub_pages/event_list/components/recommended_event_layout.dart';

class EventListPage extends StatefulWidget {
  const EventListPage({Key? key}) : super(key: key);

  @override
  State<EventListPage> createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  CarouselSliderController? _sliderController;

  @override
  void initState() {
    super.initState();
    _sliderController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    final Size _pageSize = MediaQuery.of(context).size;
    return Provider<EventsBloc>(
      create: (_) => provideEventsBloc(),
      child: Builder(
        builder: (BuildContext context) {
          final bloc = Provider.of<EventsBloc>(context);
          return ListView(
            children: [
              FutureBuilder(
                future: bloc.getRecommendedEvents(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: _pageSize.width * .075,
                              vertical: _pageSize.height * .01),
                          child: const Text(
                            "Recommended Events",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppColors.coalBlack,
                            ),
                          ),
                        ),
                        Container(
                          height: _pageSize.height * .25,
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          child: CarouselSlider.builder(
                            unlimitedMode: true,
                            controller: _sliderController,
                            itemCount: (snapshot.data as dynamic).length,
                            slideBuilder: (index) {
                              final eventResult =
                                  (snapshot.data as dynamic)[index];
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
                                  child: RecommendedEventsLayout(
                                    imageUrl: eventResult.mainImage,
                                    dateTime: eventResult.eventDateTime,
                                    maxTickets: eventResult.maxTickets,
                                    ticketsSold: eventResult.ticketsSold,
                                    friendsAttending:
                                        eventResult.friendsAttending,
                                    price: eventResult.price.toString(),
                                    eventName: eventResult.eventName,
                                  ),
                                ),
                              );
                            },
                            slideTransform: const CubeTransform(),
                            slideIndicator: CircularSlideIndicator(
                              padding: const EdgeInsets.only(top: 50),
                              indicatorBorderColor: Colors.black,
                            ),
                            initialPage: 0,
                            enableAutoSlider: false,
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
              FutureBuilder(
                  future: bloc.getAllEventList(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    } else {
                      return Container(
                        margin: const EdgeInsets.only(top: 25,),
                        decoration: const BoxDecoration(
                          gradient: SweepGradient(
                            colors: [
                              AppColors.white,
                              AppColors.grey,
                            ],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: _pageSize.height * .01,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: _pageSize.width * .05,
                              ),
                              child: const Text(
                                "All events",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.coalBlack,
                                ),
                              ),
                            ),
                            Column(
                              children: List.generate(
                                (snapshot.data as dynamic).length,
                                (index) {
                                  final eventResult =
                                      (snapshot.data as dynamic)[index];
                                  return InkWell(
                                    onTap: (){
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
                                        friendsAttending:
                                            eventResult.friendsAttending,
                                        price: eventResult.price.toString(),
                                        eventName: eventResult.eventName,
                                        sport: eventResult.sport,
                                        isPartnered: eventResult.isPartnered,
                                        totalPrize: eventResult.totalPrize,
                                        location: eventResult.location),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  })
            ],
          );
        },
      ),
    );
  }
}
