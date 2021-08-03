import 'package:get/get.dart';

class DashboardNavigate extends GetxController {
  var currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    updateCurrentIndex(0);
  }

  updateCurrentIndex(int val) {
    currentIndex.value = val;
  }
}
