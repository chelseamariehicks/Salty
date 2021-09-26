//import 'dart:html';
//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import 'dart:async';
import 'dart:convert';

import 'review_page.dart';

Future<Weather> fetchWeather(String beachname) async {
  final response = await http
    .get(Uri.parse('http://flip1.engr.oregonstate.edu:8092/weather/today?location=' + beachname));

    if(response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    }
    else {
      throw Exception('Wipeout! Weather data not available!');
    }

}

Future<BeachMap> fetchBeachMap(String beachname) async {
  var beachNum;

  if(beachname == "Cannon Beach") {
    beachNum = "1";
  }
  else if (beachname == "Indian Beach") {
    beachNum = "2";
  }
  else if (beachname == "Seaside Beach") {
    beachNum = "3";
  }
  else if (beachname == "Short Sands") {
    beachNum = "4";
  }
  else if (beachname == "Pacific City") {
    beachNum = "5";
  }
  else if (beachname == "Rockaway Beach") {
    beachNum = "6";
  }
  else if (beachname == "Gearhart Beach") {
    beachNum = "7";
  }
  else {
    beachNum = "1";
  }
  
  final response = await http
    .get(Uri.parse('http://flip3.engr.oregonstate.edu:14956/beach/' + beachNum));

    if(response.statusCode == 200) {
      return BeachMap.fromJson(jsonDecode(response.body));
    }
    else {
      throw Exception('Wipeout! Map data not available!');
    }


}

class BeachMap {
  final String name;
  final String state;
  final String src;
  //possibly rename to url
  final String href;

  BeachMap({
    required this.name,
    required this.state,
    required this.src,
    required this.href,
  });

  factory BeachMap.fromJson(Map<String, dynamic> json) {
    return BeachMap(
      name: json['name'], 
      state: json['state'], 
      src: json['src'], 
      href: json['href'],
    );
  }
}

class Weather {
  final String currTemp;
  final String high;
  final String low;
  final String weather;
  final String location;

  Weather({
    required this.currTemp,
    required this.high,
    required this.low,
    required this.weather,
    required this.location,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      currTemp: json['currTemp'],
      high: json['high'],
      low: json['low'],
      weather: json['weather'],
      location: json['location'],
    );
  }
}

class BeachPage extends StatefulWidget {
  String beachName;

  BeachPage({ Key? key, required this.beachName}) : super(key: key);

  @override
  _BeachPageState createState() => _BeachPageState();
}

class _BeachPageState extends State<BeachPage> {
  late Future<Weather> futureWeather;
  late Future<BeachMap> futureBeachMap;

  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather(this.widget.beachName);
    futureBeachMap = fetchBeachMap(this.widget.beachName);
  }

  @override
  Widget build(BuildContext context) {
    String beachName = this.widget.beachName;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey.shade600),
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        shadowColor: Colors.white,
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xffb23ade),
        foregroundColor: Colors.white,
        //hoverColor: ,
        //hoverElevation: ,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => 
          ReviewPage()));
        },
        icon: Icon(Icons.add),
        label: Text(
          'Write a Review',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "$beachName",
              style: GoogleFonts.roboto(
              fontWeight: FontWeight.w300,
              fontSize: 40,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              color: Colors.grey.shade600,
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                generalDataFeature("🚙 parking? ", "$beachName"),
                generalDataFeature("🚽 public restrooms? ", "$beachName"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                generalDataFeature("⛺️ camping? ", "$beachName"),
                generalDataFeature("🍕 nearby restaurants? ", "$beachName"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                generalDataFeature("🥾 hiking nearby? ", "$beachName"),
                generalDataFeature("🌊 surfing? ", "$beachName"),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 400,
                  child:
                  beachDescription(beachName),
                ),
              ],
            ),
            Divider(
              color: Colors.grey.shade600,
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: 
                ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    //Map service provided by Patrick
                    SizedBox(
                      width: 400.0,
                      height: 200.0,
                      child: DecoratedBox(
                        decoration:  BoxDecoration(
                          color: Colors.lime,
                        ),
                        child: FutureBuilder<BeachMap>(
                          future: futureBeachMap,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Want to check out a map? 🗺',
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 24,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Type this website into your browser:',
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(padding: EdgeInsets.all(20),
                                    child: Text(
                                      snapshot.data!.href,
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                     
                                ],
                              );
                            }
                            else if(snapshot.hasError) {
                              return Center(
                                child: Text(
                                  '                Whoa, wipeout! \n \n Check back later for map data!',
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                  ),
                                ),
                              );
                            }
                            return const CircularProgressIndicator(); 
                          },

                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    //Weather service provided by OSU student Jeremy Marr
                    //https://github.com/osu-cs-361/marrj/tree/master/WeatherService
                    //http://flip1.engr.oregonstate.edu:8092/weather/today?location=Cannon%20Beach
                    SizedBox(
                      width: 400.0,
                      height: 200.0,
                      child: DecoratedBox(
                        decoration:  BoxDecoration(
                          color: Colors.cyan,
                        ),
                        child: FutureBuilder<Weather>(
                          future: futureWeather,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "What's the weather like right now?",
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 24,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        snapshot.data!.weather + "    🌡 ",
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 22,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data!.currTemp + "ºF",
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Today's high: " + snapshot.data!.high + "ºF     ",
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "Today's low: " + snapshot.data!.low + "ºF",
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }
                            else if(snapshot.hasError) {
                              return Center(
                                child: Text(
                                  '                Whoa, wipeout! \n \n Check back later for weather data!',
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                  ),
                                ),
                              );
                            }
                            return const CircularProgressIndicator();
                          }
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    const Divider(),
                    Text(
                      " Reviews",
                      style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w300,
                      fontSize: 28,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    displayReviews(beachName),
                  ],
                ),
            ),
            
          ],
        ),
      ),
      
    );
  }
}

//Widget function to fill in the General Data section for each beach
Widget generalDataFeature(String feature, String beachName) {

  var emoji;

  if (
    beachName == "Indian Beach" && feature == "🍕 nearby restaurants? " ||
    beachName == "Short Sands" && feature == "🍕 nearby restaurants? " ||
    beachName == "Short Sands" && feature == "⛺️ camping? " || 
    beachName == "Gearhart Beach" && feature == "🌊 surfing? " ||
    beachName == "Gearhart Beach" && feature == "⛺️ camping? " ||
    beachName == "Gearhart Beach" && feature == "🥾 hiking nearby? " ||
    beachName == "Rockaway Beach" && feature == "⛺️ camping? ") {

    emoji = "❌";
  }
  else {
    emoji = "✅";
  }

  return Text(
    "$feature $emoji",
    style: GoogleFonts.roboto(
    fontWeight: FontWeight.w300,
    fontSize: 20,
    ),
  );
}

//Add to beach description text as desired
Widget beachDescription(String beachName) {
  var descriptionText;

  if(beachName == "Cannon Beach") {
    descriptionText = "Looking to find where all the locals hang out? Sorry doods, the locals don't hang in Cannon Beach! This is the perfect place to show off your tech company's down vest on cool morning walks. It's also a great place for families.";
  }
  else if (beachName == "Short Sands") {
    descriptionText = "Don't come here. You have to walk through an old growth forest to even get to the ocean. In fact, you should probably move to California.";
  }
  else if (beachName == "Pacific City") {
    descriptionText = "Home to the original Pelican Brewery and largest Haystack Rock in Oregon. Climb the epic sand dunes, surf the break, grab food to go from Pelican--this is a prime spot for chillaxing.";
  }
  else {
    descriptionText = "There's sand, there's saltwater, you should definitely get here 🤘";
  }
  
  return Text(
    "$descriptionText",
    style: GoogleFonts.roboto(
    fontWeight: FontWeight.w300,
    fontSize: 18,
    ),
  );
}

Widget displayReviews(String beachName) {
  if(beachName == "Cannon Beach") {
    return review(
      "🤙 🤙 🤙 🤙", 
      "What a beach!", 
      "We walked the length of the beach and saw the puffins on Haystack Rock! It was glorious.",
    );
  }
  else if(beachName == "Pacific City") {
    return review(
      "🤙 🤙 🤙 🤙", 
      "Boogie Boarded all day", 
      "Moment Surf Company is by the beach and you can rent whatever gear you need!",
    );
  }
  else if(beachName == "Seaside Beach") {
    return review(
      "🤙 🤙 🤙 ", 
      "Pleasant stopover", 
      "Lots of amenities for travelers on the road--RV Park, lots of parking, grocery stores, places to eat.",
    );
  }
  else if(beachName == "Short Sands") {
    return review(
      "🤙 🤙 🤙 🤙", 
      "Best Beach in Oregon", 
      "The walk through the old growth forest to the beach is worth it alone! Lots of surfers out on the water, muddy but fun hiking trails with exceptional views!",
    );
  }
  else if(beachName == "Rockaway Beach") {
    return review(
      "🤙 🤙 🤙 ", 
      "Birthplace of the corndog!", 
      "Visit Pronto Pup to taste the original corndog (vegan options too) and maybe even ride the world's first mechanical corndog.",
    );
  }
  else {
    return
    review(
      "🤙 🤙 🤙 🤙", 
      "Johnny Utah probably digs it!", 
      "We don't have any reviews for this beach yet, so tell us what you think brah!",
    );
  }
}

Widget review(String rating, String heading, String body) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Align(
        alignment: Alignment(-0.9, 0.0),
        child: 
          Text(
            "$rating",
            style: 
              GoogleFonts.roboto(
                fontWeight: FontWeight.w300,
                fontSize: 28,
              ),
          ),
      ),
      Align(
        alignment: Alignment(-0.9, 0.0),
        child: 
          Text(
            "$heading",
            style: 
              GoogleFonts.roboto(
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
                fontSize: 24,
              ),
          ),
      ),
      Container(
        width: 400,
        child: 
          Text(
            "$body",
            style: 
              GoogleFonts.roboto(
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
                fontSize: 18,
              ),
          ),
      ),
      SizedBox(
        height: 20,
      ),
    ],
  );

}

_launch(String url) async {
  if(await canLaunch(url)) {
    await launch(url);
  }
  else {
    throw 'Could not launch $url';
  }
}