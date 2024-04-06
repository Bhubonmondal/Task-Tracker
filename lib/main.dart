import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:task_tracker2/path_provider_helper.dart';
import 'package:task_tracker2/show_task.dart';

void main() async {
  //Hive intilize
  await Hive.initFlutter();

  //create hive box
  await Hive.openBox('title'); // For storing task title
  await Hive.openBox('description'); // For storing task description
  await Hive.openBox('timing');  // For storing task when stored
  await Hive.openBox('track_complete_orNot'); // For checking previously complete or not
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> PathHelper()) // path provider
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(),
          useMaterial3: true,
        ),
        home: const ShowTask(title: 'Task Tracker'), // first page, home page, begin page
        debugShowCheckedModeBanner: false, //banner off
      ),
    );
  }
}
