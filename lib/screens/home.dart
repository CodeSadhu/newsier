import 'package:carded/carded.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/providers/news_provider.dart';
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
          // backgroundColor: ColorPalette.primary,
          toolbarHeight: 80,
          title: Text(
            'Newsier',
            style: Styles.extraLarge(),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 20,
            ),
            child: Text(
              'Latest news',
              style: Styles.bodyLarge(),
            ),
          ),
          Consumer<NewsProvider>(
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
                  return SizedBox(
                    height: size.height * 0.7,
                    child: SwipeableCardsSection(
                      // cardWidthBottomMul: 0,
                      // cardWidthMiddleMul: 0,
                      // cardWidthTopMul: 0,
                      cardController: _cardSectionController,
                      context: context,
                      enableSwipeDown: false,
                      enableSwipeUp: false,
                      onCardSwiped: (dir, index, widget) {
                        //Add the next card using _cardController
                        _cardSectionController.addItem(
                          NewsCard(
                            size: size,
                            article: news.articles![index],
                          ),
                        );
                      },
                      items: List.generate(
                        news.articles!.length,
                        (index) => NewsCard(
                          size: size,
                          article: news.articles![index],
                        ),
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
            },
          ),
        ],
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.article,
    required this.size,
  });

  final Article article;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return CardyContainer(
      constraints: BoxConstraints(
        maxWidth: size.width * 0.5,
        // maxHeight: size.height * 0.25,
      ),
      borderRadius: BorderRadius.circular(15),
      color: ColorPalette.cardColor,
      shadowColor: Colors.white.withOpacity(0.2),
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: ColorPalette.accentRed,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 20,
            ),
            child: Text(
              article.source!.name!,
              style: Styles.bodyMedium(),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 20,
            ),
            child: Text(
              Normie.formatDate(
                date: article.publishedAt!,
                inputFormat: 'yyyy-MM-dd',
                outputFormat: 'dd-MM-yyyy',
              ),
              style: Styles.bodySmall(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            article.title!.length > 70
                ? '${article.title!.substring(0, 70)}...'
                : article.title!,
            style: Styles.appbar(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (article.content != null)
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: size.height * 0.2,
                  ),
                  child: Text(
                    article.content!.length > 200
                        ? article.content!.substring(0, 200)
                        : article.content!,
                    style: Styles.bodyMedium(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
