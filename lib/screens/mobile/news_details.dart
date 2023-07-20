import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/utils/styles.dart';
import 'package:normie/normie.dart';

class NewsDetailsMobile extends StatelessWidget {
  const NewsDetailsMobile(
      {super.key, required this.article, required this.size});

  final Article article;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 24,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (article.title != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorPalette.cardColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (article.source != null &&
                            article.source!.name != null)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 15,
                            ),
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: ColorPalette.accentRed,
                            ),
                            child: Text(
                              article.source!.name!,
                              style: Styles.bodySmall(),
                            ),
                          ),
                        Text(
                          article.title!,
                          style: Styles.appbar(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (article.publishedAt != null)
                          Builder(
                            builder: (context) {
                              String date = Normie.formatDate(
                                date: article.publishedAt!,
                                inputFormat: 'yyyy-MM-dd',
                                outputFormat: 'dd/MM/yyyy',
                              );
                              return Text(
                                'Published on: $date',
                                style: Styles.bodySmall(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              );
                            },
                          ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (article.author != null)
                          Text(
                            'By ${article.author}',
                            style: Styles.bodyLarge(
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                      ],
                    ),
                  ),
                if (article.content != null)
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        article.content!,
                        style: Styles.bodyMedium(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
