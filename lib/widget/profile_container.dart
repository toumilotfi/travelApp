import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(
          colors: [Colors.purple, Colors.purpleAccent],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200]!,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(2.3),
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: CircleAvatar(
                  maxRadius: 35.0,
                  backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2017/02/16/23/10/smile-2072907_960_720.jpg",
                  ),
                ),
              ),
              SizedBox(width: 21),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'me',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.akshar(
                                fontSize: 20, color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 15.0),
                        GestureDetector(
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          onTap: () {},
                        )
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      "A Tunisian visitor",
                      style:
                          GoogleFonts.akshar(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "0",
                    style:
                        GoogleFonts.akshar(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(height: 3.0),
                  Text(
                    "Wishlist",
                    style: TextStyle(color: Colors.grey[300]),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    "1",
                    style:
                        GoogleFonts.akshar(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(height: 3.0),
                  Text(
                    "Visited",
                    style: TextStyle(color: Colors.grey[300]),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Tunisia',
                    style:
                        GoogleFonts.akshar(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(height: 3.0),
                  Text(
                    "Origin",
                    style: TextStyle(color: Colors.grey[300]),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Tataouine",
                    style:
                        GoogleFonts.akshar(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(height: 3.0),
                  Text(
                    "City",
                    style: TextStyle(color: Colors.grey[300]),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
