import 'package:flutter/material.dart';
import 'package:hoop_seek/utils/brand_icons_icons.dart';
import 'package:hoop_seek/utils/constants.dart';
import 'package:hoop_seek/utils/size_helpers.dart';
import 'package:hoop_seek/utils/themes.dart';

class MatchQuickView extends StatefulWidget {
  final double pinPillPosition;
  const MatchQuickView({required this.pinPillPosition});

  @override
  _MatchQuickViewState createState() => _MatchQuickViewState();
}

class _MatchQuickViewState extends State<MatchQuickView> {
  @override
  Widget build(BuildContext context) {
    final SizeHelper sizer = SizeHelper(context);
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      top: widget.pinPillPosition,
      left: 0,
      right: 0,
      child: Padding(
          padding: EdgeInsets.all(sizer.sx(kPadding)),
          child: WidgetBackground(child: MatchInfo())),
    );
  }
}

class MatchInfo extends StatefulWidget {
  const MatchInfo({Key? key}) : super(key: key);

  @override
  _MatchInfoState createState() => _MatchInfoState();
}

class _MatchInfoState extends State<MatchInfo> {
  @override
  Widget build(BuildContext context) {
    final SizeHelper sizer = SizeHelper(context);
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  BrandIcons.gamefullcourt,
                  size: sizer.sx(0.14),
                ),
                SizedBox(
                  width: sizer.sx(0.04),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Starting at 9:02pm',
                        textAlign: TextAlign.left, style: kSubHeadingTextStyle),
                    SizedBox(
                      height: sizer.sy(0.009),
                    ),
                    Text(
                      'King of the court      6/7 Players'.toUpperCase(),
                      textAlign: TextAlign.left,
                    ),
                    Row(
                      children: [
                        Text('9999 Laney Dr. San Fransisco CA',
                            textAlign: TextAlign.left,
                            style: kSubTitleTextStyle),
                        SizedBox(
                          width: sizer.sx(0.02),
                        ),
                        Icon(Icons.location_on,
                            size: sizer.sy(0.023),
                            color: BrandTheme.colorSubTitle)
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.more_vert,
                          color: BrandTheme.colorFont,
                          size: sizer.sy(0.023),
                        ),
                        Text(
                          'View Details',
                          style: TextStyle(color: BrandTheme.colorFont),
                        ),
                      ],
                    )),
                SizedBox(
                  width: sizer.sx(0.08),
                ),
                TextButton(onPressed: () {}, child: Text('+JOIN MATCH'))
              ],
            ),
          ],
        )
      ],
    );
  }
}

class WidgetBackground extends StatefulWidget {
  final Widget child;
  const WidgetBackground({required this.child});

  @override
  _WidgetBackgroundState createState() => _WidgetBackgroundState();
}

class _WidgetBackgroundState extends State<WidgetBackground> {
  @override
  Widget build(BuildContext context) {
    final SizeHelper sizer = SizeHelper(context);
    return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: BrandTheme.isLight
                  ? Colors.black.withOpacity(0.1)
                  : Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(18.0),
          color: BrandTheme.colorBackground,
        ),
        padding: EdgeInsets.all(sizer.sx(0.04)),
        child: widget.child);
  }
}
