import 'package:flutter/cupertino.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_tracker2/add_task.dart';

class PathHelper extends ChangeNotifier {
///////////////  ALL VERIABLES GOES HERE   /////////////
  late List<bool> isChecked = [];

  var taskTitle = Hive.box('title');
  var taskDescription = Hive.box('description');
  var taskStoreTimg = Hive.box('timing');
  var taskCompletionTracker = Hive.box('track_complete_orNot');
  var count = 0;
  var taskTitleController = TextEditingController();
  var taskDescriptionContoller = TextEditingController();

///////////////  ALL VERIABLES GOES HERE   /////////////

/////////////////  ADD TASK START HERE  ///////////////
  addTask(context) {
    var title = taskTitleController.text.trim();
    var desc = taskDescriptionContoller.text.trim();

    var name = "";
    if (DateTime.now().day == 1) {
      name = "st";
    } else if (DateTime.now().day == 2) {
      name = "nd";
    } else if (DateTime.now().day == 3) {
      name = "rd";
    } else {
      name = "th";
    }

    var monthList = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    var month = monthList[DateTime.now().month - 1];

    if(title.isNotEmpty || desc.isNotEmpty){
      taskTitle.add(title);
      taskDescription.add(desc);
      taskStoreTimg.add("${DateTime.now().day}$name $month");
      // isChecked.add(false);
      taskCompletionTracker.add(false);

      taskTitleController.clear();
      taskDescriptionContoller.clear();
      Navigator.pop(context);
      showToast('New Task Added ✅', context: context);
    }
    count++;
    notifyListeners();
  }
/////////////////  ADD TASK START HERE  ///////////////

/////////////////  DELETE TASK START HERE  ///////////////
  deleteTask(index, context) {
     taskTitle.deleteAt(index);
      taskDescription.deleteAt(index);
      taskStoreTimg.deleteAt(index);
      showToast("Task Deleted ✅", context: context);
      taskCompletionTracker.deleteAt(index);
      countAllTask();
    notifyListeners();
  }
/////////////////  DELETE TASK END HERE  ///////////////

/////////////////  NAVIGATE TO ANOTHER PAGE START HERE  ///////////////
  navigateToAddTaskPage(context) {
    Navigator.push(
        context,
        CupertinoPageRoute(
            fullscreenDialog: true, builder: (context) => AddTask()));
  }
/////////////////  NAVIGATE TO ANOTHER PAGE END HERE  ///////////////

///////////////////  CHECK BOX  START /////////////////////
  onClickCheckBox(value, index, context) {
    taskCompletionTracker.putAt(index, value);
     countAllTask();
    notifyListeners();
  }
///////////////////  CHECK BOX  END /////////////////////


///////////////////////  COUNT TASK LEFT START  ////////////
countAllTask(){
   count = 0;
    for(int i=0; i < taskCompletionTracker.length; i++){
      if(taskCompletionTracker.getAt(i)==false){
          count++;
      }
    }
  notifyListeners();
  }
}
///////////////////////  COUNT TASK LEFT END  ////////////
