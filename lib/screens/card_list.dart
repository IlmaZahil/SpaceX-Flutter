import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_x/models/api_model.dart';
import 'package:space_x/screens/details.dart';
import 'package:space_x/screens/login_page.dart';
import '../services/apidetails.dart';
// import 'package:dio/dio.dart';

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // getdetails();
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        brightness: Brightness.dark,
        leading: IconButton(
          color: Color(0xff336FF3),
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ),
        backgroundColor: Color(0xffADD1FA),
        title: Text(
          "SpaceX",
          style: GoogleFonts.poppins(
              color: Color(0xff336FF3),
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.favorite_outlined, color: Color(0xff336FF3)),
          )
        ],
      ),
      body: Card(),
    );
  }
}

class Card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0xff336FF3), Color(0xffADD1FA)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      // color: ,
      child: Center(
        child: Container(
          width: 350,
          child: ListView.builder(
            // itemCount: details.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Details()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(
                    top: index == 0 ? 20 : 0,
                    bottom: 20,
                  ),
                  height: 300,
                  decoration: BoxDecoration(
                    color: Color(0xffADD1FA),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              "assets/images/img1.png",
                              height: 50.0,
                              width: 50.0,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Text(
                              //   details[index]['title'],
                              //   style: GoogleFonts.poppins(
                              //       color: Color(0xff336FF3),
                              //       fontSize: 25,
                              //       fontWeight: FontWeight.w400),
                              // ),
                              // Text(
                              //   details[index]['subtitle'],
                              //   style: GoogleFonts.poppins(
                              //       color: Color(0xff336FF3),
                              //       fontSize: 15,
                              //       fontWeight: FontWeight.w400),
                              // ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: FutureBuilder<List<Spacex>>(
                          future: DetailsApiServices().fetchDetails(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return ListView.builder(
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(
                                          snapshot.data![index].flight_number),
                                      subtitle: Text(
                                          snapshot.data![index].mission_name),
                                    );
                                  });
                            }
                          },
                        ),
                      ),

                      // Image.asset(
                      //   details[index]['mainimg'],
                      //   height: 200,
                      //   width: 250,
                      // ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
