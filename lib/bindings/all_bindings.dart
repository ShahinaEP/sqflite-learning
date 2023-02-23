import 'package:get/get.dart';

import '../controller/profile_conteoller.dart';

class Allbindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}