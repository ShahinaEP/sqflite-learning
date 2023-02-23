import 'package:http/http.dart' as http;

import '../model/profile_list_model.dart';

class ProfileRepository {
  Future<ProfliteListModel?> getProfileList() async {
    var response = await http
        .get(Uri.parse("https://reqres.in/api/users?page=2"));
    if (response.statusCode == 200) {
      var jsondata = response.body;
      // print("RESPONSE---${response.body}");

      return profliteListModelFromJson(jsondata);
    } else {
      throw Exception("Something Went Wrong");
    }
  }
}