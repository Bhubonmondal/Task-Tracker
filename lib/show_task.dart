import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_tracker2/my_widgets/add_button.dart';
import 'package:task_tracker2/my_widgets/my_style.dart';
import 'package:task_tracker2/path_provider_helper.dart';

class ShowTask extends StatefulWidget {
  final String title;

  const ShowTask({super.key, required  this.title});

  @override
  State<ShowTask> createState() => _ShowTaskState();
}

class _ShowTaskState extends State<ShowTask> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PathHelper>(builder: (BuildContext context, PathHelperX, Widget? child) =>
     Scaffold(
      /////////////////  APPBAR START HERE   /////////////////////
      appBar: AppBar(centerTitle: true, title: Column(
        children: [
          Text(widget.title, style: MyStyleB()),
          /////////////// TASK CONUT
          PathHelperX.taskTitle.length==0 ? Text('( No task is left )', style: MyStyle(),) : Text('( You have left ${PathHelperX.count} task 📝)', style: MyStyle(),)
        ],
      )),
      /////////////////  APPBAR END HERE   /////////////////////


      /////////////////  BODY START HERE  //////////////////////
      body: PathHelperX.taskTitle.length==0 ?  Center(child: Text('Add Some tasks to show here', style: MyStyleL()))  
      
      : 
      
      ListView.builder(itemCount: PathHelperX.taskDescription.length, itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: ListTile(
            leading: Checkbox(value: PathHelperX.taskCompletionTracker.getAt(index), onChanged:  (value) => PathHelperX.onClickCheckBox(value, index, context)), //Checkbox
            tileColor: const Color(0xFF595959),
            trailing: IconButton(onPressed: (){ PathHelperX.deleteTask(index, context); }, icon: const Icon(Icons.delete)), //Delete
            title: PathHelperX.taskCompletionTracker.getAt(index) == false ? Text(PathHelperX.taskTitle.getAt(index), style: MyStyleSB()) : Text(PathHelperX.taskTitle.getAt(index), style: MyStyleST()) , // Title
            subtitle:  PathHelperX.taskCompletionTracker.getAt(index) == false ?   Text("${PathHelperX.taskDescription.getAt(index)}   - ${PathHelperX.taskStoreTimg.getAt(index)}")  :   Text("${PathHelperX.taskDescription.getAt(index)}   - ${PathHelperX.taskStoreTimg.getAt(index)}", style: MyStyleST())   , // Subtitle & Time
          ),
        );
      } ),
      /////////////////  BODY END HERE  //////////////////////


  

      /////////////////   Floating ACTION BUTTON START HERE  /////////////
      floatingActionButton:  addButton(contextF: context),
      /////////////////   Floating ACTION BUTTON END HERE  /////////////
    ));
  }

  
}

