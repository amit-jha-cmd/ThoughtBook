import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class PageIntro extends StatefulWidget {
  @override
  _PageIntroState createState() => _PageIntroState();
}

class _PageIntroState extends State<PageIntro> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "Enter your journal entries",
        styleTitle: TextStyle(color: Colors.grey),
        backgroundColor: Color(0xffffff),
      ),
    );
    slides.add(
      new Slide(
        title: "We store it on twitter as tweet thread",
        styleTitle: TextStyle(color: Colors.grey),
        backgroundColor: Color(0xffffff),
      ),
    );
    slides.add(
      new Slide(
        title: "Tap to Share",
        styleTitle: TextStyle(color: Colors.grey),
        backgroundColor: Color(0xffffff),
      ),
    );
  }

  void onDonePress() {
// Do what you want
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      colorPrevBtn: Colors.black,
      colorActiveDot: Colors.black,
      colorDoneBtn: Colors.black,
      colorDot: Colors.grey,
      colorSkipBtn: Colors.black,
      slides: this.slides,
      onDonePress: this.onDonePress,
    );
  }
}
