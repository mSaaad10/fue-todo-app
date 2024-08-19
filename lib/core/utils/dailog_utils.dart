import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Row(
          children: [
            Text('Loading...'),
            SizedBox(
              width: 4,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessageDialog(BuildContext context,
      {String? message,
      String? posActionTitle,
      String? negActionTitle,
      VoidCallback? posAction,
      VoidCallback? negAction}) {
    List<Widget> actions = [];
    if (posActionTitle != null) {
      actions.add(TextButton(
          onPressed: () {
            posAction?.call();
          },
          child: Text(posActionTitle)));
    }
    if (negActionTitle != null) {
      actions.add(TextButton(
          onPressed: () {
            negAction?.call();
            //Navigator.pop(context);
          },
          child: Text(negActionTitle)));
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(message ?? ''),
            actions: actions,
          );
        });
  }
}
