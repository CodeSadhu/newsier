import 'package:carded/carded.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/screens/web/news_details.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/utils/styles.dart';
import 'package:normie/normie.dart';
import 'package:provider/provider.dart';

class WebScreen extends StatefulWidget {
  const WebScreen({super.key});

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  late Size size;
  late NewsProvider _newsProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchNewsData();
  }

  void fetchNewsData() {
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
          centerTitle: true,
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
      body: Container(
        padding: const EdgeInsets.only(
          top: 30,
          left: 50,
          right: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Latest news',
                style: Styles.bodyLarge(),
              ),
            ),
            const SizedBox(
              height: 20,
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
                    return ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: size.height * 0.8,
                      ),
                      child: ListView.builder(
                        itemCount: news.articles!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsDetailsWeb(
                                  article: news.articles![index],
                                  size: size,
                                ),
                              ),
                            ),
                            child: NewsCard(
                              article: news.articles![index],
                              size: size,
                            ),
                          );
                        },
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
      margin: const EdgeInsets.only(bottom: 20),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Text(
                Normie.formatDate(
                  date: article.publishedAt!,
                  inputFormat: 'yyyy-MM-dd',
                  outputFormat: 'dd/MM/yyyy',
                ),
                style: Styles.bodySmall(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            article.title!,
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
