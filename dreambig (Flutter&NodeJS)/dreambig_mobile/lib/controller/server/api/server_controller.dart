import '../../text_controller/text_controller.dart';
import '../base/base_server_controller.dart';

class ServerController extends BaseServerController {
final String eMail='dreambig';
final String password='dreambig';
TextControllers textControllers=TextControllers();
bool isSign =false;

bool signControl(){
  if(textControllers.loginMailController.text == eMail){
    if(textControllers.loginPasswordController.text == password){
      print("Giriş Başarılı");
      isSign=true;
      return isSign;
    }
    isSign=false;
    return isSign;
  }
  isSign=false;
  return isSign;
}

}
