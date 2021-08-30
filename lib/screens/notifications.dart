import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color(0xffADD1FA),
      ),
      child: ClipPath(
        clipper: CPath(),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: DrawerHeader(
                  child: Container(
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topCenter + Alignment(0, 0.5),
                          child: Icon(
                            Icons.notifications_active_outlined,
                            color: Colors.white,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter + Alignment(0, 1.2),
                          child: Text(
                            "Notifications",
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.only(
                    //     bottomLeft: Radius.circular(30),
                    //     bottomRight: Radius.circular(30),
                    //   ),
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
              ),
              SizedBox(
                height: 50,
              ),
              Divider(
                height: 25,
                color: Color(0xff336FF3),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  // tileColor: Color(0xff336FF3),
                  leading: buildImage(),
                  title: Text(
                    'Name',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                        color: Color(0xff336FF3),
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),

                  subtitle: Text(
                    '1 min ago ',
                    style: GoogleFonts.poppins(
                      color: Color(0xff336FF3),
                      fontSize: 13,
                    ),
                  ), //
                  trailing: IconButton(
                    icon: Icon(Icons.navigate_next_sharp),
                    color: Color(0xff336FF3),
                    onPressed: () {},
                  ),
                ),
              ),
              Divider(
                height: 25,
                color: Color(0xff336FF3),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  // tileColor: Color(0xff336FF3),
                  leading: buildImage(),
                  title: Row(
                    children: [
                      Text(
                        'Name',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                            color: Color(0xff336FF3),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    '5 h ago ',
                    style: GoogleFonts.poppins(
                      color: Color(0xff336FF3),
                      fontSize: 13,
                    ),
                  ), //
                  trailing: IconButton(
                    icon: Icon(Icons.navigate_next_sharp),
                    color: Color(0xff336FF3),
                    onPressed: () {},
                  ),
                ),
              ),
              Divider(
                height: 25,
                color: Color(0xff336FF3),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  // tileColor: Color(0xff336FF3),
                  leading: buildImage(),

                  title: Row(
                    children: [
                      Text(
                        'Name',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                            color: Color(0xff336FF3),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    '1 day ago ',
                    style: GoogleFonts.poppins(
                      color: Color(0xff336FF3),
                      fontSize: 13,
                    ),
                  ), //
                  trailing: IconButton(
                    icon: Icon(Icons.navigate_next_sharp),
                    color: Color(0xff336FF3),
                    onPressed: () {},
                  ),
                ),
              ),
              Divider(
                height: 25,
                color: Color(0xff336FF3),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  // tileColor: Color(0xff336FF3),
                  leading: buildImage(),
                  title: Row(
                    children: [
                      Text(
                        'Name',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                            color: Color(0xff336FF3),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    '2 day ago ',
                    style: GoogleFonts.poppins(
                      color: Color(0xff336FF3),
                      fontSize: 13,
                    ),
                  ), //
                  trailing: IconButton(
                    icon: Icon(Icons.navigate_next_sharp),
                    color: Color(0xff336FF3),
                    onPressed: () {},
                  ),
                ),
              ),
              Divider(
                height: 25,
                color: Color(0xff336FF3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(50, 0);
    path.quadraticBezierTo(0, size.height / 2, 50, size.height);
    path.lineTo(size.width, size.height);
    // path.lineTo(size.width * 0.9, size.height - 50);
    // path.lineTo(size.width, size.height - 100);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

Widget buildImage() => ClipRRect(
      // radius: 25,
      child: Image.network(
        'https://img.freepik.com/free-photo/woman-with-beauty-face-clean-skin_186202-5677.jpg?size=338&ext=jpg',
        height: 50,
        width: 50,
        // fit: BoxFit.cover,
      ),
    );
