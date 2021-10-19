import 'package:tech_alchemy/dao/app_database.dart';

class CheckoutMapper {
  Checkout fromTicketJson({
    required Map<String, dynamic> checkouts,
  }) {
    return Checkout(
      id: '${checkouts["id"]}',
      eventId: checkouts["id"],
      eventName: checkouts["name"].toString(),
      eventDateTime: checkouts["dateTime"],
      price: double.parse(checkouts["price"].toString()),
      mainImage: checkouts["mainImage"],
      isPrivate: checkouts["isPrivate"],
      location: checkouts["location"],
      gameLength: checkouts["gameLength"],
      paymentMethodUnsupported: checkouts["paymentMethodUnsupported"],
    );
  }
}