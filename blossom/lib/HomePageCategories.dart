import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePageCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Query query = FirebaseFirestore.instance.collection('events');

    return SizedBox(
      height: 80,
      child: StreamBuilder<QuerySnapshot>(
        stream: query.snapshots(),
        builder: (context, stream) {
          if (stream.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (stream.hasError) {
            return Center(child: Text(stream.error.toString()));
          }

          final List<QueryDocumentSnapshot> list = stream.data.docs;

          var categoryList = [];

          for (var i = 0; i < list.length; i++) {
            if (!categoryList.contains(list[i]['category_name'])) {
              categoryList.add(list[i]['category_name']);
            }
          }

          return ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    margin: EdgeInsets.all(8),
                    child: Chip(
                      label: Text(categoryList[index]),
                      labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      labelPadding: EdgeInsets.all(8),
                      backgroundColor: Colors.blue,
                      elevation: 3,
                ));
              });
        },
      ),
    );
    // return SizedBox(
    //   height: 80.0,
    //   child: ListView.builder(
    //       physics: ClampingScrollPhysics(),
    //       shrinkWrap: true,
    //       scrollDirection: Axis.horizontal,
    //       itemCount: 15,
    //       itemBuilder: (BuildContext context, int index) {
    //         return Card(
    //             elevation: 5,
    //             child: Center(child: Text('Category ' + index.toString())));
    //       }),
    // );
  }
}
