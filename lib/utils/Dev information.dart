import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelerapp/utils/app_constants.dart';
import 'package:url_launcher/url_launcher.dart';


class DevInformation{
  DevInformation();

  DevInfo(){
    return Container(
      child:
      Column(
       
        children: [
          Text('This application in version ${AppConstants.APP_VERSION}'),
          SizedBox(height: 5,),
          Text(' developed by'),
          SizedBox(height: 5,),
          Text('Bourouis Mohamed Amine',style: GoogleFonts.spaceMono(
            fontSize: 0.05.sw
          )),
          SizedBox(height: 5,),
          Text('For more information'),
          SizedBox(height: 5,),
          Text('Please contact me'),
          SizedBox(height: 50),

          GestureDetector(
            onTap: (){
              launchUrl(Uri(
                scheme: 'mailto',
                path: 'moha.amine.bou@gmail.com',
              ),
              );
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1)
                    ,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: ListTile(title: Text('Mail'),
                  subtitle: Text('moha.amine.bou@gmail.com'),
                  iconColor: Colors.teal,leading: CircleAvatar(backgroundColor: Colors.teal,child: Icon(CupertinoIcons.mail)),)),
          ),
          SizedBox(height: 15,),
          GestureDetector(
            onTap: (){
              launchUrl(Uri(
                scheme: 'https',
                    path:'www.facebook.com/moha.amine.bou'
              ));
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1)
                    ,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: ListTile(title: Text('Facebook'),iconColor: Colors.cyan,leading: CircleAvatar(backgroundColor: Colors.cyan,child:Icon(FontAwesomeIcons.facebook,color: Colors.white,)),)),
          ),
          SizedBox(height: 15,),
          GestureDetector(
            onTap: (){
              launchUrl(Uri(
                  scheme: 'https',
                  path:'https://www.linkedin.com/in/mohamed-amine-bourouis/'
              ));
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1)
                    ,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: ListTile(title: Text('Linkedin'),iconColor: Colors.purple,leading: CircleAvatar(backgroundColor: Colors.purple,child: Icon(FontAwesomeIcons.linkedin,color: Colors.white,)),)),
          ),
          SizedBox(height: 15,),
        ],
      )
    );
  }
}