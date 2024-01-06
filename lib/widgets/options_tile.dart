import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quoteapp/providers/theme_provider.dart';

class OptionsTile extends StatelessWidget {
  double topRadius;
  double bottomRadius;
  final icon;
  String title;
  VoidCallback onTap;
  ImageProvider? image;
  
  OptionsTile({
    super.key,
    this.topRadius = 0,
    this.bottomRadius = 0,
    this.icon,
    required this.title,
    required this.onTap,
    this.image
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeValue, child) {
        return InkWell(
          highlightColor: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(bottom: 2),
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            decoration: BoxDecoration(
                color: themeValue.iconBGColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(topRadius),
                    topRight: Radius.circular(topRadius),
                    bottomLeft: Radius.circular(bottomRadius),
                    bottomRight: Radius.circular(bottomRadius)
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      (image == null) ?
                      Icon(
                        icon,
                        size: 30,
                        color: themeValue.iconColor,
                      )
                          :
                      Image(
                        image: image!,
                        height: 30,
                        width: 30,
                        color: themeValue.iconColor,
                      ),
                      SizedBox(width: 10,),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          color: themeValue.iconColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: themeValue.iconColor,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
