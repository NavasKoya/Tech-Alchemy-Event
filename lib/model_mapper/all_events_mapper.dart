import 'package:tech_alchemy/dao/app_database.dart';

class AllEventMapper {
  AllEvent fromTicketJson({
    required Map<String, dynamic> eventEntry,
  }) {
    return AllEvent(
      id: '${eventEntry["id"]}',
      eventId: eventEntry["id"],
      eventName: eventEntry["name"].toString(),
      eventDateTime: eventEntry["dateTime"],
      bookBy: eventEntry["bookBy"],
      ticketsSold: eventEntry["ticketsSold"],
      maxTickets: eventEntry["maxTickets"],
      friendsAttending: eventEntry["friendsAttending"],
      price: double.parse(eventEntry["price"].toString()),
      isPartnered: eventEntry["isPartnered"],
      sport: eventEntry["sport"],
      totalPrize: eventEntry["totalPrize"],
      location: eventEntry["location"],
      isRecommended: eventEntry["isRecommended"],
      mainImage: eventEntry["mainImage"],
    );
  }
}