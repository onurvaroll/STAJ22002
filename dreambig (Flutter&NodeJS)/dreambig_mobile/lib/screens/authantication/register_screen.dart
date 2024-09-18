import 'package:dreambig_mobile/screens/authantication/authantication_page.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int currentIndex = 0;

  List<Widget> registerList = [
    RegisterName(),
    RegisterCommunication(),
    RegisterEducation(),
    RegisterPassword()
  ];
  pageRange(int index, BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          currentIndex=index;
        });
      },
      child: Container(
        height: 10,
        width: currentIndex == index ? 25 : 10,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: const Color(0xFFF75100)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Color(0xFF1c3c6e),

      ),
      toolbarHeight: 28,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
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
                    fit: BoxFit.fitHeight,
                  )),
              const SizedBox(height: 32,),
              registerList[currentIndex],
              const SizedBox(height: 52,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              registerList.length,
                  (index) => pageRange(index, context),
            ),),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  currentIndex==0?const SizedBox(): ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFF75100)) ),
                      onPressed: (){
                        setState(() {
                          currentIndex--;
                        });
                      }, child: const Text('Geri',style: TextStyle(color: Colors.black),)),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF1c3c6e)),
                      ),
                      child: Text(currentIndex != registerList.length-1 ? 'İlerle' : 'Devam Et',style: const TextStyle(color: Colors.white,fontSize: 20),),
                      onPressed: () {
                        setState(() {
                          currentIndex != registerList.length - 1 ? currentIndex++ : null;
                        });
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterName extends StatelessWidget {
  RegisterName({
    super.key,
  });

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Kullanıcı Bilgileri',
          style: TextStyle(
              fontSize: 28,color:Color(0xFFF75100),fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 24,),
        SpecialField(
            hintText: 'Adınız',
            prefix: const Icon(Icons.drive_file_rename_outline,color:Color(0xFF1c3c6e) ,),
            obscureText: false,
            keyboardType: TextInputType.name,
            controller: controller),
        const SizedBox(height: 16,),
        SpecialField(
            hintText: 'Soyadınız',
            prefix: const Icon(Icons.drive_file_rename_outline),
            obscureText: false,
            keyboardType: TextInputType.name,
            controller: controller),
      ],
    );
  }
}

class RegisterCommunication extends StatelessWidget {
  RegisterCommunication({
    super.key,
  });

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('İletişim Bilgileri',
          style: TextStyle(
              fontSize: 28,color:Color(0xFFF75100),fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 16,),
        SpecialField(
            hintText: 'Telefon',
            prefix: const Icon(Icons.phone_android),
            obscureText: false,
            keyboardType: TextInputType.name,
            controller: controller),
        const SizedBox(height: 16,),
        SpecialField(
            hintText: 'E-Posta',
            prefix: const Icon(Icons.mail),
            obscureText: false,
            keyboardType: TextInputType.name,
            controller: controller),
      ],
    );
  }
}

class RegisterEducation extends StatelessWidget {
  RegisterEducation({
    super.key,
  });

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Eğitim ve Şehir Bilgisi',
          style: TextStyle(
              fontSize: 28,color:Color(0xFFF75100),fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 16,),
        SpecialField(
            hintText: 'Okul',
            prefix: const Icon(Icons.school),
            obscureText: false,
            keyboardType: TextInputType.name,
            controller: controller),
        const SizedBox(height: 16,),
        SpecialField(
            hintText: 'Şehir',
            prefix: const Icon(Icons.location_city),
            obscureText: false,
            keyboardType: TextInputType.name,
            controller: controller),
      ],
    );
  }
}

class RegisterPassword extends StatelessWidget {
  RegisterPassword({
    super.key,
  });

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Şifrenizi Oluşturun',
          style: TextStyle(
              fontSize: 28,color:Color(0xFFF75100),fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 16,),
        SpecialField(
            hintText: 'Şifrenizi Oluşturunuz',
            prefix: const Icon(Icons.lock),
            obscureText: false,
            keyboardType: TextInputType.name,
            controller: controller),
        const SizedBox(height: 16,),
        SpecialField(
            hintText: 'Şifrenizi Tekrar Giriniz',
            prefix: const Icon(Icons.lock),
            obscureText: false,
            keyboardType: TextInputType.name,
            controller: controller),
      ],
    );
  }
}
