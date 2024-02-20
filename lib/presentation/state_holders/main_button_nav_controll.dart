import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';

class MainButtonNavControll extends GetxController {
  int _selectedindex = 0;

  int get currentindex => _selectedindex;

  void changeIndex(int index) {
    if (_selectedindex == index) {
      return;
    }
    if(index == 2 || index == 3){
      if(Get.find<Authcontroller>().isTokenNotNull ==false){
        Authcontroller.GotoLogin();
        return;
      }
    }
    _selectedindex = index;
    update();
  }

  void backtohome() {
    changeIndex(0);
  }
}
