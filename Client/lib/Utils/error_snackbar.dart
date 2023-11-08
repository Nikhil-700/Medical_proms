import 'package:flutter/material.dart';

void showSnackbarMessage(BuildContext context, bool state, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.none,
      duration: Duration(seconds: 2, milliseconds: 1),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: SizedBox()),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color:
                  state == true ? Colors.green.shade300 : Colors.red.shade300,
            ),
            padding: EdgeInsets.symmetric(horizontal: 21, vertical: 18),
            child: Text(message),
          ),
        ],
      ),
      elevation: 0,
      backgroundColor: Colors.transparent));
}
