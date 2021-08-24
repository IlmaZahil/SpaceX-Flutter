import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/apidetails.dart';

class Details extends StatelessWidget {
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
        child: Stack(
          children: <Widget>[
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Container(
                    height: 420,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Color(0xffFBD3E9),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(150),
                          bottomRight: Radius.circular(10)),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey.shade200,
                      //     blurRadius: 6,
                      //     offset: Offset(0, 6),
                      //   ),
                      // ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0, left: 0),
                        ),
                        Text(
                          "Crs20hihuo",
                          style: GoogleFonts.poppins(
                              color: Color(0xffBB377D),
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        Image.asset(
                          "assets/images/space.png",
                          height: 200,
                          width: 200,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                            style: GoogleFonts.poppins(
                                color: Color(0xffBB377D),
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ScrollView(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: details.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(
              left: index == 0 ? 20 : 0,
              right: 20,
            ),
            height: 300,
            width: 350,
            decoration: BoxDecoration(
              color: Color(0xffFBD3E9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(
              details[index]['image'],
            ),
          );
        },
      ),
    );
  }
}


// SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Container(
//         height: 300,
//         width: 350,
//         decoration: BoxDecoration(
//           color: Color(0xffFBD3E9),
//           borderRadius: BorderRadius.circular(20),
//           // boxShadow: [
//           //   BoxShadow(
//           //     color: Colors.grey.shade200,
//           //     blurRadius: 6,
//           //     offset: Offset(0, 6),
//           //   ),
//           // ],
//         ),
//         child: Image.asset(
//           "assets/images/img2.png",
//           height: 500,
//           width: 500,
//         ),
//       ),
//     );