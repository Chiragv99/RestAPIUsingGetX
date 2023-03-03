import 'package:get/state_manager.dart';
import 'package:rest_api_getx/model/casts.dart';

import '../Network/api.dart';
import '../model/upcoming.dart';


class UpComingController extends GetxController {
  var isLoading = true.obs;
  var movies = <Movie>[].obs;

  void fetchUpComing() async {
    try {
      isLoading(false);
      var res = await MovieDBAPI.fetchUpcomingMovie();
      if (res != null) {
        isLoading(false);
        movies.assignAll(res);
      }
    } finally {
      isLoading(false);
    }
  }



}