import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maan_academy_news/Model/News_details_model.dart';
import 'package:maan_academy_news/Repository/news_repo.dart';

import '../Widget/news_card_widgets.dart';
import 'home_screen.dart';

class NewsDetails extends StatefulWidget {
  const NewsDetails({Key? key,required this.newsId}) : super(key: key);

  final String newsId;


  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {

  String description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Massa tincidunt nunc pulvinar sapien et ligula. Adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus urna neque. Dictum at tempor commodo ullamcorper a. Arcu non sodales neque sodales ut etiam sit. Pharetra convallis posuere morbi leo urna molestie at. Habitasse platea dictumst quisque sagittis purus sit. Bibendum arcu vitae elementum curabitur vitae. Pretium viverra suspendisse potenti nullam ac. Dolor magna eget est lorem ipsum. Ac odio tempor orci dapibus ultrices in iaculis nunc sed. Viverra ipsum nunc aliquet bibendum. Malesuada proin libero nunc consequat interdum varius.";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: FutureBuilder<NewsDetailsModel>(
          future: NewsRepo().getNewsDetails(widget.newsId),
          builder: (_,snapshot){
            if(snapshot.hasData){
              return SingleChildScrollView(
                child: Column(
                  children: [

                    FeaturedNewsCard(
                        images: snapshot.data?.data?.image?[0].toString() ?? '',
                        titles: snapshot.data?.data?.title ?? ''),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(color: Colors.red),
                            child: Text(snapshot.data?.data?.newsCategory ?? '',style: TextStyle(color: Colors.white),),
                          ),
                          Spacer(),
                          Text(snapshot.data?.data?.reporterName ?? '',style: TextStyle(color: Colors.black),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(Bidi.stripHtmlIfNeeded(snapshot.data?.data?.description ?? ''),style: TextStyle(color: Colors.black,fontSize: 16.0),),
                    )
                  ],
                ),
              );
            } else{
              return const Center(child: CircularProgressIndicator(),);
            }
          },
        ),
      ),
    );
  }
}
