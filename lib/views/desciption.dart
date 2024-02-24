import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:share_plus/share_plus.dart';

class DescriptionPage extends StatefulWidget {
  dynamic image;
  DescriptionPage({super.key, required this.image});

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  @override
  Widget build(BuildContext context) {
    Color color = Color.fromARGB(255, 3, 44, 76);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Description',
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
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 340,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 228, 228, 227),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 280,
                      width: 400,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(widget.image))),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.file_download_outlined,
                            size: 30,
                            color: Colors.grey,
                          ),
                          Icon(
                            Icons.bookmark_border_outlined,
                            size: 30,
                            color: Colors.grey,
                          ),
                          Icon(
                            Icons.favorite_border,
                            size: 30,
                            color: Colors.grey,
                          ),
                          Icon(
                            Icons.panorama_wide_angle_sharp,
                            size: 30,
                          ),
                          Icon(
                            Icons.star_border,
                            size: 30,
                          ),
                          InkWell(
                            onTap: () async {
                              try {
                                await Share.share(
                                  'Share this to ${widget.image}');
                              } catch (e) {
                                print('cantShare$e');
                              }
                            },
                            child: Icon(
                              Icons.share_outlined,
                              size: 30,
                            ),
                          ),
                          
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.bookmark_border_outlined,
                    color: color,
                  ),
                  Text('1034'),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(Icons.favorite_border, color: color),
                  Text('1034'),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 219, 219, 219),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: RatingBarIndicator(
                        itemBuilder: (context, index) {
                          return const Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 63, 219, 247),
                          );
                        },
                        itemCount: 5,
                        itemSize: 16,
                        rating: 7 / 2,
                        unratedColor: Color.fromARGB(255, 153, 152, 152),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '3.2',
                    style: TextStyle(color: color),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Actor name',
                style: TextStyle(
                    color: color, fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Text(
                'Indian Actress',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.timer_outlined,
                    size: 20,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Duration 20 mins',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.account_balance_wallet_outlined,
                    size: 20,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Total Average Price ₹9,999',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'About',
                style: TextStyle(
                    color: color, fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    'See more',
                    style: TextStyle(
                        color: Color.fromARGB(255, 18, 67, 202),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
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
