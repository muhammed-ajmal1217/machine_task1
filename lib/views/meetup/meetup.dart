import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:machinetask/views/meetup/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Meetup extends StatefulWidget {
  const Meetup({Key? key});

  @override
  State<Meetup> createState() => _HomePageState();
}

class _HomePageState extends State<Meetup> {
  final images = [
    'assets/meetup1.jpg',
    'assets/meetup2.jpg',
    'assets/meetup3.jpg',
  ];
  int currentIndex = 0;
  Color color = Color.fromARGB(255, 3, 44, 76);
  Color color1 = Color.fromARGB(255, 2, 55, 96);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Individual Meetup',
          style: TextStyle(color: color),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: color,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: color),
                    suffixIcon: Icon(
                      Icons.mic_none_outlined,
                      color: color,
                    ),
                    prefixIcon: Icon(Iconsax.search_favorite, color: color),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: color),
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: AnimatedSmoothIndicator(
                activeIndex: currentIndex,
                count: images.length,
                effect: WormEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    dotColor: const Color.fromARGB(255, 209, 208, 208),
                    activeDotColor: Colors.blue),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Trending Popular People',
                style: TextStyle(
                    color: color1, fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TrendingPopularPeople(color: color, color1: color1),
                    SizedBox(width: 20,),
                    TrendingPopularPeople(color: color, color1: color1),
                    SizedBox(width: 20,),
                    TrendingPopularPeople(color: color, color1: color1),
                    SizedBox(width: 20,),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


