import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_getx/Constant/Constant.dart';

import '../controller/upcomingController.dart';
import 'DetailPage.dart';

class HomePage extends StatelessWidget {

  final UpComingController upcomingController = Get.put(UpComingController());

  @override
  Widget build(BuildContext context) {
    upcomingController.fetchUpComing();
     return  Scaffold(
       appBar: null,
       body: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisSize: MainAxisSize.min,
         children: [
           Expanded(child: Obx(() {
             if (upcomingController.isLoading.value) {
               return Center(child: CircularProgressIndicator());
             } else {
               return GridView.count(
                   crossAxisCount: 2,
                   children:
                   List.generate(upcomingController.movies.length, (index) {
                     return Center(
                         child: GestureDetector(
                             onTap: () {
                               Get.to(DetailPage(upcomingController.movies[index]));
                             },
                             child: Column(
                               children: [
                                 Image.network(Constant.imagePath +
                                         upcomingController.movies[index].posterPath,
                                     height: 150),
                                 Text(upcomingController.movies[index].title)
                               ],
                             )));
                   }));
             }
           }))
         ],
       ),
     );
  }
}