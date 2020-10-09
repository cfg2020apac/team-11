import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Gallery extends StatelessWidget {
  final Size size;
  final List imageUrls;

  Gallery({this.size, this.imageUrls});

  @override
  Widget build(BuildContext context) {
    print(imageUrls);
    //Size size = MediaQuery.of(context).size;
    return CarouselSlider(
      options: CarouselOptions(height: 200),
      items: imageUrls.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: size.width,
                // margin: EdgeInsets.symmetric(horizontal: 0),
                decoration: BoxDecoration(color: Colors.black),
                child:
                    Image.network(i, width: size.width, height: size.height));
          },
        );
      }).toList(),
    );
  }
}
