import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_x/screens/menu.dart';
import 'package:space_x/screens/notifications.dart';
import 'package:space_x/screens/details.dart';
import 'package:space_x/services/apidetails.dart';

var scaffoldKey = GlobalKey<ScaffoldState>();

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // getApiData();
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
          // links.mission_path_small,
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
          )
        ],
      ),
      endDrawer: Notifications(),
      drawer: Menu(),
      // ),
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
                      itemCount: snapshot.data.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Details()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                              top: i == 0 ? 20 : 0,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        snapshot.data[i].mission_patch,
                                        height: 50,
                                        width: 50,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data[i].launch_year,
                                          style: GoogleFonts.poppins(
                                            color: Color(0xff336FF3),
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 20.0,
                                    left: 20.0,
                                  ),
                                  child: Text(
                                    snapshot.data[i].details,
                                    style: GoogleFonts.poppins(
                                      color: Color(0xff336FF3),
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                }),
          ),
        ));
  }
}
