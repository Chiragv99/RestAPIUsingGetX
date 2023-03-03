import 'package:http/http.dart' as http;
import 'package:rest_api_getx/Constant/Constant.dart';
import 'package:rest_api_getx/model/upcoming.dart';

import '../model/casts.dart';

class MovieDBAPI {

  static var client = http.Client();
  static var apikey = "a92f28e11a27e8e5938a2020be68ba9c" ;

  static Future<List<Movie>?> fetchUpcomingMovie() async{
    var response = await client.get(Uri.parse(Constant.baseURL + "/upcoming?api_key=$apikey"));
    if(response.statusCode == 200){
      var json =  response.body;
      var upcoming = upcomingFromJson(json);
      return upcoming.results;
    }else{
      return null ;
    }
  }

  static Future<List<Cast>?> fetchCastOfMovie({required int movieID}) async {
    var response = await client.get(
        Uri.parse(Constant.baseURL +'/$movieID/credits?api_key=$apikey'));
    if (response.statusCode == 200) {
      var json = response.body;
      var castsResp = castsFromJson(json);
      return castsResp.cast;
    } else {
      return null;
    }
  }
}