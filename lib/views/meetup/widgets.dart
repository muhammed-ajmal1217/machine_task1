import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Authors extends StatelessWidget {
  const Authors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SizedBox(
        height: 40,
        child: Stack(
          children: [
            Positioned(
              top: 0, 
              left: 0,
              child: CircleAvatar(
                backgroundImage:
                    AssetImage('assets/officeboy1.jpg'),
              ),
            ),
            Positioned(
              top: 0, 
              left: 25,
              child: CircleAvatar(
                backgroundImage:
                    AssetImage('assets/officeboy2.jpg'),
              ),
            ),
            Positioned(
              top: 0, 
              left: 50,
              child: CircleAvatar(
                backgroundImage:
                    AssetImage('assets/officeboy3.jpg'),
              ),
            ),
            Positioned(
              top: 0, 
              left: 75,
              child: CircleAvatar(
                backgroundImage:
                    AssetImage('assets/officeboy4.jpg'),
              ),
            ),
            Positioned(
              top: 0, 
              left: 100,
              child: CircleAvatar(
                backgroundImage:
                    AssetImage('assets/officeboy5.jpg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class TrendingPopularPeople extends StatelessWidget {
  const TrendingPopularPeople({
    super.key,
    required this.color,
    required this.color1,
  });

  final Color color;
  final Color color1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 280,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: color),
                  ),
                  child: Icon(
                    Iconsax.pen_add,
                    color: color,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Author',
                      style: TextStyle(
                          color: color1,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "1,028 Meetups",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
          ),
          Center(
              child: Text(
            '_______________________________________',
            style: TextStyle(color: Colors.grey),
          )),
          Authors(),
        ],
      ),
    );
  }
}
