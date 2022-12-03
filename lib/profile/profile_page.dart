
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';

import '../utils/Dev information.dart';
import '../widget/profile_container.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}


class _UserProfilePageState extends State<UserProfilePage> {

  _showDevInformationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text('Dev information')),
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          content: SingleChildScrollView(
            child: Container(
                width: 0.9.sw,
                height: 0.5.sh,
                child: DevInformation().DevInfo()),
          ),
        );
      },
    );
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }


  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "My profile",
                  style: GoogleFonts.akshar(fontSize: 20, color: Colors.black),
                ),
                SizedBox(height: 21),
                ProfileContainer(),
                SizedBox(height: 21),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 9.0),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[200]!,
                                blurRadius: 3.0,
                                offset: Offset(0, 1))
                          ],
                          color: Colors.white,
                        ),
                        child: ListTile(
                          onTap: () {

                          },
                          leading: Container(
                            padding: EdgeInsets.all(9),
                            decoration: BoxDecoration(
                                color: Color(0xff8d7bef),
                                shape: BoxShape.circle),
                            child: Icon(Icons.my_location, color: Colors.white),
                          ),
                          title: Text("Location"),
                          subtitle: Text(
                              "Tap and change your current city or country"),
                          trailing: IconButton(
                              icon: Icon(Icons.chevron_right),
                              onPressed: () {}),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 9.0),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[200]!,
                                blurRadius: 3.0,
                                offset: Offset(0, 1))
                          ],
                          color: Colors.white,
                        ),
                        child: ListTile(
                          onTap: () {

                          },
                          leading: Container(
                            padding: EdgeInsets.all(9),
                            decoration: BoxDecoration(
                                color: Color(0xfff468b9),
                                shape: BoxShape.circle),
                            child: Icon(Icons.phone, color: Colors.white),
                          ),
                          title: Text("Personal information"),
                          subtitle: Text("Name,mail,some additional info"),
                          trailing: IconButton(
                              icon: Icon(Icons.chevron_right),
                              onPressed: () {}),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 9.0),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[200]!,
                                blurRadius: 3.0,
                                offset: Offset(0, 1))
                          ],
                          color: Colors.white,
                        ), //
                        child: ListTile(
                          onTap: () {
                            showSnackBar('Comming Soon');
                          },
                          leading: Container(
                            padding: EdgeInsets.all(9),
                            decoration: BoxDecoration(
                                color: Color(0xffffca59),
                                shape: BoxShape.circle),
                            child: Icon(Icons.settings, color: Colors.white),
                          ),
                          title: Text("General Settings"),
                          subtitle: Text("Change theme,prefers and much more "),
                          trailing: IconButton(
                              icon: Icon(Icons.chevron_right),
                              onPressed: () {}),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 9.0),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[200]!,
                                blurRadius: 3.0,
                                offset: Offset(0, 1))
                          ],
                          color: Colors.white,
                        ),
                        child: ListTile(
                          onTap: () {
                            _showDevInformationDialog(context);
                          },
                          leading: Container(
                            padding: EdgeInsets.all(9),
                            decoration: BoxDecoration(
                                color: Color(0xff5bd2d4),
                                shape: BoxShape.circle),
                            child:
                                Icon(Icons.question_mark, color: Colors.white),
                          ),
                          title: Text("About me"),
                          subtitle: Text("Some information about the developer and the application"),
                          trailing: IconButton(
                              icon: Icon(Icons.chevron_right),
                              onPressed: () {}),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 9.0),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[200]!,
                                blurRadius: 3.0,
                                offset: Offset(0, 1))
                          ],
                          color: Colors.white,
                        ),
                        child: ListTile(
                          onTap: () {

                          },
                          leading: Container(
                            padding: EdgeInsets.all(9),
                            decoration: BoxDecoration(
                                color: Colors.brown, shape: BoxShape.circle),
                            child: FaIcon(
                                FontAwesomeIcons.arrowRightFromBracket,
                                color: Colors.white),
                          ),
                          title: Text("Logout"),
                          subtitle: Text("Logout,refresh app data"),
                          trailing: IconButton(
                              icon: Icon(Icons.chevron_right),
                              onPressed: () {}),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
