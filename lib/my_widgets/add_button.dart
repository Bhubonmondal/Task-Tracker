import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_tracker2/path_provider_helper.dart';

class addButton extends StatelessWidget {
  final contextF;

  const addButton({
    super.key, required this.contextF
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PathHelper>(
      builder: (BuildContext context, PathHelperX, Widget? child) => Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.5),
                blurRadius: 10.0,
                offset: const Offset(0.1, 3.0),
              )
            ],
            shape: BoxShape.circle,
            gradient: const LinearGradient( begin: Alignment.bottomRight, end: Alignment.topLeft, colors: [
              Color(0xffDE83B0),
              Color(0xffC59ADF),
            ])),
        child: IconButton(
            onPressed: () {
              PathHelperX.navigateToAddTaskPage(contextF);
            },
            icon: const Icon(Icons.add), color: const Color(0xFF484F57), iconSize: 45),
      ),
    );
  }
}
