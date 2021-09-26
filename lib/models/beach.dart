/*
Future improvement to create objects and use Firebase for the backend
//https://flutter.dev/docs/development/data-and-backend/json

import 'dart:convert';

class Beach {
  final String beachName;
  final String beachDescription;

  //hardcode rating to start, future iterations will use average from reviews
  //final String rating;

  //use yes or no
  final String parking;
  final String restroom;
  final String restaurants;

  //Associated with categories for beaches - use yes or no
  final String surfing;
  final String hiking;
  final String chillaxing;
  final String camping;
  final String eating;

  Beach({
    this.beachName, 
    this.beachDescription, 
    this.parking,
    this.restroom,
    this.restaurants,
    this.surfing,
    this.hiking,
    this.camping,
    this.chillaxing,
    this.eating
  });

  //IDK, this is from dart adventure and probably isn't the way to do this
  Beach.nullBeach() : beachName = 'Null', beachDescription = 'Null';

  Beach.fromJson(Map<String, dynamic> json)
    : beachName = json['beachName'],
      beachDescription = json['beachDescription'],
}
*/
