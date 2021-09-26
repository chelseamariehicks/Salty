import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TutorialPage extends StatelessWidget {
  //const TutorialPage({ Key? key }) : super(key: key);

  //Currently set to Play Point Break trailer
  //static String videoID = 'UuVDrpl1tIY';

  //YouTube ID for Salty Tutorial Video
  static String videoID = 'N7wr9q2oSBw';

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: videoID,
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
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
            SizedBox(
              width: null,
              height: 50.0,
            ),
            Text(
              "How to get Salty 💦 ",
              style: GoogleFonts.roboto(
              fontWeight: FontWeight.w200,
              fontSize: 40,
              ),
            ),
            SizedBox(
              width: null,
              height: 25.0,
            ),
            //Video hosted on Youtube and included using youtube_player_flutter
            SizedBox(
              width: 400.0,
              height: 250.0,
              child: DecoratedBox(
                decoration:  BoxDecoration(
                  color: Colors.black,
                ),
                child: Center(
                  child: YoutubePlayer(
                    controller: _controller,
                    bottomActions: [
                      CurrentPosition(),
                      ProgressBar(isExpanded: true),
                    ],
                  ),
                  
                    /*Text(
                    "Video tutorial coming soon!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                    ),
                  ),*/
                ),
              ),
            ),
            SizedBox(
              width: null,
              height: 25.0,
            ),
            Text(
              " Are you stoked? 😎 ",
              style: GoogleFonts.roboto(
              fontWeight: FontWeight.w200,
              fontSize: 32,
              ),
            ),
            SizedBox(
              width: null,
              height: 15.0,
            ),
            Text(
              "Let's get out there!",
              style: GoogleFonts.roboto(
              fontWeight: FontWeight.w200,
              fontSize: 32,
              ),
            ),
            SizedBox(
              width: null,
              height: 30.0,
            ),
            Text(
              "Vaya con Dios, Brah!",
              style: GoogleFonts.roboto(
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.italic,
              fontSize: 24,
              ),
            ),
            SizedBox(
              width: null,
              height: 15.0,
            ),
            Image.asset(
              'assets/images/vaya_con_dios.png',
              width: 150.0,
              height: 150.0,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
      
    );
  }
}