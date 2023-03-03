import 'package:flutter/material.dart';

import '../Widget/CastList.dart';
import '../model/upcoming.dart';



class DetailPage extends StatelessWidget {
  Movie detail;
  DetailPage(this.detail);

  Widget build(BuildContext context) {
    var casts = new CastList(this.detail.id);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("MovieDB"),
        ),
        body:
        Card(
          elevation: 50,
          shadowColor: Colors.black,
          child:  Column(
            children: [
              Row(
                children: [
                  Image.network("https://image.tmdb.org/t/p/w185_and_h278_bestv2/" + detail.posterPath, height: 150),
                  Padding(padding: EdgeInsets.all(10),child:
                  Column(
                    children: [
                      Text("ID : " + detail.id.toString()),
                      Text("Title : " + detail.title),
                      Text("Popularity :" + detail.popularity.toString())
                    ],
                  ))
                ],
              ),
              casts
            ],
          ),
        )
       );
  }
}