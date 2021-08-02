// import 'dart:async';

import 'package:get/get.dart';

// ignore: must_be_immutable
class AuthenticationController extends GetxController {
  var auth = false.obs;
  // StreamController controller = StreamController();
  @override
  void onInit() {
    super.onInit();
    setAuthResult(false);
  }

  setAuthResult(val) {
    auth.value = val;
    // controller.sink.add(auth);
  }
}
