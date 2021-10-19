import 'package:tech_alchemy/dao/app_database.dart';
import 'package:tech_alchemy/provider/events/events_repository.dart';

class EventsBloc {
  List<dynamic> eventList = [];

  List<AllEvent> recommendedEventsList = [];

  final EventRepository eventRepository;

  EventsBloc({
    required this.eventRepository,
  }) {
    initDetails();
  }

  initDetails() {
    getAllEventList();

    getRecommendedEvents();

    getEventDetails();

    getAllCheckoutList();
  }

  /// for All Events
  Future getAllEventList() async {
    final eventListResult = await eventRepository.getAllEventList();
    eventList = eventListResult;

    return eventListResult;
  }

  Future getRecommendedEvents() async {
    final recommendedEventList = await eventRepository.fetchRecommendedEvents();
    recommendedEventsList = recommendedEventList;
    return recommendedEventList;
  }

  Future<List<AllEvent>> getSimilarSportEvent({
    required String sports,
  }) async {
    final similarEventDetails = await eventRepository.getSimilarSportEvent(
      sports: sports,
    );

    return similarEventDetails;
  }

  /// For event details

  Future getEventDetails() async {
    final eventDetailsResult = await eventRepository.getEventDetails();

    return eventDetailsResult;
  }

  Future<EventDetail> getSingleEventDetails({
    required int eventId,
  }) async {
    final eventDetails = await eventRepository.getEventDetailFromDao(
      eventId: eventId,
    );

    return eventDetails;
  }

  /// For checkouts

  Future getAllCheckoutList() async {
    final checkoutList = await eventRepository.getCheckOutDetails();

    return checkoutList;
  }

  Future getSingleCheckoutData({
    required int eventId,
  }) async {
    return await eventRepository.getSingleCheckOutDataFromDao(
      eventId: eventId,
    );
  }

  /// For Purchase
  Future performPurchaseTicketBloc({
    required String dateTime,
    required String purchaseAmount,
    required String paymentMethodType,
    required int eventId,
  }) async {
    final purchasedResult =
        await eventRepository.performPurchaseTicketRepository(
      dateTime: dateTime,
      purchaseAmount: purchaseAmount,
      paymentMethodType: paymentMethodType,
      eventId: eventId,
    );

    return purchasedResult;
  }
}
