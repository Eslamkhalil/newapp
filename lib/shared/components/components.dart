import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';

Widget buildItemList(article) => ConditionalBuilder(
      condition: article.length > 0,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              child: Image.network('${article['urlToImage']}'),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
                child: Container(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    '${article['title']}',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.1,
                    ),
                  )),
                  Text('${article['publishedAt']}',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.1,
                          color: Colors.grey)),
                ],
              ),
            )),
          ],
        ),
      ),
      fallback: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );

Widget myDivider() => Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    );
