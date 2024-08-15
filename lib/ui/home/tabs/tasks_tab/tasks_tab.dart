import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_task_management_app/ui/widgets/tasks_item_widget.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: Colors.blueGrey,
          dayColor: Colors.black,
          activeDayColor: Theme.of(context).primaryColor,
          activeBackgroundDayColor: Colors.white,
          fontSize: 22.sp,
          shrink: true,
          selectableDayPredicate: (date) =>true,
          locale: 'en_ISO',
        ),
        TaskItemWidget(),
      ],
    );
  }
}
