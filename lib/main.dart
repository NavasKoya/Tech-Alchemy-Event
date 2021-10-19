import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_alchemy/bloc/events/events_bloc.dart';
import 'package:tech_alchemy/pages/home_page.dart';
import 'package:tech_alchemy/provider/repository_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<EventsBloc>(
      create: (_) => EventsBloc(
        eventRepository: provideEventRepository(),
      ),
      child: MaterialApp(
        title: 'Tech Alchemy',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

