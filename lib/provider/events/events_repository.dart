import 'dart:convert';

import 'package:tech_alchemy/dao/all_events/all_events_dao.dart';
import 'package:tech_alchemy/dao/app_database.dart';
import 'package:tech_alchemy/dao/checkout/checkout_dao.dart';
import 'package:tech_alchemy/dao/event_details/event_details_dao.dart';
import 'package:tech_alchemy/service/events/event_service.dart';

class EventRepository {
  final EventServices eventServices;
  final AllEventsDao allEventsDao;
  final CheckoutsDao checkoutsDao;

  final EventDetailsDao eventDetailsDao;

  EventRepository({
    required this.eventServices,
    required this.allEventsDao,
    required this.eventDetailsDao,
    required this.checkoutsDao,
  });

  Future<dynamic> getAllEventList() async {
    // final eventList = await eventServices.fetAllEvents();

    // final _test = eventList["allEvents"];
    //
    // final data = _test
    //     .map(
    //       (events) => AllEventsModel.fromNetworkJson(
    //         events ),
    // )
    //     .toList();
    //
    // return data;
    // return eventList;

    final eventList = await eventServices.fetAllEvents();

    // await allEventsDao.getDeleteAllDelete();

    await saveFetchedEvents(
      eventList,
    );
    return eventList;
  }

  Future<List<AllEvent>> fetchRecommendedEvents() async {
    return allEventsDao.getRecommendedEvent();
  }

  Future<void> saveFetchedEvents(
    List<AllEvent> event,
  ) async {
    await allEventsDao.saveEvents(event);
  }

  Future<List<EventDetail>> getEventDetails() async {
    final eventDetails = await eventServices.fetAllEventsDetails();

    await saveEventDetails(
      eventDetails,
    );
    return eventDetails;
  }

  Future<void> saveEventDetails(
    List<EventDetail> eventDetails,
  ) async {
    await eventDetailsDao.saveEventDetails(eventDetails);
  }

  Future<EventDetail> getEventDetailFromDao({required int eventId}) async {
    return eventDetailsDao.getEvent(eventId);
  }

  Future<List<AllEvent>> getSimilarSportEvent({required String sports}) async {
    return allEventsDao.getSimilarEvent(sports);
  }

  /// For Checkout
  Future<List<Checkout>> getCheckOutDetails() async {
    final checkOutDetails = await eventServices.fetAllCheckouts();

    await checkoutsDao.saveCheckOutDetails(checkOutDetails);
    return checkOutDetails;
  }

  Future<Checkout> getSingleCheckOutDataFromDao({required int eventId}) async{
    return checkoutsDao.getSingleCheckOutData(eventId);
  }

  /// For Purchase
  Future performPurchaseTicketRepository({
    required String dateTime,
    required String purchaseAmount,
    required String paymentMethodType,
    required int eventId,
  }) async{

    final postData = jsonEncode({
      "purchase":{
        "dateTime": dateTime,
        "purchaseAmount": purchaseAmount,
        "paymentMethodType": paymentMethodType,
        "eventId": eventId,
      },
    });

    final purchasedResult = await eventServices.performPurchaseTicketService(postData: postData);

    return purchasedResult;
  }

}
