import 'dart:convert';
import 'package:flutter_getx_json_movie_app/model/movie.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

class VmHandler extends GetxController{
  var movies = <Movie>[].obs;

  getJSONData()async{
    var url=Uri.parse('https://zeushahn.github.io/Test/movies.json');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List results = dataConvertedJSON['results'];

    List<Movie> returnResult = [];
    for(int i=0; i<results.length; i++){
      String title = results[i]['title'];
      String image = results[i]['image'];
      returnResult.add(Movie(image: image, title: title));
    }
    print(returnResult);
    movies.value = returnResult;
  }
}