import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:future_task_management_app/database_manager/model/task.dart';
import 'package:future_task_management_app/database_manager/tasks_dao.dart';
import 'package:future_task_management_app/providers/app_auth_provider.dart';
import 'package:provider/provider.dart';

class TaskItemWidget extends StatelessWidget {
  Task task;

  TaskItemWidget({required this.task});

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AppAuthProvider>(context);
    return Slidable(
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {}),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (context) {
              TasksDao.delete(authProvider.firebaseAuthUser!.uid, task.taskId!);
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Card(
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 4.w,
                height: 62.h,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10.r)),
              ),
              SizedBox(
                width: 25.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [Text(task.title!), Text(task.description!)],
                ),
              ),
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 21.w, vertical: 7.h),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Icon(Icons.check, size: 24.sp, color: Colors.white))
            ],
          ),
        ),
      ),
    );
  }
}
