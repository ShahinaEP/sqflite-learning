import 'package:get/get.dart';

import '../model/profile_list_model.dart';
import '../services/api_call.dart';


class ProfileController extends GetxController {
  var loader = false.obs;

  var allProfileList = RxList<ProfliteListModel>().obs;
  // var allProfileListData = RxList<Datum>().obs;

  final ProfileRepository _profileRepository = ProfileRepository();


  @override
  void onInit() {
    getData();
    super.onInit();
  }


  void getData() async {
    loader.value = true;
    var apiData = await _profileRepository.getProfileList();
    if (apiData != null) {
      allProfileList.value.add(apiData);
      loader.value = false;
    }
  }
}