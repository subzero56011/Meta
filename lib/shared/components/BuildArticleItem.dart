import 'package:flutter/material.dart';

class BuildArticleItem extends StatelessWidget {
  dynamic article;

  BuildArticleItem({
    this.article,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // navigateTo(
        //   context,
        //   WebViewScreen(
        //     url: article['url'],
        //   ),
        // );
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(
                    // 'https://cf4.s3.souqcdn.com/item/2018/08/16/37/16/57/84/item_XXL_37165784_144964476.jpg'
                    '${article['urlToImage']}',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
              child: null,
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        // 'fff',
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      // 'fff',

                      '${article['publishedAt']}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
