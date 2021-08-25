import 'package:flutter/material.dart';
import 'package:hoop_seek/utils/constants.dart';
import 'package:hoop_seek/utils/themes.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: BrandTheme.colorBackground,
        title: Text(
          'messages'.toUpperCase(),
          style: kTitleTextStyle,
        ),
      ),
      body: Column(children: [Divider(), Row(children: [],), Divider()]),
    );
  }
}
