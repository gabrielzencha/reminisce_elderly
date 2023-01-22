import 'package:Reminisce/widgets/MemoriesData.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


final List<Map<String, List<String>>>  contents = CarouselData.contents;
class MemoriesView extends StatefulWidget {
  final int currentSliderIndex;
  const MemoriesView({Key? key, this.currentSliderIndex = 0}) : super(key: key);

  @override
  State<MemoriesView> createState() => _HomeViewState();
}

class _HomeViewState extends State<MemoriesView> {
  CarouselController buttonCarouselController = CarouselController();

  final List<Widget> imageSliders = contents
      .map((item) => Container(
    child: Container(
      margin: EdgeInsets.all(5.0),
      child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 10),
            children: <Widget>[

              Text(
                item.keys.toList()[0].toString() ,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold,  fontSize: 35),
              ),
        SizedBox.fromSize(
          size: Size.fromRadius(100),
          child: Image.asset(item[item.keys.toList()[0].toString()]![0].toString()),
        ),




            ],
          )
    ),
  ))
      .toList();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text(
            "Memories",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 27),
          ),
        ),
        body: Container(
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: false,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: imageSliders,
          ),
        ),);
  }
}



