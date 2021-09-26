import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'beach_page.dart';


//ignore must be immutable
class CategoryPage extends StatefulWidget {
  String categorySelected;

  CategoryPage({Key? key, required this.categorySelected}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  
  @override
  Widget build(BuildContext context) {
    String category = this.widget.categorySelected;
    //var categoryChoice = category;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey.shade600),
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        shadowColor: Colors.white,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Alriiiiight!",
              style: GoogleFonts.roboto(
              fontWeight: FontWeight.w100,
              fontSize: 48,
              ),
            ),
            Text(
              "Let's $category!",
              style: GoogleFonts.roboto(
              fontWeight: FontWeight.w100,
              fontSize: 48,
              ),
            ),
            Flexible(
              child: GridView.count(
                padding: const EdgeInsets.all(15),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: [
                  InkWell(
                    child: beachTile("Cannon Beach", "      🤙 🤙 🤙 🤙 ", category),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => 
                      BeachPage(beachName: "Cannon Beach")),
                    );
                    },
                  ),
                  InkWell(
                    child: beachTile("Gearhart Beach", "          🤙 🤙 🤙  ", category),
                    onTap: () {
                      if (category == "camp" || category == "surf" || category == "hike") {
                        //do nothing
                      }
                      else {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => 
                        BeachPage(beachName: "Gearhart Beach")),
                        );
                      }
                    },
                  ),
                  InkWell(
                    child: beachTile("Short Sands", "             🤙 🤙 🤙 🤙 ", category),
                    onTap: () {
                      if (category == "camp" || category == "eat") {
                        //do nothing
                      }
                      else {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => 
                        BeachPage(beachName: "Short Sands")),
                        );
                      }
                    },
                  ),
                  InkWell(
                    child: beachTile("Indian Beach", "                 🤙 🤙 🤙 🤙 ", category),
                    onTap: () {
                      if (category == "eat") {
                        //do nothing
                      }
                      else {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => 
                        BeachPage(beachName: "Indian Beach")),
                        );
                      }
                    },
                  ),
                  InkWell(
                    child: beachTile("Seaside Beach", "      🤙 🤙 🤙  ", category),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => 
                      BeachPage(beachName: "Seaside Beach")),
                    );
                    },
                  ),
                  InkWell(
                    child: beachTile("Pacific City", "          🤙 🤙 🤙 🤙  ", category),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => 
                      BeachPage(beachName: "Pacific City")),
                    );
                    },
                  ),
                  InkWell(
                    child: beachTile("Rockaway Beach", "       🤙 🤙 🤙   ", category),
                    onTap: () {
                      if (category == "camp") {
                        //do nothing
                      }
                      else {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => 
                        BeachPage(beachName: "Rockaway Beach")),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

Widget beachTile(String tileText, String rating, String category) {
  if(
    category == "surf" && tileText == "Gearhart Beach" ||
    category == "camp" && tileText == "Rockaway Beach") {

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2.5)
      ),
      child: Image.asset(
        'assets/images/PB_wetsuit_beach.jpg',
        width: 150.0,
        height: 150.0,
        fit: BoxFit.cover,
      ),
    );
  }
  else if(
    category == "camp" && tileText == "Gearhart Beach" ||
    category == "eat" && tileText == "Short Sands") {

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2.5)
      ),
      child: Image.asset(
        'assets/images/PB_beach_chat.jpg',
        width: 150.0,
        height: 150.0,
        fit: BoxFit.cover,
      ),
    );

  }
  else if(
    category == "camp" && tileText == "Short Sands" ||
    category == "hike" && tileText == "Gearhart Beach") {

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2.5)
      ),
      child: Image.asset(
        'assets/images/PB_sky_dive.jpg',
        width: 150.0,
        height: 150.0,
        fit: BoxFit.cover,
      ),
    );

  }
  else if(
    category == "eat" && tileText == "Indian Beach") {

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2.5)
      ),
      child: Image.asset(
        'assets/images/PB_surf_over_work.jpeg',
        width: 150.0,
        height: 150.0,
        fit: BoxFit.cover,
      ),
    );

  }
  else {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2.5)
      ),
      child: Text(
        '$tileText $rating',
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.w300,
          fontSize: 32,
        ),
      ),
    );
  }
}