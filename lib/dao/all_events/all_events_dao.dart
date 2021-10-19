import 'package:moor_flutter/moor_flutter.dart';
import 'package:tech_alchemy/dao/app_database.dart';

part 'all_events_dao.g.dart';

@UseDao(
  tables: [AllEvents],
)
class AllEventsDao extends DatabaseAccessor<AppDatabase>
    with _$AllEventsDaoMixin {
  AllEventsDao(AppDatabase db) : super(db);

  // Future<void> saveReport(OpenReport openReport) {
  //   return batch((batch) {
  //     batch.insert(
  //       openReports,
  //       openReport,
  //       mode: InsertMode.insertOrReplace,
  //     );
  //   });
  // }

  Future<void> saveEvents(List<AllEvent> entries) {
    return batch((batch) {
      batch.insertAll(
        allEvents,
        entries,
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Future<AllEvent> getEvent(int id) {
    return (select(allEvents)..where((event) => event.eventId.equals(id)))
        .getSingle();
  }

  Future<List<AllEvent>> getRecommendedEvent() {
    return (select(allEvents)..where((event) => event.isRecommended.equals(true)))
        .get();
  }

  Future<List<AllEvent>> getSimilarEvent(String sports) {
    return (select(allEvents)..where((event) => event.sport.equals(sports)))
        .get();
  }

  Future<List<AllEvent>> getAllEvents() {
    return (select(allEvents)).get();
  }

  Future getDeleteAllDelete() {
    return (delete(allEvents)).go();
  }

  Stream<List<AllEvent>> watchAllEvents(List<String> statusList) {
    return (select(allEvents)).watch();
  }
}

class AllEvents extends Table {
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

  BoolColumn get isRecommended =>
      boolean().withDefault(const Constant(false))();

  TextColumn get mainImage => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
