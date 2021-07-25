import 'package:flutter/material.dart';
import 'package:hoop_seek/utils/constants.dart';
import 'package:hoop_seek/utils/size_helpers.dart';
import 'package:hoop_seek/utils/themes.dart';
import 'package:hoop_seek/screens/components/forms.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    final SizeHelper sizer = SizeHelper(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(sizer.sx(kPadding)),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: sizer.sx(.35),
                  ),
                  Image(
                    image: BrandTheme.isLight
                        ? AssetImage('assets/logo2.png')
                        : AssetImage('assets/logo.png'),
                    width: sizer.sx(.21),
                    height: sizer.sx(.21),
                  ),
                  SizedBox(
                    height: sizer.sy(.008),
                  ),
                  Text(
                    'account Login'.toUpperCase(),
                    style: kTitleTextStyle,
                  ),
                  SizedBox(
                    height: sizer.sy(.0075),
                  ),
                  Text(
                    'Login into your account.',
                  ),
                  SizedBox(
                    height: sizer.sy(.07),
                  ),
                  CustomTextField(
                    hintText: 'hooper2000@gmail.com',
                    label: 'enter Email or username',
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
                  CustomTextField(
                    onChanged: (val) {
                      setState(() => password = val.trim());
                    },
                    label: 'Password',
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Password";
                      } else {
                        return null;
                      }
                    },
                    isObscureText: true,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: BrandTheme.colorFont),
                        )),
                  ),
                  SizedBox(
                    height: sizer.sy(.030),
                  ),
                  CustomButton(
                    label: 'login',
                    onPressed: () {
                      Navigator.pushNamed(context, '/map');
                    },
                  ),
                  SizedBox(
                    height: sizer.sy(.016),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Create a ',
                          style: TextStyle(color: BrandTheme.colorFont),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'new account',
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
      ),
    );
  }
}
