import 'package:flutter/material.dart';
import 'package:maan_academy_news/Model/News_model.dart';
import 'package:maan_academy_news/Screens/news_details.dart';
import 'package:nb_utils/nb_utils.dart';

import '../Repository/news_repo.dart';
import '../Widget/news_card_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maan News'),
      ),
      body: FutureBuilder<NewsModel>(
        future: NewsRepo().getNews(),
        builder: (_,snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data?.datas?.data?.length ?? 0,
                itemBuilder: (_,index){
                  return Column(
                    children: [
                      FeaturedNewsCard(images: snapshot.data?.datas?.data?[index].image?[0] ?? '', titles: snapshot.data?.datas?.data?[index].title ?? '').visible(index == 0),
                      NewsCard(titles: snapshot.data?.datas?.data?[index].title ?? '', images: snapshot.data?.datas?.data?[index].image?[0] ?? '').visible(index !=0),
                    ],
                  ).onTap(() => NewsDetails(newsId: snapshot.data!.datas!.data![index].id.toString(),).launch(context));
                });
          } else{
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}


