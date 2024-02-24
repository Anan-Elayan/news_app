import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../../data/model/news_model.dart';

class CardNews extends StatelessWidget {

  final NewsModel news;
  final Function() onTapNews;

  const CardNews({
    super.key,
    required this.news,
    required this.onTapNews,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: InkWell(
        onTap: onTapNews,
        child: Card(
          child: SizedBox(
            height: 160,
            child: Row(
              children: [
                Expanded(
                  child: news.urlToImage == null
                      ? const Center(
                          child: Text(
                            'No Image',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            news.urlToImage!,
                            loadingBuilder: (context, child, loadingProgress) {
                              return loadingProgress == null
                                  ? child
                                  : Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.red,
                                      ),
                                    );
                            },
                            errorBuilder: (context, error, stackTree) {
                              return const Center(
                                child: Text(
                                  'Image error',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        news.title,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        news.description ?? '',
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            'Created At : ',
                          ),
                          Text(
                            news.publishedAt.split('T').first,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
