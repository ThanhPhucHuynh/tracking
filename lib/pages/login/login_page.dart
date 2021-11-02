import 'package:flutter/material.dart';
import 'package:tracking/langs/locale_keys.g.dart';
import 'package:tracking/widgets/login/curved_widget.dart';
import 'package:tracking/widgets/login/gradient_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xfff2cbd0), Color(0xfff4ced9)])),
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                CurvedWidget(
                  child: Container(
                      padding: const EdgeInsets.only(top: 100, left: 50),
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            Colors.white,
                            Colors.white.withOpacity(0.4)
                          ])),
                      child: Text(
                        'Login',
                        style:
                            TextStyle(fontSize: 50, color: Color(0xff6a515e)),
                      )),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 390),
                  child: Container(
                    child: GradientButton(
                      onPressed: () {},
                      height: 40,
                      width: 200,
                      icon: Icon(Icons.landscape_rounded),
                      text: Text(LocaleKeys.LoginGoogle),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
