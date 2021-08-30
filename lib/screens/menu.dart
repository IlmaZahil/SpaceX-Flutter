import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_x/screens/card_list.dart';
import 'package:space_x/screens/details.dart';
import 'package:space_x/screens/login_page.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color(0xffADD1FA),
      ),
      // child: ClipPath(
      // clipper: CPath(),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Padding(
            // padding: const EdgeInsets.only(left: 30.0),
            DrawerHeader(
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        backgroundColor: Color(0xffADD1FA),
                        backgroundImage: AssetImage(
                          "assets/images/space.png",
                        ),
                        radius: 50,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight - Alignment(0, .3),
                      child: Text(
                        "SpaceX",
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff336FF3),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight + Alignment(0, .2),
                      child: Text(
                        "spacex@gmail.com",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                gradient: LinearGradient(
                  colors: [
                    Color(0xff336FF3),
                    Color(0xffADD1FA),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            // ),
            SizedBox(
              height: 80,
            ),
            new TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Details()),
                );
              },
              child: Text(
                'Details Page',
                style: GoogleFonts.poppins(
                  color: Color(0xff336FF3),
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),

            Divider(
              height: 20,
              color: Color(0xff336FF3),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            new TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CardList()),
                );
              },
              child: Text(
                'CardList Page',
                style: GoogleFonts.poppins(
                  color: Color(0xff336FF3),
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            Divider(
              height: 20,
              color: Color(0xff336FF3),
            ),
            new TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 90,
                  ),
                  Text(
                    'Log Out',
                    style: GoogleFonts.poppins(
                      color: Color(0xff336FF3),
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.logout_outlined,
                    color: Color(0xff336FF3),
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
