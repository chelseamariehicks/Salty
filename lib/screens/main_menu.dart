import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'category_page.dart';
import 'tutorial_page.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({ Key? key }) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          leadingWidth: 0,
          title: Image.asset('assets/images/logo.png', 
            fit: BoxFit.contain,
            height: kToolbarHeight,
          ),
          backgroundColor: Colors.white,
          bottomOpacity: 0.0,
          toolbarOpacity: 0.0,
          shadowColor: Colors.white,
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                  "What's your vibe?",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w100,
                    fontSize: 48,
                  ),
              ),
              //Five Floating Action buttons to navigate to Category Pages
              ElevatedButton( 
                child: Tooltip (
                  message: "Click to find beach recommendations for surfing",
                  child: Text(
                  "  🌊  surfing      ",
                  style: 
                    GoogleFonts.roboto(
                      fontWeight: FontWeight.w300,
                      fontSize: 40,
                      color: Colors.black,
                    ),
                  ),
                ),
                
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => 
                  CategoryPage(categorySelected: "surf")),
                  );
                }, 
              ),
              ElevatedButton( 
                child: Tooltip (
                  message: "Click to find beach recommendations for hiking",
                  child: Text(
                  "  🥾  hiking        ",
                  style: 
                    GoogleFonts.roboto(
                      fontWeight: FontWeight.w300,
                      fontSize: 40,
                      color: Colors.black,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => 
                  CategoryPage(categorySelected: "hike")),
                  );
                }, 
              ),
              ElevatedButton( 
                child: Tooltip (
                  message: "Click to find beach recommendations for chillaxing",
                  child: Text(
                  "  🏖  chillaxing  ",
                  style: 
                    GoogleFonts.roboto(
                      fontWeight: FontWeight.w300,
                      fontSize: 40,
                      color: Colors.black,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => 
                  CategoryPage(categorySelected: "chillax")),
                  );
                }, 
              ), 
              ElevatedButton( 
                child: Tooltip (
                  message: "Click to find beach recommendations for camping",
                  child: Text(
                  "  ⛺️  camping   ",
                  style: 
                    GoogleFonts.roboto(
                      fontWeight: FontWeight.w300,
                      fontSize: 40,
                      color: Colors.black,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => 
                  CategoryPage(categorySelected: "camp")),
                  );
                }, 
              ),
              ElevatedButton( 
                child: Tooltip (
                  message: "Click to find beach recommendations for eating",
                  child: Text(
                  "   🍕  eating       ",
                  style: 
                    GoogleFonts.roboto(
                      fontWeight: FontWeight.w300,
                      fontSize: 40,
                      color: Colors.black,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => 
                  CategoryPage(categorySelected: "eat")),
                  );
                }, 
              ),
              SizedBox(
                width: null,
                height: 20.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton( 
                    child: Text(
                      "🏄‍♀️  tutorial",
                    style: 
                      GoogleFonts.roboto(
                        fontWeight: FontWeight.w300,
                        fontSize: 24,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TutorialPage()),
                    );
                  }, 
                  ),
                ],
              ),
            ], 
          ), 
        ),
        //Tutorial FAB to navigate to Tutorial Page
    );
  }
}