import 'package:tech_alchemy/bloc/events/events_bloc.dart';
import 'package:tech_alchemy/provider/repository_provider.dart';

EventsBloc provideEventsBloc() {
  return EventsBloc(
    eventRepository: provideEventRepository(),
  );
}
