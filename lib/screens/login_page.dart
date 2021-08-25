import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:space_x/screens/card_list.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Color(0xffADD1FA),
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: DrawClip(),
                  child: Container(
                    height: size.height / 2.4,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xffADD1FA), Color(0xff336FF3)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        height: 250,
                        width: 250,
                        child: Image.asset(
                          "assets/images/space.png",
                          // fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    "LOGIN",
                    style: GoogleFonts.poppins(
                        color: Color(0xff336FF3),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 25.0, left: 40, right: 30),
                    child: Fileds(),
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

class Fileds extends StatefulWidget {
  @override
  _FiledsState createState() => _FiledsState();
}

class _FiledsState extends State<Fileds> {
  final _key = GlobalKey<FormState>();
  bool invisible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _key,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "UserName can not be empty";
                } else if (value != "test") {
                  return "Wrong UserName";
                } else
                  return null;
              },
              obscureText: false,
              style: TextStyle(
                color: Color(0xff336FF3),
                fontSize: 14,
              ),
              cursorColor: Color(0xff336FF3),
              decoration: InputDecoration(
                labelText: "UserName",
                prefixIcon: Icon(
                  Icons.account_circle_outlined,
                  size: 18,
                  color: Color(0xff336FF3),
                ),
                filled: true,
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color(0xff336FF3),
                  ),
                ),
                labelStyle: TextStyle(
                  color: Color(0xff336FF3),
                ),
                focusColor: Color(0xff336FF3),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Password can not be empty";
                } else if (value != "123456") {
                  return "Wrong Password";
                } else
                  return null;
              },
              obscureText: invisible,
              obscuringCharacter: "*",
              style: TextStyle(
                color: Color(0xff336FF3),
                fontSize: 14,
              ),
              cursorColor: Color(0xff336FF3),
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(
                  Icons.lock_outlined,
                  size: 18,
                  color: Color(0xff336FF3),
                ),
                suffixIcon: new GestureDetector(
                  onTap: () {
                    setState(() {
                      invisible = !invisible;
                    });
                  },
                  child: Icon(
                    invisible ? Icons.visibility : Icons.visibility_off,
                    size: 18,
                    color: Color(0xff336FF3),
                  ),
                ),
                filled: true,
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xff336FF3)),
                ),
                labelStyle: TextStyle(
                  color: Color(0xff336FF3),
                ),
                focusColor: Color(0xff336FF3),
              ),
            ),
            SizedBox(height: 40),
            Material(
              color: Color(0xffADD1FA),
              child: TextButton(
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CardList()),
                    );
                  }
                },
                child: Ink(
                  decoration: BoxDecoration(
                    color: Color(0xff336FF3),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                    border: Border.fromBorderSide(BorderSide.none),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 60.0,
                      width: 250,
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Color(0xffADD1FA),
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.1, size.height - 50);
    path.lineTo(size.width * 0.9, size.height - 50);
    path.lineTo(size.width, size.height - 100);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
