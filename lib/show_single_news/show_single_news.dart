import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/show_single_news/widget/row_text.dart';

class ShowSingleNews extends StatelessWidget {
  const ShowSingleNews({super.key, required this.newsModel});

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Review'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: newsModel.urlToImage == null
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
                          newsModel.urlToImage!,
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
                  children: [
                    RowText(value: newsModel.author??'', title: 'Author : '),
                    RowText(value: newsModel.publishedAt??'', title: 'Date : '),
                    RowText(value: newsModel.title, title: 'Title : '),
                    RowText(value: newsModel.description??'', title: 'Description : '),
                    RowText(value: newsModel.content??'', title: 'Content : '),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
