import 'package:get/get.dart';

class MainBottomNavBarController extends GetxController{
  int _selectedSlider = 0;

  int get selectedSlider => _selectedSlider;

  void changeIndex(int index){
    _selectedSlider = index;
    update();
  }
void backToHomeScreen(){
    changeIndex(0);
}
  void gotoCategoryScreen(){
    changeIndex(1);
  }
}