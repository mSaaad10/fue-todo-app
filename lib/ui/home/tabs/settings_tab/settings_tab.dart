import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsTab extends StatefulWidget {
   SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
String selectedTheme = 'Light';
String selectedLang = 'English';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Theme'),
          SizedBox(height: 8.h,),
          Container(
            padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 6.w ),
            width: double.infinity,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: Theme.of(context).primaryColor, width: 2)
              ),
              child: Row(
                children: [
                  Expanded(child: Text(selectedTheme)),
                  DropdownButton<String>(
                    elevation: 0,
                   // dropdownColor: Colors.red,
focusColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(0),


                    autofocus: false,
                    items: <String>['Light', 'Dark'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (item) {

                      selectedTheme = item!;
                      setState(() {

                      });
                      print(item);
                    },
                  )

                ],
              )),
          SizedBox(height: 12.h,),
          Text('Language'),
          SizedBox(height: 8.h,),
          Container(
              padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 6.w ),
              width: double.infinity,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: Theme.of(context).primaryColor, width: 2)
              ),
              child: Row(
                children: [
                  Expanded(child: Text(selectedLang)),
                  DropdownButton<String>(

                    elevation: 0,
                    // dropdownColor: Colors.red,

                    focusColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(0),


                    autofocus: false,
                    items: <String>['English', 'Arabic'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newLang) {
                      selectedLang = newLang!;
                      setState(() {

                      });
                      print(newLang);
                    },
                  )

                ],
              )),
        ],
      ),
    );
  }
}
