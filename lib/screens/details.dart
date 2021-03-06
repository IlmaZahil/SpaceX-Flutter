import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_x/screens/card_list.dart';
import 'package:space_x/screens/menu.dart';
import 'package:space_x/screens/notifications.dart';

import '../services/apidetails.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
          icon: Icon(Icons.menu_outlined),
          onPressed: () {
            scaffoldKey.currentState.openDrawer();
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => LoginPage()),
            // );
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
            child: IconButton(
              icon: Icon(
                Icons.notifications_active_outlined,
                color: Color(0xff336FF3),
              ),
              onPressed: () {
                scaffoldKey.currentState.openEndDrawer();
              },
            ),
          ),
        ],
      ),
      endDrawer: Notifications(),
      drawer: Menu(),
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
      // color: Color(0xffDFD0C9),
      child: Center(
        child: Stack(
          children: <Widget>[
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 130.0),
                  child: Container(
                    height: 420,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Color(0xffADD1FA),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(150),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0, left: 0),
                        ),
                        Text(
                          "Crs20hihuo",
                          style: GoogleFonts.poppins(
                              color: Color(0xff336FF3),
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        Image.network(
                          'https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png',
                          height: 200,
                          width: 200,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                            style: GoogleFonts.poppins(
                                color: Color(0xff336FF3),
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
        child: Container(
          child: FutureBuilder(
            future: getApiData(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                    // Text('loading')
                  ),
                );
              } else
                return ListView.builder(
                  // itemCount: snapshot.data.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: EdgeInsets.only(
                        left: i == 0 ? 20 : 0,
                        right: 20,
                      ),
                      height: 300,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Color(0xffADD1FA),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(100.0),
                        child: Column(
                          children: [
                            Text(
                              snapshot.data[i].launch_year,
                              style: GoogleFonts.poppins(
                                color: Color(0xff336FF3),
                                fontSize: 20,
                              ),
                            ),
                            Image.network(
                              snapshot.data[i].mission_patch,
                              height: 50,
                              width: 50,
                            ),
                          ],
                        ),
                      ),

                      // child: Image.asset(
                      //   details[index]['image'],
                      // ),
                    );
                  },
                );
            },
          ),
        ));
  }
}
