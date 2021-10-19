import 'package:moor_flutter/moor_flutter.dart';
import 'package:tech_alchemy/dao/all_events/all_events_dao.dart';
import 'package:tech_alchemy/dao/checkout/checkout_dao.dart';
import 'package:tech_alchemy/dao/event_details/event_details_dao.dart';

part 'app_database.g.dart';

@UseMoor(
  tables: [
    AllEvents,
    EventDetails,
    Checkouts
  ],
  daos: [
    AllEventsDao,
    EventDetailsDao,
    CheckoutsDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(
          FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite',
            logStatements: false,
          ),
        );

  static AppDatabase? _instance;

  factory AppDatabase.instance() {
    return _instance ??= AppDatabase();
  }

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 17;
}
