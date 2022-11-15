import 'package:flutter/material.dart';
import 'package:maan_academy_news/Screens/news_details.dart';
import 'package:nb_utils/nb_utils.dart';

import '../Widget/news_card_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String> titles = [
    'Taina Blue Retreat is a Converted Tower on the Greek Coast',
    'Entertainment partners chill at home with a few must-see movies or head out for',
    'Official press statement an historic moment time and a new journey to begin'
  ];

  List<String> images = [
    'http://maannews.maantechnology.com/public/uploads/images/newsimages/maannewsimage30012022_034246_politics_2.jpg',
    'http://maannews.maantechnology.com/public/uploads/images/newsimages/maannewsimage30012022_034317_politics_3.jpg',
    'http://maannews.maantechnology.com/public/uploads/images/newsimages/maannewsimage23102021_072605_amazon.jpg'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maan News'),
      ),
      body: ListView.builder(
        itemCount: 50,
          itemBuilder: (_,index){
        return Column(
          children: [
            FeaturedNewsCard(images: images[index % 3], titles: titles[index % 3]).visible(index == 0),
            NewsCard(titles: titles[index % 3], images: images[index % 3]).visible(index !=0),
          ],
        ).onTap(() => NewsDetails(imageUrl: images[index % 3], titleText: titles[index % 3],).launch(context));
      }),
    );
  }
}


