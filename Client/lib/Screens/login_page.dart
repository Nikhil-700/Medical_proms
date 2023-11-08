import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scmia_eprom/Data/dummy_data.dart';
import 'package:scmia_eprom/Screens/patient_questionnaire_screen.dart';
import 'package:scmia_eprom/Utils/error_snackbar.dart';
import 'package:scmia_eprom/Widgets/email_text_input.dart';
import 'package:scmia_eprom/Widgets/password_text_input.dart';
import 'package:scmia_eprom/constants.dart';

class LoginPage extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(BuildContext context, String Username, String Password) {
    if (Username.trim() == "User1" && Password.trim() == "123456") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PatientQuestionnaireScreen(
                  questions: questions, loginPageContext: context)));
    } else {
      showSnackbarMessage(
          context, false, "Invalid Credentials, please try again");
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle subtitleStyle = GoogleFonts.inter(
        color: theme_dark, fontSize: 18, fontWeight: FontWeight.w300);
    TextStyle titleStyle = GoogleFonts.inter(
        color: theme_dark, fontSize: 27, fontWeight: FontWeight.w600);
    TextStyle animatedImageTextStyle = GoogleFonts.inter(
      fontSize: 45,
      color: background_white,
      fontWeight: FontWeight.w800,
    );

    final outlineAnimatedTextStyle = GoogleFonts.inter(
      fontSize: 75,
      color: theme_dark,
      fontWeight: FontWeight.w800,
      // shadows: [
      //   Shadow(
      //     color: Colors.black,
      //     offset: Offset(-1, -1),
      //   ),
      //   Shadow(
      //     color: Colors.black,
      //     offset: Offset(1, -1),
      //   ),
      //   Shadow(
      //     color: Colors.black,
      //     offset: Offset(1, 1),
      //   ),
      //   Shadow(
      //     color: Colors.black,
      //     offset: Offset(-1, 1),
      //   ),
      // ],
    );
    return Scaffold(
      backgroundColor: background_gray,
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(60),
      //   child: customAppBar(context),
      // ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // login page image content ==============================================
          MediaQuery.of(context).size.width > 1200
              ? Expanded(
                  flex: 9,
                  child: Stack(alignment: Alignment.center, children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'images/LoginBackground.jpg'), // Replace with your image asset
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: 690,
                      height: 450,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(150, 255, 255, 255)),
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              TypewriterAnimatedText(
                                  "Seamless Access to Your Health Journey",
                                  textStyle: outlineAnimatedTextStyle,
                                  speed: Duration(milliseconds: 90)),
                              TypewriterAnimatedText(
                                  "Empowering Your Health, One Login at a Time",
                                  textStyle: outlineAnimatedTextStyle,
                                  speed: Duration(milliseconds: 90)),
                              TypewriterAnimatedText(
                                  "Navigating Wellness with Every Sign-in",
                                  textStyle: outlineAnimatedTextStyle,
                                  speed: Duration(milliseconds: 90)),
                            ]),
                      ),
                    ),

                    // Positioned(
                    //   bottom: 30,
                    //   child: Container(
                    //     // color: Colors.black45,
                    //     child: Container(
                    //       color: Colors.black45,
                    //       child: Container(
                    //         child: AnimatedTextKit(
                    //             repeatForever: true,
                    //             animatedTexts: [
                    //               TypewriterAnimatedText(
                    //                   "Seamless Access to Your Health Journey",
                    //                   textStyle: outlineAnimatedTextStyle,
                    //                   speed: Duration(milliseconds: 90)),
                    //               TypewriterAnimatedText(
                    //                   "Empowering Your Health, One Login at a Time",
                    //                   textStyle: outlineAnimatedTextStyle,
                    //                   speed: Duration(milliseconds: 90)),
                    //               TypewriterAnimatedText(
                    //                   "Navigating Wellness with Every Sign-in",
                    //                   textStyle: outlineAnimatedTextStyle,
                    //                   speed: Duration(milliseconds: 90)),
                    //             ]),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ]))
              : SizedBox(),

          // login page sign in content ==============================================
          Expanded(
            flex: 4,
            child: Container(
              // decoration: MediaQuery.of(context).size.width <= 10
              //     ? BoxDecoration(
              //         image: DecorationImage(
              //           image: AssetImage(
              //               'images/LoginBackground.jpg'), // Replace with your image asset
              //           fit: BoxFit.cover,
              //         ),
              //       )
              //     : BoxDecoration(color: Colors.transparent),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 45),
                  logo(),
                  Spacer(flex: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              constraints:
                                  BoxConstraints(minWidth: 210, maxWidth: 420),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Row(
                                    //   children: [
                                    //     Expanded(
                                    //         child: Padding(
                                    //       padding:
                                    //           const EdgeInsets.only(left: 9),
                                    //       child: Text(
                                    //         "Welcome back!\nLogin and get the best post-treatment services.",
                                    //         style: subtitleStyle,
                                    //       ),
                                    //     )),
                                    //   ],
                                    // ),
                                    // SizedBox(height: 60),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 9),
                                          child: Text(
                                            "Login",
                                            style: titleStyle,
                                          ),
                                        )),
                                      ],
                                    ),
                                    SizedBox(height: 24),
                                    EmailTextInput(
                                        controller: usernameController,
                                        hintText: "Username"),
                                    SizedBox(height: 20),
                                    PasswordTextInput(
                                        controller: passwordController,
                                        hintText: "Password"),
                                    SizedBox(height: 20),
                                    loginButton(context),
                                    SizedBox(height: 27),
                                    Row(children: <Widget>[
                                      SizedBox(width: 30),
                                      Expanded(child: Divider()),
                                      SizedBox(width: 21),
                                      Text(
                                        "OR",
                                        style: TextStyle(color: theme_dark),
                                      ),
                                      SizedBox(width: 21),
                                      Expanded(child: Divider()),
                                      SizedBox(width: 30),
                                    ]),
                                    SizedBox(height: 27),
                                    Container(
                                      height: 47,
                                      child: FloatingActionButton.extended(
                                          backgroundColor: background_white,
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 1, color: theme_dark),
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          onPressed: () {},
                                          label: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Text(
                                              "Sign Up",
                                              style:
                                                  TextStyle(color: theme_dark),
                                            ),
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(flex: 2)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return Container(
      height: 47,
      child: FloatingActionButton.extended(
          backgroundColor: theme_dark,
          onPressed: () {
            login(context, usernameController.text, passwordController.text);
          },
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text("Log In"),
          )),
    );
  }

  Widget customAppBar(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      actions: [
        // Padding(
        //     padding: const EdgeInsets.only(right: 40),
        //     child: SizedBox(
        //         child: IconButton(
        //             iconSize: 24,
        //             splashRadius: 24,
        //             icon: Icon(Icons.remove, color: theme_dark, weight: 2),
        // onPressed: () => Navigator.pop(context))))
      ],
      shape: Border(bottom: BorderSide(color: border_gray, width: 1)),
      toolbarHeight: 100,
      backgroundColor: background_white,
      shadowColor: Colors.black,
      centerTitle: true,
      title: Text(
        "Sample ePROM",
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(fontSize: 20, color: theme_dark),
      ),
    );
  }

  Widget logo() {
    TextStyle hintStyle = TextStyle(
      color: theme_dark,
    );
    TextStyle titleStyle =
        TextStyle(color: theme_dark, fontSize: 36, fontWeight: FontWeight.w600);
    return Row(
      children: [
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: 120, child: Image.asset("images/SIT.png")),
            VerticalDivider(color: theme_dark, thickness: 1),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ePROM",
                  style: titleStyle,
                ),
                Text(
                  "An Electronic Patient Reported\nOutcome Measure Solution",
                  style: hintStyle,
                ),
              ],
            )
          ],
        ))
      ],
    );
  }
}
