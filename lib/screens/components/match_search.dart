import 'package:flutter/material.dart';
import 'package:hoop_seek/utils/constants.dart';
import 'package:hoop_seek/utils/size_helpers.dart';

import 'forms.dart';
import 'map.dart';

class MatchSearchWidget extends StatefulWidget {
  const MatchSearchWidget({Key? key}) : super(key: key);

  @override
  _MatchSearchWidgetState createState() => _MatchSearchWidgetState();
}

class _MatchSearchWidgetState extends State<MatchSearchWidget> {
  List<Widget> searchresults = [];
  List<String> matchList = [];
  bool isSearching = false;
  void searchOperation() {
    searchresults.clear();
    if (isSearching == true) {
      for (int i = 0; i < matchList.length; i++) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    final SizeHelper sizer = SizeHelper(context);
    var search = '';
    return Padding(
        padding:
            EdgeInsets.fromLTRB(sizer.sx(kPadding), 0, sizer.sx(kPadding), 0),
        child: WidgetBackground(
            child: Container(
          height: sizer.sx(0.96),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  label: 'Search for match at location',
                  hintText: 'Search Court',
                  suffixIcon: Icon(Icons.search),
                  onChanged: (val) {
                    setState(() => search = val.trim());
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Email cannot be empty";
                    } else {
                      return null;
                    }
                  },
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          index == 0
                              ? Column(
                                  children: [
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text('matches'.toUpperCase())),
                                    SizedBox(height: sizer.sx(kPadding)),
                                  ],
                                )
                              : SizedBox(),
                          MatchInfo(),
                          SizedBox(height: sizer.sx(kPadding))
                        ],
                      );
                    })
              ],
            ),
          ),
        )));
  }
}
