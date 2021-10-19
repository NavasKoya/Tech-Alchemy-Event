import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tech_alchemy/constants/const_strings.dart';
import 'package:tech_alchemy/model_mapper/all_events_mapper.dart';
import 'package:tech_alchemy/model_mapper/checkout_mapper.dart';
import 'package:tech_alchemy/model_mapper/event_detail_mapper.dart';
import 'package:tech_alchemy/utils/network_utils.dart';

class EventServices {
  Future fetAllEvents() async {
    Response? eventResponse;
    try {
      const url = "$baseApiUrl/allEvents";
      eventResponse = await Dio().get(
        url,
        options: await getDioOptions(),
      );
    } catch (e) {
      debugPrint(e.toString());
    }

    final List<dynamic> ticketJsons =
        eventResponse!.data["allEvents"] as List<dynamic>;

    return ticketJsons
        .map(
          (json) => AllEventMapper().fromTicketJson(
            eventEntry: json,
          ),
        )
        .toList();
  }

  Future fetAllEventsDetails() async {
    Response? eventDetailResponse;
    try {
      const url = "$baseApiUrl/eventDetails";
      eventDetailResponse = await Dio().get(
        url,
        options: await getDioOptions(),
      );
    } catch (e) {
      debugPrint(e.toString());
    }

    final List<dynamic> ticketJsons =
        eventDetailResponse!.data["eventDetails"] as List<dynamic>;

    return ticketJsons
        .map(
          (json) => EventDetailsMapper().fromTicketJson(
            eventDetails: json,
          ),
        )
        .toList();
  }

  Future fetAllCheckouts() async {
    Response? checkoutResponse;
    try {
      const url = "$baseApiUrl/checkout";
      checkoutResponse = await Dio().get(
        url,
        options: await getDioOptions(),
      );
    } catch (e) {
      debugPrint(e.toString());
    }

    final List<dynamic> ticketJsons =
        checkoutResponse!.data["checkout"] as List<dynamic>;

    return ticketJsons
        .map(
          (json) => CheckoutMapper().fromTicketJson(
            checkouts: json,
          ),
        )
        .toList();
  }

  /// For Purchase
  Future performPurchaseTicketService({required postData}) async {
    Response? postResponse;
    try {
      const url = "$baseApiUrl/purchase";
      postResponse = await Dio().post(
        url,
        data: postData,
        options: await getDioOptions(),
      );
    } catch (e) {
      debugPrint(e.toString());
    }

    return postResponse!.data["purchase"];
  }
}
