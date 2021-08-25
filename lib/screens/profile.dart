import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hoop_seek/screens/components/forms-components.dart';
import 'package:hoop_seek/utils/constants.dart';
import 'package:hoop_seek/utils/size_helpers.dart';
import 'package:hoop_seek/utils/themes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final SizeHelper sizer = SizeHelper(context);
    final user = false;
    final follow = false;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: BrandTheme.colorBackground,
        title: Text(
          'MICHX'.toUpperCase(),
          style: kTitleTextStyle,
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(sizer.sx(kPadding)),
          child: Column(
            children: [
              SizedBox(
                height: sizer.sy(0.1),
              ),
              Container(
                height: sizer.sx(0.22),
                width: sizer.sx(0.22),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://asset1.modelmanagement.com/mm-eyJ0Ijp7InIiOnsibCI6/Ijc1MCIsImgiOiI1MTIi/fX0sImlkIjoiaTEwMDQw/Mjk1IiwiZiI6ImpwZyJ9.jpg'),
                ),
              ),
              SizedBox(
                height: sizer.sy(0.025),
              ),
              Text('@hooper2000'.toUpperCase()),
              SizedBox(
                height: sizer.sy(0.025),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  user
                      ? CustomButton(onPressed: () {}, label: 'Edit profsmhle')
                      : follow
                          ? CustomButton(onPressed: () {}, label: 'Follow')
                          : CustomButton(onPressed: () {}, label: 'Following'),
                ],
              ),
              SizedBox(
                height: sizer.sy(0.025 * 2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        '0',
                        style: TextStyle(fontSize: sizer.sx(0.05)),
                      ),
                      Text(
                        'Matches'.toUpperCase(),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '0',
                        style: TextStyle(fontSize: sizer.sx(0.05)),
                      ),
                      Text(
                        'Friends'.toUpperCase(),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(sizer.sx(kPadding)),
                child: Text(
                  kFillerText,
                  style: kSubHeadingTextStyle,
                  textAlign: TextAlign.center,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
