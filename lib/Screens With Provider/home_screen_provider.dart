import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maan_academy_news/Screens%20With%20Provider/news_details_with_provider.dart';
import 'package:nb_utils/nb_utils.dart';

import '../Model/News_model.dart';
import '../Provider/news_provider.dart';
import '../Repository/news_repo.dart';
import '../Screens/news_details.dart';
import '../Widget/news_card_widgets.dart';

class HomeScreenWithProvider extends StatefulWidget {
  const HomeScreenWithProvider({Key? key}) : super(key: key);

  @override
  State<HomeScreenWithProvider> createState() => _HomeScreenWithProviderState();
}

class _HomeScreenWithProviderState extends State<HomeScreenWithProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maan News'),
      ),
      body: Consumer(builder: (_, ref, watch) {
        AsyncValue<NewsModel> latestNews = ref.watch(getLatestNewsProvider);
        return latestNews.when(data: (news) {
          return ListView.builder(
              itemCount: news.datas?.data?.length ?? 0,
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    FeaturedNewsCard(images: news.datas?.data?[index].image?[0] ?? '', titles:news.datas?.data?[index].title ?? '')
                        .visible(index == 0),
                    NewsCard(titles: news.datas?.data?[index].title ?? '', images: news.datas?.data?[index].image?[0] ?? '')
                        .visible(index != 0),
                  ],
                ).onTap(() => NewsDetailsWithProvider(
                      newsId: news.datas!.data![index].id.toString(),
                    ).launch(context));
              });
        }, error: (e, stack) {
          return Center(
            child: Text(e.toString()),
          );
        }, loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
      }),
    );
  }
}
