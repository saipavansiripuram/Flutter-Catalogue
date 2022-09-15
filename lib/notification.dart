import 'package:flutter/material.dart';
import 'main.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text("Notification Page")),
      body: Center(
        child: Text("Notification Page"),
      ),
    );
  }
}
