import 'package:tech_alchemy/dao/app_database.dart';
import 'package:tech_alchemy/provider/events/events_repository.dart';
import 'package:tech_alchemy/service/events/event_service.dart';

EventRepository provideEventRepository() {
  return EventRepository(
    eventServices: EventServices(),
    allEventsDao: provideAppDatabase().allEventsDao,
    eventDetailsDao: provideAppDatabase().eventDetailsDao,
    checkoutsDao: provideAppDatabase().checkoutsDao,
  );
}

AppDatabase provideAppDatabase() {
  return AppDatabase.instance();
}
