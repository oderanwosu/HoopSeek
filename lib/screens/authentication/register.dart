import 'package:flutter/material.dart';
import 'package:hoop_seek/utils/constants.dart';
import 'package:hoop_seek/utils/size_helpers.dart';
import 'package:hoop_seek/utils/themes.dart';
import 'package:hoop_seek/screens/components/forms.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    final SizeHelper sizer = SizeHelper(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(sizer.sx(kPadding)),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: sizer.sx(.35),
                ),
                Text(
                  'Choose a username'.toUpperCase(),
                  style: kTitleTextStyle,
                ),
                SizedBox(
                  height: sizer.sy(.0075),
                ),
                Text(
                  'You can always change it later.',
                ),
                SizedBox(
                  height: sizer.sy(.05),
                ),
                CustomTextField(
                  hintText: 'hooper2000',
                  onChanged: (val) {
                    setState(() => email = val.trim());
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Email cannot be empty";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: sizer.sy(.030),
                ),
                CustomButton(
                  label: 'next',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterPassword()),
                    );
                  },
                ),
                SizedBox(
                  height: sizer.sy(.016),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Login into your ',
                        style: TextStyle(color: BrandTheme.colorFont),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'existing account',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline)),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterPassword extends StatefulWidget {
  const RegisterPassword({Key? key}) : super(key: key);

  @override
  _RegisterPasswordState createState() => _RegisterPasswordState();
}

class _RegisterPasswordState extends State<RegisterPassword> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    final SizeHelper sizer = SizeHelper(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(sizer.sx(kPadding)),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: sizer.sx(.35),
                ),
                Text(
                  'Create A Password'.toUpperCase(),
                  style: kTitleTextStyle,
                ),
                SizedBox(
                  height: sizer.sy(.0075),
                ),
                Text(
                  'The password must include a capitol letter and one number',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: sizer.sy(.05),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_rounded,
                          color: BrandTheme.colorFont,
                        ),
                        Text('Go back',
                            style: TextStyle(color: BrandTheme.colorFont))
                      ],
                    ),
                  ),
                ),
                CustomTextField(
                  hintText: 'password',
                  isObscureText: true,
                  onChanged: (val) {
                    setState(() => email = val.trim());
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Password cannot be empty";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: sizer.sy(.01),
                ),
                CustomTextField(
                  hintText: 'retype password',
                  isObscureText: true,
                  onChanged: (val) {
                    setState(() => email = val.trim());
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Password cannot be empty";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: sizer.sy(.030),
                ),
                CustomButton(
                  label: 'next',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterEmail()),
                    );
                  },
                ),
                SizedBox(
                  height: sizer.sy(.016),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Login into your ',
                        style: TextStyle(color: BrandTheme.colorFont),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'existing account',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline)),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterEmail extends StatefulWidget {
  const RegisterEmail({Key? key}) : super(key: key);

  @override
  _RegisterEmailState createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String imageURL = "https://www.w3schools.com/howto/img_avatar.png";
  @override
  Widget build(BuildContext context) {
    final SizeHelper sizer = SizeHelper(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(sizer.sx(kPadding)),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: sizer.sx(.35),
                ),
                Text(
                  'profile email and image'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: kTitleTextStyle,
                ),
                SizedBox(
                  height: sizer.sy(.0075),
                ),
                Text(
                  'You do not have to.',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: sizer.sy(.05),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_rounded,
                          color: BrandTheme.colorFont,
                        ),
                        Text('Go back',
                            style: TextStyle(color: BrandTheme.colorFont))
                      ],
                    ),
                  ),
                ),
                CircleAvatar(
                  child: TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.grey[300],
                      size: sizer.sy(.05),
                    ),
                  ),
                  minRadius: sizer.sy(.08),
                  backgroundColor: Colors.grey,
                ),
                SizedBox(
                  height: sizer.sy(.01),
                ),
                CustomTextField(
                  hintText: 'hooper2000@gmail.com',
                  onChanged: (val) {
                    setState(() => email = val.trim());
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Password cannot be empty";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: sizer.sy(.030),
                ),
                CustomButton(
                  label: 'next',
                  onPressed: () {},
                ),
                SizedBox(
                  height: sizer.sy(.016),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Login into your ',
                        style: TextStyle(color: BrandTheme.colorFont),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'existing account',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline)),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
