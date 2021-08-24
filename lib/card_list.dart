import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_x/details.dart';

import 'models/apidetails.dart';

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffBB377D),
        title: Text(
          "SpaceX",
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.favorite_outlined),
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
            colors: [Color(0xffFBD3E9), Color(0xffBB377D)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Center(
        child: Container(
          width: 350,
          child: ListView.builder(
            itemCount: details.length,
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
                    color: Color(0xffFBD3E9),
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
                              Text(
                                details[index]['title'],
                                style: GoogleFonts.poppins(
                                    color: Color(0xffBB377D),
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                details[index]['subtitle'],
                                style: GoogleFonts.poppins(
                                    color: Color(0xffBB377D),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Image.asset(
                        details[index]['mainimg'],
                        height: 200,
                        width: 250,
                      ),
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
