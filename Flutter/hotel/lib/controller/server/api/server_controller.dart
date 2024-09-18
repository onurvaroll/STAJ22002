import 'package:hotel/model/user_model.dart';
import 'package:hotel/service/firestore_service.dart';
import '../../../service/auth.dart';
import '../../text_controller/text_controller.dart';
import '../base/base_server_controller.dart';

class ServerController extends BaseServerController {
  AuthorizationService auth=AuthorizationService();
  FireStoreService fireStore=FireStoreService();
  TextControllers textControllers=TextControllers();

newUser()async{
  print(textControllers.newMailController.text);
  print(textControllers.newPasswordController.text);
  UserModel? user= await auth.createUser(textControllers.newMailController.text, textControllers.newPasswordController.text);
  if(user!=null){
  fireStore.saveUser(
    user: UserModel(
      id: user.id,
      fullName: textControllers.newNameController.text,
      name: textControllers.newNameController.text,
      email: textControllers.newMailController.text,
      photoUrl: user.photoUrl,
      phoneNumber: user.phoneNumber,
      gender:user.gender,
      birthDay:user.birthDay,)).then((value)=>print("User saved to Firestore"));
  }
}

signIn(){
  auth.signIn(textControllers.mailController.text, textControllers.passwordController.text);
}
signOut(){
  auth. signOut();
}
}
