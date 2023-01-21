import 'package:Reminisce/pages/auth/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:Reminisce/common/widgets/custom_button.dart';
import 'package:Reminisce/pages/auth/screens/user_information_screen.dart';


import 'package:Reminisce/shared/constants.dart';



class PolicyScreen extends StatelessWidget {
  const PolicyScreen({Key? key}) : super(key: key);

  void navigateToLoginScreen(BuildContext context) {
     final screenHeight = MediaQuery.of(context).size.height;
    Navigator.push(
        context,
        // MaterialPageRoute(
        //   builder: (context) =>  Onboarding(screenHeight: screenHeight),
        // )
        MaterialPageRoute(builder: ((context) => LoginPage()))
        
        );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text(
              'Welcome to Reminisce',
              style: TextStyle(
                fontSize: 33,
                color: kBlue,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: size.height / 9),
            Image.asset(
              'assets/logo.png',
              height: 300,
              width: 240,
            ),
            SizedBox(height: size.height / 9),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Read our Privacy Policy. Tap "Agree and continue" to accept the Terms of Service.',
                style: TextStyle(color: kBlue),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: size.width * 0.75,
              child: CustomButton(
                text: 'AGREE AND CONTINUE',
                onPressed: () => navigateToLoginScreen(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}