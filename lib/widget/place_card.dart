import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gradientStatusTag.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    Key? key,
    required this.place,
    required this.onPressed,
  }) : super(key: key);

  final String place;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    var PlaceStatus = 'status tag';
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                image: AssetImage(place),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.black26, BlendMode.darken))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/image/google.png'),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mohamed amine',
                        style: TextStyle(color: Colors.white)),
                    Text(' yesterday at 9:10 pm',
                        style: TextStyle(color: Colors.white70)),
                  ],
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more,
                      color: Colors.white,
                    ))
              ],
            ),
            const Spacer(),
            Text(
              'Hotel Tataouine',
              style: TextStyle(),
            ),
            const SizedBox(
              height: 10,
            ),
            GradientStatusTag(PlaceStatus: PlaceStatus),
            const Spacer(),
            Row(
              children: [
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_outline),
                    style: TextButton.styleFrom(
                        primary: Colors.white, shape: const StadiumBorder()),
                    label: Text('721')),
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.reply),
                    style: TextButton.styleFrom(
                        primary: Colors.white, shape: const StadiumBorder()),
                    label: Text('150'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
