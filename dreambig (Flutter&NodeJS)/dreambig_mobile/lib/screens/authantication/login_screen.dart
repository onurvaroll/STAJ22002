import 'package:dreambig_mobile/controller/server/api/server_controller.dart';
import 'package:dreambig_mobile/screens/authantication/register_screen.dart';
import 'package:dreambig_mobile/screens/main_page.dart';
import 'package:flutter/material.dart';
import 'authantication_page.dart';
import '../../controller/text_controller/text_controller.dart';
import '../home_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 200,
                width: 200,
                child: Image.asset(
                  'assets/images/dreambig_logo.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Giriş Yapın",
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF75100)
                    //Color(0xFFF75100),
                    //lacivert
                    ),
              ),
              const SizedBox(height: 24),
              const LoginPage(),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  bool sign;
                  sign= ServerController().signControl();
                  print(TextControllers().loginMailController.text);
                  if(sign){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage(),));
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Hatalı E-Posta/Şifre Girdiniz'),
                        action: SnackBarAction(
                          label: 'Tamam',
                          onPressed: () {
                            // Code to execute.
                          },
                        ),
                      ),
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFF1c3c6e)),
                ),
                child: const Text(
                  'Giriş Yapın',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Hesabınız Yok Mu?',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Kayıt Olun',
                      style: TextStyle(color: Color(0xFFF75100), fontSize: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
