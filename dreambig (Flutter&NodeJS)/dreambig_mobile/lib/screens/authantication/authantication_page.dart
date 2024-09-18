import 'package:dreambig_mobile/extentions/extentions.dart';
import 'package:dreambig_mobile/screens/authantication/register_screen.dart';
import 'package:flutter/material.dart';

import '../../controller/text_controller/text_controller.dart';

class AuthanticationPage extends StatelessWidget {
  const AuthanticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
            padding: 16.pAll,
            children: [
              const SizedBox(
                height: 80,
              ),
              SizedBox(
              height: 200,
              width: 200,
              child: Image.asset(
                'assets/images/dreambig_logo.png',
                fit: BoxFit.fitHeight,
              )),
              const SizedBox(
                height: 10,
              ),
               const Padding(
                 padding: EdgeInsets.only(right:16.0,left: 16),
                 child: Text(
                  "Giriş Yapın",
                  style: TextStyle(fontSize:36,
                      fontWeight:FontWeight.bold,
                      color: Color(0xFF1c3c6e)),
                               ),
               ),

              const LoginPage(),
              Padding(
                padding: const EdgeInsets.only(right:16.0,left: 16),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFF1c3c6e))),
                  child: const Text(
                    'Giriş Yapın',
                    style: TextStyle(color: Colors.white,fontSize: 24),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Hesabınız Yok Mu?',
                    style: TextStyle(color: Colors.black,fontSize: 18),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen(),));
                      },
                      child: const Text(
                        'Kayıt Olun',
                        style: TextStyle(color: Color(0xFFF75100), fontSize: 20),
                      )),
                ],
              )
            ],
          ),
    );

  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextControllers textControllers=TextControllers();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SpecialField(
            hintText: 'E-Mail',
            prefix: const Icon(Icons.mail,color: Color(0xFF1c3c6e),),
            obscureText: false,
            keyboardType: TextInputType.text,
            controller: textControllers.loginMailController),
        const SizedBox(
          height: 20,
        ),
        SpecialField(
            hintText: 'Şifre',
            prefix: const Icon(Icons.lock,color: Color(0xFF1c3c6e),),
            obscureText: false,
            keyboardType: TextInputType.text,
            controller: textControllers.loginPasswordController),
        TextButton(
            onPressed: () {},
            child: const Text(
              'Şifremi Unuttum',
              style: TextStyle(color: Color(0xFF1c3c6e),fontSize: 20),
            ))
      ],
    );
  }
}

class SpecialField extends StatelessWidget {
  const SpecialField(
      {super.key,
      required this.hintText,
      required this.prefix,
      required this.obscureText,
      required this.keyboardType,
      required this.controller});

  final String hintText;
  final Widget prefix;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: const Color(0xFF1c3c6e),
      decoration: InputDecoration(
        prefixIcon: prefix,
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color(0xFF1c3c6e), width: 2.0),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFF1c3c6e),fontSize: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.white10),
        ),
      ),
      style: const TextTheme().labelSmall?.copyWith(color: Colors.black),
    );
  }
}
