import 'package:flutter/material.dart';

import '../Widget/news_card_widgets.dart';
import 'home_screen.dart';

class NewsDetails extends StatefulWidget {
  const NewsDetails({Key? key,required this.imageUrl, required this.titleText}) : super(key: key);

  final String imageUrl;
  final String titleText;


  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {

  String description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Massa tincidunt nunc pulvinar sapien et ligula. Adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque. Dictum at tempor commodo ullamcorper a. Arcu non sodales neque sodales ut etiam sit. Pharetra convallis posuere morbi leo urna molestie at. Habitasse platea dictumst quisque sagittis purus sit. Bibendum arcu vitae elementum curabitur vitae. Pretium viverra suspendisse potenti nullam ac. Dolor magna eget est lorem ipsum. Ac odio tempor orci dapibus ultrices in iaculis nunc sed. Viverra ipsum nunc aliquet bibendum. Malesuada proin libero nunc consequat interdum varius.";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            FeaturedNewsCard(
                images: widget.imageUrl,
                titles: widget.titleText),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(description,style: TextStyle(color: Colors.black,fontSize: 16.0),),
            )
          ],
        ),
      ),
    );
  }
}
