import 'package:tech_alchemy/dao/app_database.dart';

class EventDetailsMapper {
  EventDetail fromTicketJson({
    required Map<String, dynamic> eventDetails,
  }) {
    return EventDetail(
      id: '${eventDetails["id"]}',
      eventId: eventDetails["id"],
      eventName: eventDetails["name"].toString(),
      eventDateTime: eventDetails["dateTime"],
      bookBy: eventDetails["bookBy"],
      ticketsSold: eventDetails["ticketsSold"],
      maxTickets: eventDetails["maxTickets"],
      friendsAttending: eventDetails["friendsAttending"],
      price: double.parse(eventDetails["price"].toString()),
      isPartnered: eventDetails["isPartnered"],
      sport: eventDetails["sport"],
      totalPrize: eventDetails["totalPrize"],
      location: eventDetails["location"],
      description: eventDetails["description"],
      venueInformation: eventDetails["venueInformation"],
      eventCreator: eventDetails["eventCreator"],
      teamInformation: eventDetails["teamInformation"],
      tags: eventDetails["tags"],
      mainImage: eventDetails["mainImage"],
    );
  }
}