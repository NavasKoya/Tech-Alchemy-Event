import 'package:moor_flutter/moor_flutter.dart';
import 'package:tech_alchemy/dao/app_database.dart';

part 'event_details_dao.g.dart';

@UseDao(
  tables: [EventDetails],
)
class EventDetailsDao extends DatabaseAccessor<AppDatabase>
    with _$EventDetailsDaoMixin {
  EventDetailsDao(AppDatabase db) : super(db);

  // Future<void> saveReport(OpenReport openReport) {
  //   return batch((batch) {
  //     batch.insert(
  //       openReports,
  //       openReport,
  //       mode: InsertMode.insertOrReplace,
  //     );
  //   });
  // }

  Future<void> saveEventDetails(List<EventDetail> entries) {
    return batch((batch) {
      batch.insertAll(
        eventDetails,
        entries,
        mode: InsertMode.insertOrReplace,
      );
    });
  }
  Future<EventDetail> getEvent(int id) {
    return (select(eventDetails)..where((event) => event.eventId.equals(id)))
        .getSingle();
  }

  Future<List<EventDetail>> getAllEvents() {
    return (select(eventDetails))
        .get();
  }

  Future getDeleteAllEvents(List<String> statusList) {
    return (delete(eventDetails))
        .go();
  }

  Stream<List<EventDetail>> watchAllEvents(List<String> statusList) {
    return (select(eventDetails))
        .watch();
  }
}

class EventDetails extends Table {
  TextColumn get id => text()();

  IntColumn get eventId => integer().nullable()();

  TextColumn get eventName => text().nullable()();

  TextColumn get eventDateTime => text().nullable()();

  TextColumn get bookBy => text().nullable()();

  IntColumn get ticketsSold => integer().nullable()();

  IntColumn get maxTickets => integer().nullable()();

  IntColumn get friendsAttending => integer().nullable()();

  RealColumn get price => real().nullable()();

  BoolColumn get isPartnered => boolean().withDefault(const Constant(false))();

  TextColumn get sport => text().nullable()();

  IntColumn get totalPrize => integer().nullable()();

  TextColumn get location => text().nullable()();

  TextColumn get description => text().nullable()();

  TextColumn get venueInformation => text().nullable()();

  TextColumn get eventCreator => text().nullable()();

  TextColumn get teamInformation => text().nullable()();

  TextColumn get tags => text().nullable()();

  TextColumn get mainImage => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
