import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:merawall/model/apimodel.dart';

class UnsplashApiData extends GetxController{
  String accessKey ="R_2voATnea7BM9_6MX64d9dTjXW35U8edfthvsWrVYT4 ";
  static var page = 2;
  String urlToAccessKey = "";

  static final isDataLoaded = true.obs;
  static final photos = <Apimodel>[].obs;


  Future<int> pageForward() async {

    return page++;

  }

  static Future<int> pagebackward() async{
    return page--;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadPhotos();
  }



  void loadPhotos() async{
   /* String urlToAccessKey = "https://api.unsplash.com/photos/?client_id=" + accessKey;*/
    String urlToAccessKey = "https://api.unsplash.com/photos/?client_id=${accessKey}&page=${page}&per_page=30";
    var response = await http.get(Uri.parse(urlToAccessKey));
    if(response.statusCode == 200){
      var decodedData = jsonDecode(response.body);

      photos.value = List.from(decodedData).map((e) => Apimodel.fromMap(e)).toList();
      isDataLoaded.value = true;
      print(photos[0].urls['raw']);
      print(photos.length);
    }else{
      Get.snackbar("error", "Something went wrong");
    }
    print(photos[0].urls['raw']);
  }
}