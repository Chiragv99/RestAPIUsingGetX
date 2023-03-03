import 'package:get/state_manager.dart';

import '../Network/api.dart';
import '../model/casts.dart';

class CastController extends GetxController {
  var isLoading = true.obs;
  var casts = <Cast>[].obs;

  void fetchCasts({required int movieID}) async {
    try {
      isLoading(true);
      var res = await MovieDBAPI.fetchCastOfMovie(movieID: movieID);
      if (res != null) {
        casts.assignAll(res);
      }
    } finally {
      isLoading(false);
    }
  }
}