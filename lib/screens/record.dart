import 'package:flutter/material.dart';
import 'package:hoop_seek/utils/constants.dart';
import 'package:hoop_seek/utils/size_helpers.dart';
import 'package:hoop_seek/utils/themes.dart';

import 'components/match-components.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({Key? key}) : super(key: key);

  @override
  _RecordScreenState createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  @override
  Widget build(BuildContext context) {
    final SizeHelper sizer = SizeHelper(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: BrandTheme.colorBackground,
        title: Text(
          'Match Records'.toUpperCase(),
          style: kTitleTextStyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(kPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [MatchInfo(), Divider()],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
