import 'package:flutter/material.dart';
import 'package:hotel/pages/authentication/signin_page/signin_page.dart';
import 'package:hotel/pages/authentication/signup_page/signup_page.dart';
import '../../core/color.dart';
import 'login_page/login_page.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final PageController _pageController = PageController();

  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: ColorConstants.black),),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          LoginPage(pageController: _pageController,),
          SignInPage(pageController: _pageController,),
          SignUpPage(pageController: _pageController,),
          NewWidget(pageController: _pageController),
        ],
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.red,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            if (_pageController.hasClients) {
              _pageController.animateToPage(
                1,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            }
          },
          child: const Text('Next'),
        ),
      ),
    );
  }
}
