import 'package:carded/carded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/utils/assets.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/utils/styles.dart';
import 'package:normie/normie.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Size size;
  late NewsProvider _newsProvider;
  SwipeableCardSectionController _cardSectionController =
      SwipeableCardSectionController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _newsProvider = Provider.of<NewsProvider>(context, listen: false);
    _newsProvider.fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    size = Constants.getSize(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          backgroundColor: ColorPalette.primary.withOpacity(0.8),
          toolbarHeight: 80,
          title: Text(
            'Newsier',
            style: Styles.extraLarge(),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => _newsProvider.fetchNews(),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 30,
          ),
          child: Consumer<NewsProvider>(
            builder: (context, value, child) {
              News? news = value.news;
              bool isFetching = value.isFetching;

              if (isFetching) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: ColorPalette.primary,
                  ),
                );
              } else {
                if (news != null && news.articles != null) {
                  return SwipeableCardsSection(
                    cardController: _cardSectionController,
                    context: context,
                    enableSwipeDown: false,
                    enableSwipeUp: false,
                    onCardSwiped: (dir, index, widget) {
                      //Add the next card using _cardController
                      _cardSectionController.addItem(
                        NewsCard(
                          article: news.articles![index],
                        ),
                      );
                    },
                    items: List.generate(
                      news.articles!.length,
                      (index) => NewsCard(
                        article: news.articles![index],
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      'Nothing here yet, try refreshing after some time',
                      style: Styles.bodyMedium(),
                    ),
                  );
                }
              }
              // return ListView.builder(
              //   itemCount: news!.articles!.length,
              //   itemBuilder: (context, index) {
              //     return NewsCard(
              //       article: news.articles![index],
              //     );
              //   },
              // );
            },
          ),
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return CardyContainer(
      borderRadius: BorderRadius.circular(15),
      color: ColorPalette.primary,
      shadowColor: Colors.white.withOpacity(0.2),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: Text(
        article.title!,
        style: Styles.bodyMedium(),
      ),
    );
  }
}
