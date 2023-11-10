import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAdaptiveDialog {
  static  customAdaptiveDialog(
      {required BuildContext context, required String message,required String title}) {
    return showAdaptiveDialog(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          title:  Text(
            title,
            style: const TextStyle(color: Color(0xffff3333), fontSize: 20),
          ),
          content: Text(
            message,
            textAlign: TextAlign.center,
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text(
                  "Ok",
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
