

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maan_academy_news/Repository/news_repo.dart';

final getLatestNewsProvider = FutureProvider((ref) => NewsRepo().getNews());

final getLatestNewsDetailsProvider = FutureProvider.family((ref,newsId) => NewsRepo().getNewsDetails(newsId.toString()));