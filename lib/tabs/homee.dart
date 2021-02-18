import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class homee extends StatefulWidget {
  @override
  _homeeState createState() => _homeeState();
}

class _homeeState extends State<homee> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: Colors.grey[100],
    // );
    return slide();
  }
}

Widget slide() {
  return Scaffold(
    body: Container(
      child: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                // height: 250.0,
                aspectRatio: 1,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayAnimationDuration: Duration(seconds: 4),
                initialPage: 0,
                reverse: false,
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true),
            items: [
              "https://lh3.googleusercontent.com/wIcl3tehFmOUpq-Jl3hlVbZVFrLHePRtIDWV5lZwBVDr7kEAgLTChyvXUclMVQDRHDEcDhY=w640-h400-e365-rj-sc0x00ffffff",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxsEyWArlGeWxh9C23fnY4D-RIMclp40fBhQ&usqp=CAU"
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 3.0),
                    // decoration: BoxDecoration(color: Colors.redAccent),
                    child: Image.network('$i'),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    ),
  );
}
