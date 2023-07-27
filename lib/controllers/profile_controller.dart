import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import 'package:welcome/controllers/tokenController.dart';
import 'package:welcome/models/user_profile.dart';
import 'package:welcome/routes/routes.dart';
import 'package:welcome/utils/custom_snackBar.dart';
import 'package:welcome/utils/endpoints.dart';
import 'package:welcome/utils/loading.dart';
import 'package:welcome/utils/preferences.dart';
// import 'package:welcome/utils/preferences.dart';

class ProfileController extends GetxController {
  Preferences preferences = Preferences();
  UserProfile? userProfile;

  @override
  void onInit() {
    super.onInit();
    Get.showOverlay(
        asyncFunction: () => getProfile(), loadingWidget: const Loading());
  }

  var isLoading = false.obs;

  Future<void> getProfile() async {
    Map token = await preferences.getToken();
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token['access']}'
      };
      var url =
          Uri.parse(APIEndPoints.baseURL + APIEndPoints.authEndPoints.profile);

      http.Response response = await http.get(url, headers: headers);

      // var request = http.MultipartRequest('GET', url);

      // request.headers.addAll(headers);

      // http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        userProfile =
            userProfileFromJson(response.body);

        isLoading(true);
        

        // Check user type and route
        if (userProfile!.isMec) {
          Get.offNamed(Routes.mecHomePage);
        } else {
          Get.offNamed(Routes.driverPage);
        }
      } else {
        ScaffoldMessenger.of(Get.context!)
            .showSnackBar(customSnackBar("Error: ", false));
      }
    } catch (e) {
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(customSnackBar("Error: ${e.toString()}", false));
    } finally {
      isLoading(false);
    }
  }
}
