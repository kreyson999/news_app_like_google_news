import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_news/models/models.dart';
import 'package:google_news/services/open_news_service.dart';

class NewsWidget extends StatelessWidget {
  final NewsModel news;

  const NewsWidget({Key? key, required this.news}) : super(key: key);

  String countTime(String dateTime) {
    String finalDate = "Error";
    DateTime parsedDateTime = DateTime.parse(dateTime).toLocal();
    DateTime nowDateTime = DateTime.now().toLocal();

    finalDate = (nowDateTime.hour - parsedDateTime.hour).toString();

    return finalDate + "h";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        OpenNewsService.openLink(url: news.url!);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04),
        height: MediaQuery.of(context).size.width * 0.8,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: CachedNetworkImage(
                placeholder: (context, url) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    child: Center(child: Icon(Icons.error, size: MediaQuery.of(context).size.height * 0.1,),),
                  );
                },
                errorWidget: (context, url, error) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    child: Center(child: Icon(Icons.error, size: MediaQuery.of(context).size.height * 0.1,),),
                  );
                },
                imageUrl: news.urlToImage.toString(),
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: imageProvider,
                      ),
                      color: Colors.red,
                    ),
                  );
                },
              )
            ),
            SizedBox(
              height: 12,
            ),
            Expanded(
              flex: 3,
              child: news.title != null
                  ? Text(
                      news.description!,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                      ),
                    )
                  : Text(
                      "Unfortunately, there has been an error.",
                      overflow: TextOverflow.clip,
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                      ),
                    ),
            ),
            SizedBox(
              height: 12,
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.web),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                          "${news.source!.name} · ${countTime(news.publishedAt!)}"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                        ),
                        padding: EdgeInsets.only(),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.share),
                        padding: EdgeInsets.only(),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_vert),
                        padding: EdgeInsets.only(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
