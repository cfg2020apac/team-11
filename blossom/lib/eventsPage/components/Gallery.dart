import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Gallery extends StatelessWidget {
  final Size size;

  Gallery({this.size});

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return
      CarouselSlider(
        options: CarouselOptions(height: 200),
        items: ['https://firebasestorage.googleapis.com/v0/b/jpmc-team11-2da73.appspot.com/o/images%2FDiscovering%20Treasure%20Through%20Stories%20%E8%AF%BB%E6%95%85%E4%BA%8B%E6%8E%98%E5%AE%9D%20%40%20Tohyi.jpg?alt=media&token=746ab32e-b023-4e64-9430-286d4e212ace',
                'https://firebasestorage.googleapis.com/v0/b/jpmc-team11-2da73.appspot.com/o/images%2Fimage_5aa519be618da7.82236375.jpg?alt=media&token=4734e68b-d7b8-41ed-9d56-fdd840a47c7b'
        ].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: size.width,
                // margin: EdgeInsets.symmetric(horizontal: 0),
                decoration: BoxDecoration(
                  color: Colors.black
                ),
                child: Image.network(i, width: size.width, height : size.height)
              );
            },
          );
        }).toList(),
      );
  }
}