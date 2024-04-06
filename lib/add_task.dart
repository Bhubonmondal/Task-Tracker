import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_tracker2/my_widgets/my_textfield.dart';
import 'package:task_tracker2/path_provider_helper.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PathHelper>(builder: (BuildContext context, PathHelperX, Widget? child) =>
      Scaffold(
        appBar: AppBar( actions: [IconButton(onPressed: (){ PathHelperX.addTask(context); }, icon:  Icon(Icons.check))]),///ADD Task Button

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14), // Padding around two textfield
          child: Column(
            children: [
              //Title
              MyTextField(text: 'Task Title', autoFocus: true, maxlines: 1, Controller: PathHelperX.taskTitleController,),
              //Desc
              Expanded(child: MyTextField(text: 'Task Description', border: InputBorder.none, maxlines: null, autoFocus: false, Controller: PathHelperX.taskDescriptionContoller,))
            ],
          ),
        ),


     ));
  }
}

