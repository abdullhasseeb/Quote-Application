import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:quoteapp/providers/theme_provider.dart';
import 'package:share_plus/share_plus.dart';


import '../providers/favourite_items.dart';
class IconsWidget extends StatelessWidget {
  int itemId;
  String quote;
  String author;
  IconsWidget({
    required this.quote,
    required this.itemId,
    required this.author
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeValue, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer<FavouriteProvider>(
              builder: (context, value, child) {
                // favouite icon=====================================
                return Container(
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 2,
                          color: themeValue.textColor
                      )
                  ),
                  child: IconButton(
                    highlightColor: themeValue.textColor.withOpacity(0.5),
                    onPressed: () async{
                      print('tap on fav button');
                      await value.onClick(itemId);
                    },
                    icon: Icon(value.getFavList.contains(itemId) ? Icons.favorite : Icons.favorite_border),
                    color: themeValue.textColor,
                  ),
                );
              },

            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      width: 2,
                      color: themeValue.textColor
                  )
              ),
              child: IconButton(
                highlightColor: themeValue.textColor.withOpacity(0.5),
                onPressed: () async{
                  print('tap on share button');
                  await Share.share('$quote \n\n $author');
                },
                icon:Icon(Icons.share),
                color: themeValue.textColor,
              ),
            )
          ],
        );
      },
    );
  }
}
