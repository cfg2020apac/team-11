import 'package:flutter/animation.dart';

class Profile {
  String name;
  String noOfcompletedEvents;
  String noOfUpComingEvents;
  String imageUrl;

  Profile(String name, String noOfcompletedEvents){
    this.name = name;
    this.noOfcompletedEvents = noOfcompletedEvents;
    this.noOfUpComingEvents = "0";
    this.imageUrl = "https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png";
  }


}