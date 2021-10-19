// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class AllEvent extends DataClass implements Insertable<AllEvent> {
  final String id;
  final int? eventId;
  final String? eventName;
  final String? eventDateTime;
  final String? bookBy;
  final int? ticketsSold;
  final int? maxTickets;
  final int? friendsAttending;
  final double? price;
  final bool isPartnered;
  final String? sport;
  final int? totalPrize;
  final String? location;
  final bool isRecommended;
  final String? mainImage;
  AllEvent(
      {required this.id,
      this.eventId,
      this.eventName,
      this.eventDateTime,
      this.bookBy,
      this.ticketsSold,
      this.maxTickets,
      this.friendsAttending,
      this.price,
      required this.isPartnered,
      this.sport,
      this.totalPrize,
      this.location,
      required this.isRecommended,
      this.mainImage});
  factory AllEvent.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return AllEvent(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      eventId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}event_id']),
      eventName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}event_name']),
      eventDateTime: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}event_date_time']),
      bookBy: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}book_by']),
      ticketsSold: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tickets_sold']),
      maxTickets: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}max_tickets']),
      friendsAttending: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}friends_attending']),
      price: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}price']),
      isPartnered: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_partnered'])!,
      sport: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sport']),
      totalPrize: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total_prize']),
      location: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}location']),
      isRecommended: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_recommended'])!,
      mainImage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}main_image']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || eventId != null) {
      map['event_id'] = Variable<int?>(eventId);
    }
    if (!nullToAbsent || eventName != null) {
      map['event_name'] = Variable<String?>(eventName);
    }
    if (!nullToAbsent || eventDateTime != null) {
      map['event_date_time'] = Variable<String?>(eventDateTime);
    }
    if (!nullToAbsent || bookBy != null) {
      map['book_by'] = Variable<String?>(bookBy);
    }
    if (!nullToAbsent || ticketsSold != null) {
      map['tickets_sold'] = Variable<int?>(ticketsSold);
    }
    if (!nullToAbsent || maxTickets != null) {
      map['max_tickets'] = Variable<int?>(maxTickets);
    }
    if (!nullToAbsent || friendsAttending != null) {
      map['friends_attending'] = Variable<int?>(friendsAttending);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double?>(price);
    }
    map['is_partnered'] = Variable<bool>(isPartnered);
    if (!nullToAbsent || sport != null) {
      map['sport'] = Variable<String?>(sport);
    }
    if (!nullToAbsent || totalPrize != null) {
      map['total_prize'] = Variable<int?>(totalPrize);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String?>(location);
    }
    map['is_recommended'] = Variable<bool>(isRecommended);
    if (!nullToAbsent || mainImage != null) {
      map['main_image'] = Variable<String?>(mainImage);
    }
    return map;
  }

  AllEventsCompanion toCompanion(bool nullToAbsent) {
    return AllEventsCompanion(
      id: Value(id),
      eventId: eventId == null && nullToAbsent
          ? const Value.absent()
          : Value(eventId),
      eventName: eventName == null && nullToAbsent
          ? const Value.absent()
          : Value(eventName),
      eventDateTime: eventDateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(eventDateTime),
      bookBy:
          bookBy == null && nullToAbsent ? const Value.absent() : Value(bookBy),
      ticketsSold: ticketsSold == null && nullToAbsent
          ? const Value.absent()
          : Value(ticketsSold),
      maxTickets: maxTickets == null && nullToAbsent
          ? const Value.absent()
          : Value(maxTickets),
      friendsAttending: friendsAttending == null && nullToAbsent
          ? const Value.absent()
          : Value(friendsAttending),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      isPartnered: Value(isPartnered),
      sport:
          sport == null && nullToAbsent ? const Value.absent() : Value(sport),
      totalPrize: totalPrize == null && nullToAbsent
          ? const Value.absent()
          : Value(totalPrize),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      isRecommended: Value(isRecommended),
      mainImage: mainImage == null && nullToAbsent
          ? const Value.absent()
          : Value(mainImage),
    );
  }

  factory AllEvent.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return AllEvent(
      id: serializer.fromJson<String>(json['id']),
      eventId: serializer.fromJson<int?>(json['eventId']),
      eventName: serializer.fromJson<String?>(json['eventName']),
      eventDateTime: serializer.fromJson<String?>(json['eventDateTime']),
      bookBy: serializer.fromJson<String?>(json['bookBy']),
      ticketsSold: serializer.fromJson<int?>(json['ticketsSold']),
      maxTickets: serializer.fromJson<int?>(json['maxTickets']),
      friendsAttending: serializer.fromJson<int?>(json['friendsAttending']),
      price: serializer.fromJson<double?>(json['price']),
      isPartnered: serializer.fromJson<bool>(json['isPartnered']),
      sport: serializer.fromJson<String?>(json['sport']),
      totalPrize: serializer.fromJson<int?>(json['totalPrize']),
      location: serializer.fromJson<String?>(json['location']),
      isRecommended: serializer.fromJson<bool>(json['isRecommended']),
      mainImage: serializer.fromJson<String?>(json['mainImage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'eventId': serializer.toJson<int?>(eventId),
      'eventName': serializer.toJson<String?>(eventName),
      'eventDateTime': serializer.toJson<String?>(eventDateTime),
      'bookBy': serializer.toJson<String?>(bookBy),
      'ticketsSold': serializer.toJson<int?>(ticketsSold),
      'maxTickets': serializer.toJson<int?>(maxTickets),
      'friendsAttending': serializer.toJson<int?>(friendsAttending),
      'price': serializer.toJson<double?>(price),
      'isPartnered': serializer.toJson<bool>(isPartnered),
      'sport': serializer.toJson<String?>(sport),
      'totalPrize': serializer.toJson<int?>(totalPrize),
      'location': serializer.toJson<String?>(location),
      'isRecommended': serializer.toJson<bool>(isRecommended),
      'mainImage': serializer.toJson<String?>(mainImage),
    };
  }

  AllEvent copyWith(
          {String? id,
          int? eventId,
          String? eventName,
          String? eventDateTime,
          String? bookBy,
          int? ticketsSold,
          int? maxTickets,
          int? friendsAttending,
          double? price,
          bool? isPartnered,
          String? sport,
          int? totalPrize,
          String? location,
          bool? isRecommended,
          String? mainImage}) =>
      AllEvent(
        id: id ?? this.id,
        eventId: eventId ?? this.eventId,
        eventName: eventName ?? this.eventName,
        eventDateTime: eventDateTime ?? this.eventDateTime,
        bookBy: bookBy ?? this.bookBy,
        ticketsSold: ticketsSold ?? this.ticketsSold,
        maxTickets: maxTickets ?? this.maxTickets,
        friendsAttending: friendsAttending ?? this.friendsAttending,
        price: price ?? this.price,
        isPartnered: isPartnered ?? this.isPartnered,
        sport: sport ?? this.sport,
        totalPrize: totalPrize ?? this.totalPrize,
        location: location ?? this.location,
        isRecommended: isRecommended ?? this.isRecommended,
        mainImage: mainImage ?? this.mainImage,
      );
  @override
  String toString() {
    return (StringBuffer('AllEvent(')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('eventName: $eventName, ')
          ..write('eventDateTime: $eventDateTime, ')
          ..write('bookBy: $bookBy, ')
          ..write('ticketsSold: $ticketsSold, ')
          ..write('maxTickets: $maxTickets, ')
          ..write('friendsAttending: $friendsAttending, ')
          ..write('price: $price, ')
          ..write('isPartnered: $isPartnered, ')
          ..write('sport: $sport, ')
          ..write('totalPrize: $totalPrize, ')
          ..write('location: $location, ')
          ..write('isRecommended: $isRecommended, ')
          ..write('mainImage: $mainImage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      eventId,
      eventName,
      eventDateTime,
      bookBy,
      ticketsSold,
      maxTickets,
      friendsAttending,
      price,
      isPartnered,
      sport,
      totalPrize,
      location,
      isRecommended,
      mainImage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AllEvent &&
          other.id == this.id &&
          other.eventId == this.eventId &&
          other.eventName == this.eventName &&
          other.eventDateTime == this.eventDateTime &&
          other.bookBy == this.bookBy &&
          other.ticketsSold == this.ticketsSold &&
          other.maxTickets == this.maxTickets &&
          other.friendsAttending == this.friendsAttending &&
          other.price == this.price &&
          other.isPartnered == this.isPartnered &&
          other.sport == this.sport &&
          other.totalPrize == this.totalPrize &&
          other.location == this.location &&
          other.isRecommended == this.isRecommended &&
          other.mainImage == this.mainImage);
}

class AllEventsCompanion extends UpdateCompanion<AllEvent> {
  final Value<String> id;
  final Value<int?> eventId;
  final Value<String?> eventName;
  final Value<String?> eventDateTime;
  final Value<String?> bookBy;
  final Value<int?> ticketsSold;
  final Value<int?> maxTickets;
  final Value<int?> friendsAttending;
  final Value<double?> price;
  final Value<bool> isPartnered;
  final Value<String?> sport;
  final Value<int?> totalPrize;
  final Value<String?> location;
  final Value<bool> isRecommended;
  final Value<String?> mainImage;
  const AllEventsCompanion({
    this.id = const Value.absent(),
    this.eventId = const Value.absent(),
    this.eventName = const Value.absent(),
    this.eventDateTime = const Value.absent(),
    this.bookBy = const Value.absent(),
    this.ticketsSold = const Value.absent(),
    this.maxTickets = const Value.absent(),
    this.friendsAttending = const Value.absent(),
    this.price = const Value.absent(),
    this.isPartnered = const Value.absent(),
    this.sport = const Value.absent(),
    this.totalPrize = const Value.absent(),
    this.location = const Value.absent(),
    this.isRecommended = const Value.absent(),
    this.mainImage = const Value.absent(),
  });
  AllEventsCompanion.insert({
    required String id,
    this.eventId = const Value.absent(),
    this.eventName = const Value.absent(),
    this.eventDateTime = const Value.absent(),
    this.bookBy = const Value.absent(),
    this.ticketsSold = const Value.absent(),
    this.maxTickets = const Value.absent(),
    this.friendsAttending = const Value.absent(),
    this.price = const Value.absent(),
    this.isPartnered = const Value.absent(),
    this.sport = const Value.absent(),
    this.totalPrize = const Value.absent(),
    this.location = const Value.absent(),
    this.isRecommended = const Value.absent(),
    this.mainImage = const Value.absent(),
  }) : id = Value(id);
  static Insertable<AllEvent> custom({
    Expression<String>? id,
    Expression<int?>? eventId,
    Expression<String?>? eventName,
    Expression<String?>? eventDateTime,
    Expression<String?>? bookBy,
    Expression<int?>? ticketsSold,
    Expression<int?>? maxTickets,
    Expression<int?>? friendsAttending,
    Expression<double?>? price,
    Expression<bool>? isPartnered,
    Expression<String?>? sport,
    Expression<int?>? totalPrize,
    Expression<String?>? location,
    Expression<bool>? isRecommended,
    Expression<String?>? mainImage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (eventId != null) 'event_id': eventId,
      if (eventName != null) 'event_name': eventName,
      if (eventDateTime != null) 'event_date_time': eventDateTime,
      if (bookBy != null) 'book_by': bookBy,
      if (ticketsSold != null) 'tickets_sold': ticketsSold,
      if (maxTickets != null) 'max_tickets': maxTickets,
      if (friendsAttending != null) 'friends_attending': friendsAttending,
      if (price != null) 'price': price,
      if (isPartnered != null) 'is_partnered': isPartnered,
      if (sport != null) 'sport': sport,
      if (totalPrize != null) 'total_prize': totalPrize,
      if (location != null) 'location': location,
      if (isRecommended != null) 'is_recommended': isRecommended,
      if (mainImage != null) 'main_image': mainImage,
    });
  }

  AllEventsCompanion copyWith(
      {Value<String>? id,
      Value<int?>? eventId,
      Value<String?>? eventName,
      Value<String?>? eventDateTime,
      Value<String?>? bookBy,
      Value<int?>? ticketsSold,
      Value<int?>? maxTickets,
      Value<int?>? friendsAttending,
      Value<double?>? price,
      Value<bool>? isPartnered,
      Value<String?>? sport,
      Value<int?>? totalPrize,
      Value<String?>? location,
      Value<bool>? isRecommended,
      Value<String?>? mainImage}) {
    return AllEventsCompanion(
      id: id ?? this.id,
      eventId: eventId ?? this.eventId,
      eventName: eventName ?? this.eventName,
      eventDateTime: eventDateTime ?? this.eventDateTime,
      bookBy: bookBy ?? this.bookBy,
      ticketsSold: ticketsSold ?? this.ticketsSold,
      maxTickets: maxTickets ?? this.maxTickets,
      friendsAttending: friendsAttending ?? this.friendsAttending,
      price: price ?? this.price,
      isPartnered: isPartnered ?? this.isPartnered,
      sport: sport ?? this.sport,
      totalPrize: totalPrize ?? this.totalPrize,
      location: location ?? this.location,
      isRecommended: isRecommended ?? this.isRecommended,
      mainImage: mainImage ?? this.mainImage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<int?>(eventId.value);
    }
    if (eventName.present) {
      map['event_name'] = Variable<String?>(eventName.value);
    }
    if (eventDateTime.present) {
      map['event_date_time'] = Variable<String?>(eventDateTime.value);
    }
    if (bookBy.present) {
      map['book_by'] = Variable<String?>(bookBy.value);
    }
    if (ticketsSold.present) {
      map['tickets_sold'] = Variable<int?>(ticketsSold.value);
    }
    if (maxTickets.present) {
      map['max_tickets'] = Variable<int?>(maxTickets.value);
    }
    if (friendsAttending.present) {
      map['friends_attending'] = Variable<int?>(friendsAttending.value);
    }
    if (price.present) {
      map['price'] = Variable<double?>(price.value);
    }
    if (isPartnered.present) {
      map['is_partnered'] = Variable<bool>(isPartnered.value);
    }
    if (sport.present) {
      map['sport'] = Variable<String?>(sport.value);
    }
    if (totalPrize.present) {
      map['total_prize'] = Variable<int?>(totalPrize.value);
    }
    if (location.present) {
      map['location'] = Variable<String?>(location.value);
    }
    if (isRecommended.present) {
      map['is_recommended'] = Variable<bool>(isRecommended.value);
    }
    if (mainImage.present) {
      map['main_image'] = Variable<String?>(mainImage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AllEventsCompanion(')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('eventName: $eventName, ')
          ..write('eventDateTime: $eventDateTime, ')
          ..write('bookBy: $bookBy, ')
          ..write('ticketsSold: $ticketsSold, ')
          ..write('maxTickets: $maxTickets, ')
          ..write('friendsAttending: $friendsAttending, ')
          ..write('price: $price, ')
          ..write('isPartnered: $isPartnered, ')
          ..write('sport: $sport, ')
          ..write('totalPrize: $totalPrize, ')
          ..write('location: $location, ')
          ..write('isRecommended: $isRecommended, ')
          ..write('mainImage: $mainImage')
          ..write(')'))
        .toString();
  }
}

class $AllEventsTable extends AllEvents
    with TableInfo<$AllEventsTable, AllEvent> {
  final GeneratedDatabase _db;
  final String? _alias;
  $AllEventsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _eventIdMeta = const VerificationMeta('eventId');
  late final GeneratedColumn<int?> eventId = GeneratedColumn<int?>(
      'event_id', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _eventNameMeta = const VerificationMeta('eventName');
  late final GeneratedColumn<String?> eventName = GeneratedColumn<String?>(
      'event_name', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _eventDateTimeMeta =
      const VerificationMeta('eventDateTime');
  late final GeneratedColumn<String?> eventDateTime = GeneratedColumn<String?>(
      'event_date_time', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _bookByMeta = const VerificationMeta('bookBy');
  late final GeneratedColumn<String?> bookBy = GeneratedColumn<String?>(
      'book_by', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _ticketsSoldMeta =
      const VerificationMeta('ticketsSold');
  late final GeneratedColumn<int?> ticketsSold = GeneratedColumn<int?>(
      'tickets_sold', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _maxTicketsMeta = const VerificationMeta('maxTickets');
  late final GeneratedColumn<int?> maxTickets = GeneratedColumn<int?>(
      'max_tickets', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _friendsAttendingMeta =
      const VerificationMeta('friendsAttending');
  late final GeneratedColumn<int?> friendsAttending = GeneratedColumn<int?>(
      'friends_attending', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _priceMeta = const VerificationMeta('price');
  late final GeneratedColumn<double?> price = GeneratedColumn<double?>(
      'price', aliasedName, true,
      typeName: 'REAL', requiredDuringInsert: false);
  final VerificationMeta _isPartneredMeta =
      const VerificationMeta('isPartnered');
  late final GeneratedColumn<bool?> isPartnered = GeneratedColumn<bool?>(
      'is_partnered', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_partnered IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _sportMeta = const VerificationMeta('sport');
  late final GeneratedColumn<String?> sport = GeneratedColumn<String?>(
      'sport', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _totalPrizeMeta = const VerificationMeta('totalPrize');
  late final GeneratedColumn<int?> totalPrize = GeneratedColumn<int?>(
      'total_prize', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _locationMeta = const VerificationMeta('location');
  late final GeneratedColumn<String?> location = GeneratedColumn<String?>(
      'location', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _isRecommendedMeta =
      const VerificationMeta('isRecommended');
  late final GeneratedColumn<bool?> isRecommended = GeneratedColumn<bool?>(
      'is_recommended', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_recommended IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _mainImageMeta = const VerificationMeta('mainImage');
  late final GeneratedColumn<String?> mainImage = GeneratedColumn<String?>(
      'main_image', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        eventId,
        eventName,
        eventDateTime,
        bookBy,
        ticketsSold,
        maxTickets,
        friendsAttending,
        price,
        isPartnered,
        sport,
        totalPrize,
        location,
        isRecommended,
        mainImage
      ];
  @override
  String get aliasedName => _alias ?? 'all_events';
  @override
  String get actualTableName => 'all_events';
  @override
  VerificationContext validateIntegrity(Insertable<AllEvent> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('event_id')) {
      context.handle(_eventIdMeta,
          eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta));
    }
    if (data.containsKey('event_name')) {
      context.handle(_eventNameMeta,
          eventName.isAcceptableOrUnknown(data['event_name']!, _eventNameMeta));
    }
    if (data.containsKey('event_date_time')) {
      context.handle(
          _eventDateTimeMeta,
          eventDateTime.isAcceptableOrUnknown(
              data['event_date_time']!, _eventDateTimeMeta));
    }
    if (data.containsKey('book_by')) {
      context.handle(_bookByMeta,
          bookBy.isAcceptableOrUnknown(data['book_by']!, _bookByMeta));
    }
    if (data.containsKey('tickets_sold')) {
      context.handle(
          _ticketsSoldMeta,
          ticketsSold.isAcceptableOrUnknown(
              data['tickets_sold']!, _ticketsSoldMeta));
    }
    if (data.containsKey('max_tickets')) {
      context.handle(
          _maxTicketsMeta,
          maxTickets.isAcceptableOrUnknown(
              data['max_tickets']!, _maxTicketsMeta));
    }
    if (data.containsKey('friends_attending')) {
      context.handle(
          _friendsAttendingMeta,
          friendsAttending.isAcceptableOrUnknown(
              data['friends_attending']!, _friendsAttendingMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    if (data.containsKey('is_partnered')) {
      context.handle(
          _isPartneredMeta,
          isPartnered.isAcceptableOrUnknown(
              data['is_partnered']!, _isPartneredMeta));
    }
    if (data.containsKey('sport')) {
      context.handle(
          _sportMeta, sport.isAcceptableOrUnknown(data['sport']!, _sportMeta));
    }
    if (data.containsKey('total_prize')) {
      context.handle(
          _totalPrizeMeta,
          totalPrize.isAcceptableOrUnknown(
              data['total_prize']!, _totalPrizeMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    if (data.containsKey('is_recommended')) {
      context.handle(
          _isRecommendedMeta,
          isRecommended.isAcceptableOrUnknown(
              data['is_recommended']!, _isRecommendedMeta));
    }
    if (data.containsKey('main_image')) {
      context.handle(_mainImageMeta,
          mainImage.isAcceptableOrUnknown(data['main_image']!, _mainImageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AllEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    return AllEvent.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AllEventsTable createAlias(String alias) {
    return $AllEventsTable(_db, alias);
  }
}

class EventDetail extends DataClass implements Insertable<EventDetail> {
  final String id;
  final int? eventId;
  final String? eventName;
  final String? eventDateTime;
  final String? bookBy;
  final int? ticketsSold;
  final int? maxTickets;
  final int? friendsAttending;
  final double? price;
  final bool isPartnered;
  final String? sport;
  final int? totalPrize;
  final String? location;
  final String? description;
  final String? venueInformation;
  final String? eventCreator;
  final String? teamInformation;
  final String? tags;
  final String? mainImage;
  EventDetail(
      {required this.id,
      this.eventId,
      this.eventName,
      this.eventDateTime,
      this.bookBy,
      this.ticketsSold,
      this.maxTickets,
      this.friendsAttending,
      this.price,
      required this.isPartnered,
      this.sport,
      this.totalPrize,
      this.location,
      this.description,
      this.venueInformation,
      this.eventCreator,
      this.teamInformation,
      this.tags,
      this.mainImage});
  factory EventDetail.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return EventDetail(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      eventId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}event_id']),
      eventName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}event_name']),
      eventDateTime: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}event_date_time']),
      bookBy: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}book_by']),
      ticketsSold: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tickets_sold']),
      maxTickets: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}max_tickets']),
      friendsAttending: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}friends_attending']),
      price: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}price']),
      isPartnered: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_partnered'])!,
      sport: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sport']),
      totalPrize: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total_prize']),
      location: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}location']),
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      venueInformation: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}venue_information']),
      eventCreator: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}event_creator']),
      teamInformation: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}team_information']),
      tags: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tags']),
      mainImage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}main_image']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || eventId != null) {
      map['event_id'] = Variable<int?>(eventId);
    }
    if (!nullToAbsent || eventName != null) {
      map['event_name'] = Variable<String?>(eventName);
    }
    if (!nullToAbsent || eventDateTime != null) {
      map['event_date_time'] = Variable<String?>(eventDateTime);
    }
    if (!nullToAbsent || bookBy != null) {
      map['book_by'] = Variable<String?>(bookBy);
    }
    if (!nullToAbsent || ticketsSold != null) {
      map['tickets_sold'] = Variable<int?>(ticketsSold);
    }
    if (!nullToAbsent || maxTickets != null) {
      map['max_tickets'] = Variable<int?>(maxTickets);
    }
    if (!nullToAbsent || friendsAttending != null) {
      map['friends_attending'] = Variable<int?>(friendsAttending);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double?>(price);
    }
    map['is_partnered'] = Variable<bool>(isPartnered);
    if (!nullToAbsent || sport != null) {
      map['sport'] = Variable<String?>(sport);
    }
    if (!nullToAbsent || totalPrize != null) {
      map['total_prize'] = Variable<int?>(totalPrize);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String?>(location);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    if (!nullToAbsent || venueInformation != null) {
      map['venue_information'] = Variable<String?>(venueInformation);
    }
    if (!nullToAbsent || eventCreator != null) {
      map['event_creator'] = Variable<String?>(eventCreator);
    }
    if (!nullToAbsent || teamInformation != null) {
      map['team_information'] = Variable<String?>(teamInformation);
    }
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String?>(tags);
    }
    if (!nullToAbsent || mainImage != null) {
      map['main_image'] = Variable<String?>(mainImage);
    }
    return map;
  }

  EventDetailsCompanion toCompanion(bool nullToAbsent) {
    return EventDetailsCompanion(
      id: Value(id),
      eventId: eventId == null && nullToAbsent
          ? const Value.absent()
          : Value(eventId),
      eventName: eventName == null && nullToAbsent
          ? const Value.absent()
          : Value(eventName),
      eventDateTime: eventDateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(eventDateTime),
      bookBy:
          bookBy == null && nullToAbsent ? const Value.absent() : Value(bookBy),
      ticketsSold: ticketsSold == null && nullToAbsent
          ? const Value.absent()
          : Value(ticketsSold),
      maxTickets: maxTickets == null && nullToAbsent
          ? const Value.absent()
          : Value(maxTickets),
      friendsAttending: friendsAttending == null && nullToAbsent
          ? const Value.absent()
          : Value(friendsAttending),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      isPartnered: Value(isPartnered),
      sport:
          sport == null && nullToAbsent ? const Value.absent() : Value(sport),
      totalPrize: totalPrize == null && nullToAbsent
          ? const Value.absent()
          : Value(totalPrize),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      venueInformation: venueInformation == null && nullToAbsent
          ? const Value.absent()
          : Value(venueInformation),
      eventCreator: eventCreator == null && nullToAbsent
          ? const Value.absent()
          : Value(eventCreator),
      teamInformation: teamInformation == null && nullToAbsent
          ? const Value.absent()
          : Value(teamInformation),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      mainImage: mainImage == null && nullToAbsent
          ? const Value.absent()
          : Value(mainImage),
    );
  }

  factory EventDetail.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return EventDetail(
      id: serializer.fromJson<String>(json['id']),
      eventId: serializer.fromJson<int?>(json['eventId']),
      eventName: serializer.fromJson<String?>(json['eventName']),
      eventDateTime: serializer.fromJson<String?>(json['eventDateTime']),
      bookBy: serializer.fromJson<String?>(json['bookBy']),
      ticketsSold: serializer.fromJson<int?>(json['ticketsSold']),
      maxTickets: serializer.fromJson<int?>(json['maxTickets']),
      friendsAttending: serializer.fromJson<int?>(json['friendsAttending']),
      price: serializer.fromJson<double?>(json['price']),
      isPartnered: serializer.fromJson<bool>(json['isPartnered']),
      sport: serializer.fromJson<String?>(json['sport']),
      totalPrize: serializer.fromJson<int?>(json['totalPrize']),
      location: serializer.fromJson<String?>(json['location']),
      description: serializer.fromJson<String?>(json['description']),
      venueInformation: serializer.fromJson<String?>(json['venueInformation']),
      eventCreator: serializer.fromJson<String?>(json['eventCreator']),
      teamInformation: serializer.fromJson<String?>(json['teamInformation']),
      tags: serializer.fromJson<String?>(json['tags']),
      mainImage: serializer.fromJson<String?>(json['mainImage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'eventId': serializer.toJson<int?>(eventId),
      'eventName': serializer.toJson<String?>(eventName),
      'eventDateTime': serializer.toJson<String?>(eventDateTime),
      'bookBy': serializer.toJson<String?>(bookBy),
      'ticketsSold': serializer.toJson<int?>(ticketsSold),
      'maxTickets': serializer.toJson<int?>(maxTickets),
      'friendsAttending': serializer.toJson<int?>(friendsAttending),
      'price': serializer.toJson<double?>(price),
      'isPartnered': serializer.toJson<bool>(isPartnered),
      'sport': serializer.toJson<String?>(sport),
      'totalPrize': serializer.toJson<int?>(totalPrize),
      'location': serializer.toJson<String?>(location),
      'description': serializer.toJson<String?>(description),
      'venueInformation': serializer.toJson<String?>(venueInformation),
      'eventCreator': serializer.toJson<String?>(eventCreator),
      'teamInformation': serializer.toJson<String?>(teamInformation),
      'tags': serializer.toJson<String?>(tags),
      'mainImage': serializer.toJson<String?>(mainImage),
    };
  }

  EventDetail copyWith(
          {String? id,
          int? eventId,
          String? eventName,
          String? eventDateTime,
          String? bookBy,
          int? ticketsSold,
          int? maxTickets,
          int? friendsAttending,
          double? price,
          bool? isPartnered,
          String? sport,
          int? totalPrize,
          String? location,
          String? description,
          String? venueInformation,
          String? eventCreator,
          String? teamInformation,
          String? tags,
          String? mainImage}) =>
      EventDetail(
        id: id ?? this.id,
        eventId: eventId ?? this.eventId,
        eventName: eventName ?? this.eventName,
        eventDateTime: eventDateTime ?? this.eventDateTime,
        bookBy: bookBy ?? this.bookBy,
        ticketsSold: ticketsSold ?? this.ticketsSold,
        maxTickets: maxTickets ?? this.maxTickets,
        friendsAttending: friendsAttending ?? this.friendsAttending,
        price: price ?? this.price,
        isPartnered: isPartnered ?? this.isPartnered,
        sport: sport ?? this.sport,
        totalPrize: totalPrize ?? this.totalPrize,
        location: location ?? this.location,
        description: description ?? this.description,
        venueInformation: venueInformation ?? this.venueInformation,
        eventCreator: eventCreator ?? this.eventCreator,
        teamInformation: teamInformation ?? this.teamInformation,
        tags: tags ?? this.tags,
        mainImage: mainImage ?? this.mainImage,
      );
  @override
  String toString() {
    return (StringBuffer('EventDetail(')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('eventName: $eventName, ')
          ..write('eventDateTime: $eventDateTime, ')
          ..write('bookBy: $bookBy, ')
          ..write('ticketsSold: $ticketsSold, ')
          ..write('maxTickets: $maxTickets, ')
          ..write('friendsAttending: $friendsAttending, ')
          ..write('price: $price, ')
          ..write('isPartnered: $isPartnered, ')
          ..write('sport: $sport, ')
          ..write('totalPrize: $totalPrize, ')
          ..write('location: $location, ')
          ..write('description: $description, ')
          ..write('venueInformation: $venueInformation, ')
          ..write('eventCreator: $eventCreator, ')
          ..write('teamInformation: $teamInformation, ')
          ..write('tags: $tags, ')
          ..write('mainImage: $mainImage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      eventId,
      eventName,
      eventDateTime,
      bookBy,
      ticketsSold,
      maxTickets,
      friendsAttending,
      price,
      isPartnered,
      sport,
      totalPrize,
      location,
      description,
      venueInformation,
      eventCreator,
      teamInformation,
      tags,
      mainImage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventDetail &&
          other.id == this.id &&
          other.eventId == this.eventId &&
          other.eventName == this.eventName &&
          other.eventDateTime == this.eventDateTime &&
          other.bookBy == this.bookBy &&
          other.ticketsSold == this.ticketsSold &&
          other.maxTickets == this.maxTickets &&
          other.friendsAttending == this.friendsAttending &&
          other.price == this.price &&
          other.isPartnered == this.isPartnered &&
          other.sport == this.sport &&
          other.totalPrize == this.totalPrize &&
          other.location == this.location &&
          other.description == this.description &&
          other.venueInformation == this.venueInformation &&
          other.eventCreator == this.eventCreator &&
          other.teamInformation == this.teamInformation &&
          other.tags == this.tags &&
          other.mainImage == this.mainImage);
}

class EventDetailsCompanion extends UpdateCompanion<EventDetail> {
  final Value<String> id;
  final Value<int?> eventId;
  final Value<String?> eventName;
  final Value<String?> eventDateTime;
  final Value<String?> bookBy;
  final Value<int?> ticketsSold;
  final Value<int?> maxTickets;
  final Value<int?> friendsAttending;
  final Value<double?> price;
  final Value<bool> isPartnered;
  final Value<String?> sport;
  final Value<int?> totalPrize;
  final Value<String?> location;
  final Value<String?> description;
  final Value<String?> venueInformation;
  final Value<String?> eventCreator;
  final Value<String?> teamInformation;
  final Value<String?> tags;
  final Value<String?> mainImage;
  const EventDetailsCompanion({
    this.id = const Value.absent(),
    this.eventId = const Value.absent(),
    this.eventName = const Value.absent(),
    this.eventDateTime = const Value.absent(),
    this.bookBy = const Value.absent(),
    this.ticketsSold = const Value.absent(),
    this.maxTickets = const Value.absent(),
    this.friendsAttending = const Value.absent(),
    this.price = const Value.absent(),
    this.isPartnered = const Value.absent(),
    this.sport = const Value.absent(),
    this.totalPrize = const Value.absent(),
    this.location = const Value.absent(),
    this.description = const Value.absent(),
    this.venueInformation = const Value.absent(),
    this.eventCreator = const Value.absent(),
    this.teamInformation = const Value.absent(),
    this.tags = const Value.absent(),
    this.mainImage = const Value.absent(),
  });
  EventDetailsCompanion.insert({
    required String id,
    this.eventId = const Value.absent(),
    this.eventName = const Value.absent(),
    this.eventDateTime = const Value.absent(),
    this.bookBy = const Value.absent(),
    this.ticketsSold = const Value.absent(),
    this.maxTickets = const Value.absent(),
    this.friendsAttending = const Value.absent(),
    this.price = const Value.absent(),
    this.isPartnered = const Value.absent(),
    this.sport = const Value.absent(),
    this.totalPrize = const Value.absent(),
    this.location = const Value.absent(),
    this.description = const Value.absent(),
    this.venueInformation = const Value.absent(),
    this.eventCreator = const Value.absent(),
    this.teamInformation = const Value.absent(),
    this.tags = const Value.absent(),
    this.mainImage = const Value.absent(),
  }) : id = Value(id);
  static Insertable<EventDetail> custom({
    Expression<String>? id,
    Expression<int?>? eventId,
    Expression<String?>? eventName,
    Expression<String?>? eventDateTime,
    Expression<String?>? bookBy,
    Expression<int?>? ticketsSold,
    Expression<int?>? maxTickets,
    Expression<int?>? friendsAttending,
    Expression<double?>? price,
    Expression<bool>? isPartnered,
    Expression<String?>? sport,
    Expression<int?>? totalPrize,
    Expression<String?>? location,
    Expression<String?>? description,
    Expression<String?>? venueInformation,
    Expression<String?>? eventCreator,
    Expression<String?>? teamInformation,
    Expression<String?>? tags,
    Expression<String?>? mainImage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (eventId != null) 'event_id': eventId,
      if (eventName != null) 'event_name': eventName,
      if (eventDateTime != null) 'event_date_time': eventDateTime,
      if (bookBy != null) 'book_by': bookBy,
      if (ticketsSold != null) 'tickets_sold': ticketsSold,
      if (maxTickets != null) 'max_tickets': maxTickets,
      if (friendsAttending != null) 'friends_attending': friendsAttending,
      if (price != null) 'price': price,
      if (isPartnered != null) 'is_partnered': isPartnered,
      if (sport != null) 'sport': sport,
      if (totalPrize != null) 'total_prize': totalPrize,
      if (location != null) 'location': location,
      if (description != null) 'description': description,
      if (venueInformation != null) 'venue_information': venueInformation,
      if (eventCreator != null) 'event_creator': eventCreator,
      if (teamInformation != null) 'team_information': teamInformation,
      if (tags != null) 'tags': tags,
      if (mainImage != null) 'main_image': mainImage,
    });
  }

  EventDetailsCompanion copyWith(
      {Value<String>? id,
      Value<int?>? eventId,
      Value<String?>? eventName,
      Value<String?>? eventDateTime,
      Value<String?>? bookBy,
      Value<int?>? ticketsSold,
      Value<int?>? maxTickets,
      Value<int?>? friendsAttending,
      Value<double?>? price,
      Value<bool>? isPartnered,
      Value<String?>? sport,
      Value<int?>? totalPrize,
      Value<String?>? location,
      Value<String?>? description,
      Value<String?>? venueInformation,
      Value<String?>? eventCreator,
      Value<String?>? teamInformation,
      Value<String?>? tags,
      Value<String?>? mainImage}) {
    return EventDetailsCompanion(
      id: id ?? this.id,
      eventId: eventId ?? this.eventId,
      eventName: eventName ?? this.eventName,
      eventDateTime: eventDateTime ?? this.eventDateTime,
      bookBy: bookBy ?? this.bookBy,
      ticketsSold: ticketsSold ?? this.ticketsSold,
      maxTickets: maxTickets ?? this.maxTickets,
      friendsAttending: friendsAttending ?? this.friendsAttending,
      price: price ?? this.price,
      isPartnered: isPartnered ?? this.isPartnered,
      sport: sport ?? this.sport,
      totalPrize: totalPrize ?? this.totalPrize,
      location: location ?? this.location,
      description: description ?? this.description,
      venueInformation: venueInformation ?? this.venueInformation,
      eventCreator: eventCreator ?? this.eventCreator,
      teamInformation: teamInformation ?? this.teamInformation,
      tags: tags ?? this.tags,
      mainImage: mainImage ?? this.mainImage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<int?>(eventId.value);
    }
    if (eventName.present) {
      map['event_name'] = Variable<String?>(eventName.value);
    }
    if (eventDateTime.present) {
      map['event_date_time'] = Variable<String?>(eventDateTime.value);
    }
    if (bookBy.present) {
      map['book_by'] = Variable<String?>(bookBy.value);
    }
    if (ticketsSold.present) {
      map['tickets_sold'] = Variable<int?>(ticketsSold.value);
    }
    if (maxTickets.present) {
      map['max_tickets'] = Variable<int?>(maxTickets.value);
    }
    if (friendsAttending.present) {
      map['friends_attending'] = Variable<int?>(friendsAttending.value);
    }
    if (price.present) {
      map['price'] = Variable<double?>(price.value);
    }
    if (isPartnered.present) {
      map['is_partnered'] = Variable<bool>(isPartnered.value);
    }
    if (sport.present) {
      map['sport'] = Variable<String?>(sport.value);
    }
    if (totalPrize.present) {
      map['total_prize'] = Variable<int?>(totalPrize.value);
    }
    if (location.present) {
      map['location'] = Variable<String?>(location.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    if (venueInformation.present) {
      map['venue_information'] = Variable<String?>(venueInformation.value);
    }
    if (eventCreator.present) {
      map['event_creator'] = Variable<String?>(eventCreator.value);
    }
    if (teamInformation.present) {
      map['team_information'] = Variable<String?>(teamInformation.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String?>(tags.value);
    }
    if (mainImage.present) {
      map['main_image'] = Variable<String?>(mainImage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventDetailsCompanion(')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('eventName: $eventName, ')
          ..write('eventDateTime: $eventDateTime, ')
          ..write('bookBy: $bookBy, ')
          ..write('ticketsSold: $ticketsSold, ')
          ..write('maxTickets: $maxTickets, ')
          ..write('friendsAttending: $friendsAttending, ')
          ..write('price: $price, ')
          ..write('isPartnered: $isPartnered, ')
          ..write('sport: $sport, ')
          ..write('totalPrize: $totalPrize, ')
          ..write('location: $location, ')
          ..write('description: $description, ')
          ..write('venueInformation: $venueInformation, ')
          ..write('eventCreator: $eventCreator, ')
          ..write('teamInformation: $teamInformation, ')
          ..write('tags: $tags, ')
          ..write('mainImage: $mainImage')
          ..write(')'))
        .toString();
  }
}

class $EventDetailsTable extends EventDetails
    with TableInfo<$EventDetailsTable, EventDetail> {
  final GeneratedDatabase _db;
  final String? _alias;
  $EventDetailsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _eventIdMeta = const VerificationMeta('eventId');
  late final GeneratedColumn<int?> eventId = GeneratedColumn<int?>(
      'event_id', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _eventNameMeta = const VerificationMeta('eventName');
  late final GeneratedColumn<String?> eventName = GeneratedColumn<String?>(
      'event_name', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _eventDateTimeMeta =
      const VerificationMeta('eventDateTime');
  late final GeneratedColumn<String?> eventDateTime = GeneratedColumn<String?>(
      'event_date_time', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _bookByMeta = const VerificationMeta('bookBy');
  late final GeneratedColumn<String?> bookBy = GeneratedColumn<String?>(
      'book_by', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _ticketsSoldMeta =
      const VerificationMeta('ticketsSold');
  late final GeneratedColumn<int?> ticketsSold = GeneratedColumn<int?>(
      'tickets_sold', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _maxTicketsMeta = const VerificationMeta('maxTickets');
  late final GeneratedColumn<int?> maxTickets = GeneratedColumn<int?>(
      'max_tickets', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _friendsAttendingMeta =
      const VerificationMeta('friendsAttending');
  late final GeneratedColumn<int?> friendsAttending = GeneratedColumn<int?>(
      'friends_attending', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _priceMeta = const VerificationMeta('price');
  late final GeneratedColumn<double?> price = GeneratedColumn<double?>(
      'price', aliasedName, true,
      typeName: 'REAL', requiredDuringInsert: false);
  final VerificationMeta _isPartneredMeta =
      const VerificationMeta('isPartnered');
  late final GeneratedColumn<bool?> isPartnered = GeneratedColumn<bool?>(
      'is_partnered', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_partnered IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _sportMeta = const VerificationMeta('sport');
  late final GeneratedColumn<String?> sport = GeneratedColumn<String?>(
      'sport', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _totalPrizeMeta = const VerificationMeta('totalPrize');
  late final GeneratedColumn<int?> totalPrize = GeneratedColumn<int?>(
      'total_prize', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _locationMeta = const VerificationMeta('location');
  late final GeneratedColumn<String?> location = GeneratedColumn<String?>(
      'location', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _venueInformationMeta =
      const VerificationMeta('venueInformation');
  late final GeneratedColumn<String?> venueInformation =
      GeneratedColumn<String?>('venue_information', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _eventCreatorMeta =
      const VerificationMeta('eventCreator');
  late final GeneratedColumn<String?> eventCreator = GeneratedColumn<String?>(
      'event_creator', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _teamInformationMeta =
      const VerificationMeta('teamInformation');
  late final GeneratedColumn<String?> teamInformation =
      GeneratedColumn<String?>('team_information', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _tagsMeta = const VerificationMeta('tags');
  late final GeneratedColumn<String?> tags = GeneratedColumn<String?>(
      'tags', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _mainImageMeta = const VerificationMeta('mainImage');
  late final GeneratedColumn<String?> mainImage = GeneratedColumn<String?>(
      'main_image', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        eventId,
        eventName,
        eventDateTime,
        bookBy,
        ticketsSold,
        maxTickets,
        friendsAttending,
        price,
        isPartnered,
        sport,
        totalPrize,
        location,
        description,
        venueInformation,
        eventCreator,
        teamInformation,
        tags,
        mainImage
      ];
  @override
  String get aliasedName => _alias ?? 'event_details';
  @override
  String get actualTableName => 'event_details';
  @override
  VerificationContext validateIntegrity(Insertable<EventDetail> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('event_id')) {
      context.handle(_eventIdMeta,
          eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta));
    }
    if (data.containsKey('event_name')) {
      context.handle(_eventNameMeta,
          eventName.isAcceptableOrUnknown(data['event_name']!, _eventNameMeta));
    }
    if (data.containsKey('event_date_time')) {
      context.handle(
          _eventDateTimeMeta,
          eventDateTime.isAcceptableOrUnknown(
              data['event_date_time']!, _eventDateTimeMeta));
    }
    if (data.containsKey('book_by')) {
      context.handle(_bookByMeta,
          bookBy.isAcceptableOrUnknown(data['book_by']!, _bookByMeta));
    }
    if (data.containsKey('tickets_sold')) {
      context.handle(
          _ticketsSoldMeta,
          ticketsSold.isAcceptableOrUnknown(
              data['tickets_sold']!, _ticketsSoldMeta));
    }
    if (data.containsKey('max_tickets')) {
      context.handle(
          _maxTicketsMeta,
          maxTickets.isAcceptableOrUnknown(
              data['max_tickets']!, _maxTicketsMeta));
    }
    if (data.containsKey('friends_attending')) {
      context.handle(
          _friendsAttendingMeta,
          friendsAttending.isAcceptableOrUnknown(
              data['friends_attending']!, _friendsAttendingMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    if (data.containsKey('is_partnered')) {
      context.handle(
          _isPartneredMeta,
          isPartnered.isAcceptableOrUnknown(
              data['is_partnered']!, _isPartneredMeta));
    }
    if (data.containsKey('sport')) {
      context.handle(
          _sportMeta, sport.isAcceptableOrUnknown(data['sport']!, _sportMeta));
    }
    if (data.containsKey('total_prize')) {
      context.handle(
          _totalPrizeMeta,
          totalPrize.isAcceptableOrUnknown(
              data['total_prize']!, _totalPrizeMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('venue_information')) {
      context.handle(
          _venueInformationMeta,
          venueInformation.isAcceptableOrUnknown(
              data['venue_information']!, _venueInformationMeta));
    }
    if (data.containsKey('event_creator')) {
      context.handle(
          _eventCreatorMeta,
          eventCreator.isAcceptableOrUnknown(
              data['event_creator']!, _eventCreatorMeta));
    }
    if (data.containsKey('team_information')) {
      context.handle(
          _teamInformationMeta,
          teamInformation.isAcceptableOrUnknown(
              data['team_information']!, _teamInformationMeta));
    }
    if (data.containsKey('tags')) {
      context.handle(
          _tagsMeta, tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta));
    }
    if (data.containsKey('main_image')) {
      context.handle(_mainImageMeta,
          mainImage.isAcceptableOrUnknown(data['main_image']!, _mainImageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EventDetail map(Map<String, dynamic> data, {String? tablePrefix}) {
    return EventDetail.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $EventDetailsTable createAlias(String alias) {
    return $EventDetailsTable(_db, alias);
  }
}

class Checkout extends DataClass implements Insertable<Checkout> {
  final String id;
  final int? eventId;
  final String? eventName;
  final String? eventDateTime;
  final double? price;
  final bool isPrivate;
  final String? location;
  final String? gameLength;
  final String? paymentMethodUnsupported;
  final String? mainImage;
  Checkout(
      {required this.id,
      this.eventId,
      this.eventName,
      this.eventDateTime,
      this.price,
      required this.isPrivate,
      this.location,
      this.gameLength,
      this.paymentMethodUnsupported,
      this.mainImage});
  factory Checkout.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Checkout(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      eventId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}event_id']),
      eventName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}event_name']),
      eventDateTime: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}event_date_time']),
      price: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}price']),
      isPrivate: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_private'])!,
      location: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}location']),
      gameLength: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}game_length']),
      paymentMethodUnsupported: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}payment_method_unsupported']),
      mainImage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}main_image']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || eventId != null) {
      map['event_id'] = Variable<int?>(eventId);
    }
    if (!nullToAbsent || eventName != null) {
      map['event_name'] = Variable<String?>(eventName);
    }
    if (!nullToAbsent || eventDateTime != null) {
      map['event_date_time'] = Variable<String?>(eventDateTime);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double?>(price);
    }
    map['is_private'] = Variable<bool>(isPrivate);
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String?>(location);
    }
    if (!nullToAbsent || gameLength != null) {
      map['game_length'] = Variable<String?>(gameLength);
    }
    if (!nullToAbsent || paymentMethodUnsupported != null) {
      map['payment_method_unsupported'] =
          Variable<String?>(paymentMethodUnsupported);
    }
    if (!nullToAbsent || mainImage != null) {
      map['main_image'] = Variable<String?>(mainImage);
    }
    return map;
  }

  CheckoutsCompanion toCompanion(bool nullToAbsent) {
    return CheckoutsCompanion(
      id: Value(id),
      eventId: eventId == null && nullToAbsent
          ? const Value.absent()
          : Value(eventId),
      eventName: eventName == null && nullToAbsent
          ? const Value.absent()
          : Value(eventName),
      eventDateTime: eventDateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(eventDateTime),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      isPrivate: Value(isPrivate),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      gameLength: gameLength == null && nullToAbsent
          ? const Value.absent()
          : Value(gameLength),
      paymentMethodUnsupported: paymentMethodUnsupported == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentMethodUnsupported),
      mainImage: mainImage == null && nullToAbsent
          ? const Value.absent()
          : Value(mainImage),
    );
  }

  factory Checkout.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Checkout(
      id: serializer.fromJson<String>(json['id']),
      eventId: serializer.fromJson<int?>(json['eventId']),
      eventName: serializer.fromJson<String?>(json['eventName']),
      eventDateTime: serializer.fromJson<String?>(json['eventDateTime']),
      price: serializer.fromJson<double?>(json['price']),
      isPrivate: serializer.fromJson<bool>(json['isPrivate']),
      location: serializer.fromJson<String?>(json['location']),
      gameLength: serializer.fromJson<String?>(json['gameLength']),
      paymentMethodUnsupported:
          serializer.fromJson<String?>(json['paymentMethodUnsupported']),
      mainImage: serializer.fromJson<String?>(json['mainImage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'eventId': serializer.toJson<int?>(eventId),
      'eventName': serializer.toJson<String?>(eventName),
      'eventDateTime': serializer.toJson<String?>(eventDateTime),
      'price': serializer.toJson<double?>(price),
      'isPrivate': serializer.toJson<bool>(isPrivate),
      'location': serializer.toJson<String?>(location),
      'gameLength': serializer.toJson<String?>(gameLength),
      'paymentMethodUnsupported':
          serializer.toJson<String?>(paymentMethodUnsupported),
      'mainImage': serializer.toJson<String?>(mainImage),
    };
  }

  Checkout copyWith(
          {String? id,
          int? eventId,
          String? eventName,
          String? eventDateTime,
          double? price,
          bool? isPrivate,
          String? location,
          String? gameLength,
          String? paymentMethodUnsupported,
          String? mainImage}) =>
      Checkout(
        id: id ?? this.id,
        eventId: eventId ?? this.eventId,
        eventName: eventName ?? this.eventName,
        eventDateTime: eventDateTime ?? this.eventDateTime,
        price: price ?? this.price,
        isPrivate: isPrivate ?? this.isPrivate,
        location: location ?? this.location,
        gameLength: gameLength ?? this.gameLength,
        paymentMethodUnsupported:
            paymentMethodUnsupported ?? this.paymentMethodUnsupported,
        mainImage: mainImage ?? this.mainImage,
      );
  @override
  String toString() {
    return (StringBuffer('Checkout(')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('eventName: $eventName, ')
          ..write('eventDateTime: $eventDateTime, ')
          ..write('price: $price, ')
          ..write('isPrivate: $isPrivate, ')
          ..write('location: $location, ')
          ..write('gameLength: $gameLength, ')
          ..write('paymentMethodUnsupported: $paymentMethodUnsupported, ')
          ..write('mainImage: $mainImage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, eventId, eventName, eventDateTime, price,
      isPrivate, location, gameLength, paymentMethodUnsupported, mainImage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Checkout &&
          other.id == this.id &&
          other.eventId == this.eventId &&
          other.eventName == this.eventName &&
          other.eventDateTime == this.eventDateTime &&
          other.price == this.price &&
          other.isPrivate == this.isPrivate &&
          other.location == this.location &&
          other.gameLength == this.gameLength &&
          other.paymentMethodUnsupported == this.paymentMethodUnsupported &&
          other.mainImage == this.mainImage);
}

class CheckoutsCompanion extends UpdateCompanion<Checkout> {
  final Value<String> id;
  final Value<int?> eventId;
  final Value<String?> eventName;
  final Value<String?> eventDateTime;
  final Value<double?> price;
  final Value<bool> isPrivate;
  final Value<String?> location;
  final Value<String?> gameLength;
  final Value<String?> paymentMethodUnsupported;
  final Value<String?> mainImage;
  const CheckoutsCompanion({
    this.id = const Value.absent(),
    this.eventId = const Value.absent(),
    this.eventName = const Value.absent(),
    this.eventDateTime = const Value.absent(),
    this.price = const Value.absent(),
    this.isPrivate = const Value.absent(),
    this.location = const Value.absent(),
    this.gameLength = const Value.absent(),
    this.paymentMethodUnsupported = const Value.absent(),
    this.mainImage = const Value.absent(),
  });
  CheckoutsCompanion.insert({
    required String id,
    this.eventId = const Value.absent(),
    this.eventName = const Value.absent(),
    this.eventDateTime = const Value.absent(),
    this.price = const Value.absent(),
    this.isPrivate = const Value.absent(),
    this.location = const Value.absent(),
    this.gameLength = const Value.absent(),
    this.paymentMethodUnsupported = const Value.absent(),
    this.mainImage = const Value.absent(),
  }) : id = Value(id);
  static Insertable<Checkout> custom({
    Expression<String>? id,
    Expression<int?>? eventId,
    Expression<String?>? eventName,
    Expression<String?>? eventDateTime,
    Expression<double?>? price,
    Expression<bool>? isPrivate,
    Expression<String?>? location,
    Expression<String?>? gameLength,
    Expression<String?>? paymentMethodUnsupported,
    Expression<String?>? mainImage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (eventId != null) 'event_id': eventId,
      if (eventName != null) 'event_name': eventName,
      if (eventDateTime != null) 'event_date_time': eventDateTime,
      if (price != null) 'price': price,
      if (isPrivate != null) 'is_private': isPrivate,
      if (location != null) 'location': location,
      if (gameLength != null) 'game_length': gameLength,
      if (paymentMethodUnsupported != null)
        'payment_method_unsupported': paymentMethodUnsupported,
      if (mainImage != null) 'main_image': mainImage,
    });
  }

  CheckoutsCompanion copyWith(
      {Value<String>? id,
      Value<int?>? eventId,
      Value<String?>? eventName,
      Value<String?>? eventDateTime,
      Value<double?>? price,
      Value<bool>? isPrivate,
      Value<String?>? location,
      Value<String?>? gameLength,
      Value<String?>? paymentMethodUnsupported,
      Value<String?>? mainImage}) {
    return CheckoutsCompanion(
      id: id ?? this.id,
      eventId: eventId ?? this.eventId,
      eventName: eventName ?? this.eventName,
      eventDateTime: eventDateTime ?? this.eventDateTime,
      price: price ?? this.price,
      isPrivate: isPrivate ?? this.isPrivate,
      location: location ?? this.location,
      gameLength: gameLength ?? this.gameLength,
      paymentMethodUnsupported:
          paymentMethodUnsupported ?? this.paymentMethodUnsupported,
      mainImage: mainImage ?? this.mainImage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<int?>(eventId.value);
    }
    if (eventName.present) {
      map['event_name'] = Variable<String?>(eventName.value);
    }
    if (eventDateTime.present) {
      map['event_date_time'] = Variable<String?>(eventDateTime.value);
    }
    if (price.present) {
      map['price'] = Variable<double?>(price.value);
    }
    if (isPrivate.present) {
      map['is_private'] = Variable<bool>(isPrivate.value);
    }
    if (location.present) {
      map['location'] = Variable<String?>(location.value);
    }
    if (gameLength.present) {
      map['game_length'] = Variable<String?>(gameLength.value);
    }
    if (paymentMethodUnsupported.present) {
      map['payment_method_unsupported'] =
          Variable<String?>(paymentMethodUnsupported.value);
    }
    if (mainImage.present) {
      map['main_image'] = Variable<String?>(mainImage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CheckoutsCompanion(')
          ..write('id: $id, ')
          ..write('eventId: $eventId, ')
          ..write('eventName: $eventName, ')
          ..write('eventDateTime: $eventDateTime, ')
          ..write('price: $price, ')
          ..write('isPrivate: $isPrivate, ')
          ..write('location: $location, ')
          ..write('gameLength: $gameLength, ')
          ..write('paymentMethodUnsupported: $paymentMethodUnsupported, ')
          ..write('mainImage: $mainImage')
          ..write(')'))
        .toString();
  }
}

class $CheckoutsTable extends Checkouts
    with TableInfo<$CheckoutsTable, Checkout> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CheckoutsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _eventIdMeta = const VerificationMeta('eventId');
  late final GeneratedColumn<int?> eventId = GeneratedColumn<int?>(
      'event_id', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _eventNameMeta = const VerificationMeta('eventName');
  late final GeneratedColumn<String?> eventName = GeneratedColumn<String?>(
      'event_name', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _eventDateTimeMeta =
      const VerificationMeta('eventDateTime');
  late final GeneratedColumn<String?> eventDateTime = GeneratedColumn<String?>(
      'event_date_time', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _priceMeta = const VerificationMeta('price');
  late final GeneratedColumn<double?> price = GeneratedColumn<double?>(
      'price', aliasedName, true,
      typeName: 'REAL', requiredDuringInsert: false);
  final VerificationMeta _isPrivateMeta = const VerificationMeta('isPrivate');
  late final GeneratedColumn<bool?> isPrivate = GeneratedColumn<bool?>(
      'is_private', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_private IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _locationMeta = const VerificationMeta('location');
  late final GeneratedColumn<String?> location = GeneratedColumn<String?>(
      'location', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _gameLengthMeta = const VerificationMeta('gameLength');
  late final GeneratedColumn<String?> gameLength = GeneratedColumn<String?>(
      'game_length', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _paymentMethodUnsupportedMeta =
      const VerificationMeta('paymentMethodUnsupported');
  late final GeneratedColumn<String?> paymentMethodUnsupported =
      GeneratedColumn<String?>('payment_method_unsupported', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _mainImageMeta = const VerificationMeta('mainImage');
  late final GeneratedColumn<String?> mainImage = GeneratedColumn<String?>(
      'main_image', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        eventId,
        eventName,
        eventDateTime,
        price,
        isPrivate,
        location,
        gameLength,
        paymentMethodUnsupported,
        mainImage
      ];
  @override
  String get aliasedName => _alias ?? 'checkouts';
  @override
  String get actualTableName => 'checkouts';
  @override
  VerificationContext validateIntegrity(Insertable<Checkout> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('event_id')) {
      context.handle(_eventIdMeta,
          eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta));
    }
    if (data.containsKey('event_name')) {
      context.handle(_eventNameMeta,
          eventName.isAcceptableOrUnknown(data['event_name']!, _eventNameMeta));
    }
    if (data.containsKey('event_date_time')) {
      context.handle(
          _eventDateTimeMeta,
          eventDateTime.isAcceptableOrUnknown(
              data['event_date_time']!, _eventDateTimeMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    if (data.containsKey('is_private')) {
      context.handle(_isPrivateMeta,
          isPrivate.isAcceptableOrUnknown(data['is_private']!, _isPrivateMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    if (data.containsKey('game_length')) {
      context.handle(
          _gameLengthMeta,
          gameLength.isAcceptableOrUnknown(
              data['game_length']!, _gameLengthMeta));
    }
    if (data.containsKey('payment_method_unsupported')) {
      context.handle(
          _paymentMethodUnsupportedMeta,
          paymentMethodUnsupported.isAcceptableOrUnknown(
              data['payment_method_unsupported']!,
              _paymentMethodUnsupportedMeta));
    }
    if (data.containsKey('main_image')) {
      context.handle(_mainImageMeta,
          mainImage.isAcceptableOrUnknown(data['main_image']!, _mainImageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Checkout map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Checkout.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CheckoutsTable createAlias(String alias) {
    return $CheckoutsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $AllEventsTable allEvents = $AllEventsTable(this);
  late final $EventDetailsTable eventDetails = $EventDetailsTable(this);
  late final $CheckoutsTable checkouts = $CheckoutsTable(this);
  late final AllEventsDao allEventsDao = AllEventsDao(this as AppDatabase);
  late final EventDetailsDao eventDetailsDao =
      EventDetailsDao(this as AppDatabase);
  late final CheckoutsDao checkoutsDao = CheckoutsDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [allEvents, eventDetails, checkouts];
}
