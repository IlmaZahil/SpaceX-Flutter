import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:space_x/global.dart';
// import 'package:space_x/visible_icon.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final model = Provider.of<VisibleIcon>(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                            colors: [Color(0xff36d1dc), Color(0xff5b86e5)],
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: Text(
                  "LOGIN",
                  style: GoogleFonts.poppins(
                      color: Colors.blue,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 40, right: 30),
                child: TextFiledWidget(
                  // onChanged: onChanged,
                  obscureText: true,
                  hintText: "UserName",
                  prefixIcon: Icons.account_circle_outlined,
                  sufixIcon: Icons.ac_unit,
                  // model.isValid ? Icons.check : null,
                  // onChanged: (value) {
                  //   // model.isValidUserName(value);
                  // }
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 40, right: 30),
                child: TextFiledWidget(
                  // onChanged: (value) {
                  //   // model.isValidUserName(value);
                  // },
                  obscureText: true,
                  hintText: "Password",
                  prefixIcon: Icons.lock_outlined,
                  sufixIcon: Icons.remove_red_eye_outlined,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 40, right: 30),
                child: Center(
                    child: ButtonWidget(title: "Login", hasBorder: true)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//TextFields
class TextFiledWidget extends StatelessWidget {
  // final Function onChanged;
  final bool obscureText;
  final String hintText;
  final IconData prefixIcon;
  final IconData sufixIcon;

  TextFiledWidget({
    // required this.onChanged,
    required this.obscureText,
    required this.hintText,
    required this.prefixIcon,
    required this.sufixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        // onChanged: onChanged(),
        obscureText: obscureText,
        style: TextStyle(color: Colors.blue, fontSize: 14),
        cursorColor: Colors.blue,
        decoration: InputDecoration(
            labelText: hintText,
            prefixIcon: Icon(prefixIcon, size: 18, color: Colors.blue),
            filled: true,
            suffixIcon: Icon(sufixIcon, size: 18, color: Colors.transparent),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue),
            ),
            labelStyle: TextStyle(color: Colors.blue),
            focusColor: Colors.blue),
      ),
    );
  }
}

//Login Button
class ButtonWidget extends StatelessWidget {
  final String title;
  final bool hasBorder;

  ButtonWidget({required this.title, required this.hasBorder});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          color: hasBorder ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: hasBorder
              ? Border.all(
                  color: Colors.blue,
                  width: 1.0,
                )
              : Border.fromBorderSide(BorderSide.none),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 60.0,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: hasBorder ? Colors.white : Colors.pink,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
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
