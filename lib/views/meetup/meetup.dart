import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:machinetask/controller/meetup_provider.dart';
import 'package:machinetask/views/desciption.dart';
import 'package:machinetask/views/meetup/widgets.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Meetup extends StatelessWidget {
  const Meetup({Key? key});

  @override
  Widget build(BuildContext context) {
    final images = ['assets/meetup1.jpg', 'assets/meetup2.jpg', 'assets/meetup3.jpg'];
    final imageList = ['assets/officeboy2.jpg', 'assets/officeboy4.jpg', 'assets/officeboy5.jpg'];

    Color color = const Color.fromARGB(255, 3, 44, 76);
    Color color1 = const Color.fromARGB(255, 2, 55, 96);

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
        child: Consumer<MeetupProvider>(
          builder: (context, pro, child) =>  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: color),
                    suffixIcon: Icon(Icons.mic_none_outlined, color: color),
                    prefixIcon: Icon(Iconsax.search_favorite, color: color),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: color),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              CarouselSlider.builder(
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
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
                    pro.updateIndex(index);
                  },
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: AnimatedSmoothIndicator(
                  activeIndex: pro.currentIndex,
                  count: images.length,
                  effect: const WormEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    dotColor: Color.fromARGB(255, 209, 208, 208),
                    activeDotColor: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'Trending Popular People',
                  style: TextStyle(color: color1, fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      TrendingPopularPeople(color: color, color1: color1),
                      const SizedBox(width: 20),
                      TrendingPopularPeople(color: color, color1: color1),
                      const SizedBox(width: 20),
                      TrendingPopularPeople(color: color, color1: color1),
                      const SizedBox(width: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'Top Trending Meetups',
                  style: TextStyle(color: color1, fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 170,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: ListView.builder(
                    itemCount: imageList.length,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      int displayIndex = index + 1;
                      return GestureDetector(
                        child: Row(
                          children: [
                            Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(1.2),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Container(
                                      width: 200,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(255, 229, 229, 230),
                                        borderRadius: BorderRadius.circular(19),
                                        image: DecorationImage(
                                          image: AssetImage(imageList[index]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15),
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: index > 8
                                            ? Text('$displayIndex',
                                                style: TextStyle(color: color, fontSize: 25, fontWeight: FontWeight.bold))
                                            : Text('0$displayIndex',
                                                style: TextStyle(color: color, fontSize: 25, fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DescriptionPage(
                              image: imageList[index],
                            ),
                          ));
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
