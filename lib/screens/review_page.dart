import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

//FIGURE OUT HOW TO SEND FORM DATA TO EMAIL-johnnyutah4ever@gmail.com
//import 'package:flutter_email_sender/flutter_email_sender.dart';
//https://pub.dev/packages/flutter_email_sender/example


class ReviewPage extends StatefulWidget {
  const ReviewPage({ Key? key }) : super(key: key);

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {

  final _formKey = GlobalKey<FormState>();

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
              "Are you amped?",
              style: GoogleFonts.roboto(
              fontWeight: FontWeight.w200,
              fontSize: 40,
              ),
            ),
            Text(
              "Tell us what you think, broski!",
              style: GoogleFonts.roboto(
              fontWeight: FontWeight.w200,
              fontSize: 32,
              ),
            ),
            SizedBox(height: 20.0),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    child: Text(
                      "How stoked are you about this beach?",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  RatingBar(
                    initialRating: 3,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                      full: Text('🤙'),
                      half: Text(''),
                      empty: Text('❓'),
                    ),
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    child:
                      TextFormField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'What\'s the headline?',
                        ),
                        /* Add form validation in the future
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Whoa! Don\'t forget a headline!';
                          }
                          return null;
                        },*/
                      ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    child:
                      TextFormField(
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'What was so rad about the beach?',
                        ),
                        /*Add form validation in the future
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'We gotta know what was so rad!';
                          }
                          return null;
                        },*/
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 16.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text(
                            '',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                            ),
                          ),
                          content: Text(
                            'Dude, are you sure you want to submit this review?',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w300,
                              fontSize: 24,
                            ),
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                side: BorderSide(width: 2.0, color: Colors.red),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                                child: Text(
                                  'Cancel',
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                    color: Colors.red,
                                  ),

                                ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              onPressed: () {
                                //Return to previous beach screen
                                Navigator.of(context)
                                  ..pop()
                                  ..pop();
                              }, 
                                child: Text(
                                  'Submit',
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                            ),
                          ],
                        ),
                      ),
                      /*Add form validation in the future
                      onPressed: () {
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                        if (_formKey.currentState!.validate()) {
                          // Process data.
                        }
                      },*/
                      child: Text(
                        'Submit',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w200,
                          fontSize: 30,
                        ),
                      ),
                    ),
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



