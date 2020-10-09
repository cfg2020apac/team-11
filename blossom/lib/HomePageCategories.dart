import 'package:flutter/material.dart';

class HomePageCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0,
      child: ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                elevation: 5,
                child: Center(child: Text('Category ' + index.toString())));
          }),
    );
  }
}
