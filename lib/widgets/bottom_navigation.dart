import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:quoteapp/providers/favourite_items.dart';
import 'package:quoteapp/providers/icons_provider.dart';
import 'package:quoteapp/providers/theme_provider.dart';
import 'package:quoteapp/screens/favourite_items.dart';
import 'package:quoteapp/screens/settings_screen.dart';
import 'package:quoteapp/screens/theme_selecting_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    print('bottom navigation build');
    return Container(
      margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
      child: Consumer<IconsProvider>(builder: (context, value, child) {
        return Consumer<ThemeProvider>(
          builder: (context, themeValue, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Favourite Icon-------------------------------------
                favButton(value, context, themeValue, screenHeight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // Theme Icon-------------------------------------------
                    home_button(value, context, screenHeight, themeValue),
                    SizedBox(
                      width: 10,
                    ),
                    //settings Icon ---------------------------------------
                    settingsButton(value, context, screenHeight, themeValue)
                  ],
                ),
              ],
            );
          },
        );
      }),
    );
  }

  InkWell settingsButton(IconsProvider value, BuildContext context, double screenHeight, ThemeProvider themeValue) {
    return InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () async {
                      value.setSettingsIconSize(screenHeight * .03);
                      Future.delayed(
                        Duration(milliseconds: 100),
                            () {
                          value.setSettingsIconSize(screenHeight * .04);
                          Navigator.push(context, PageTransition(child: SettingsScreen(), type: PageTransitionType.bottomToTop));
                        },
                      );
                    },
                    child: Container(
                      height: screenHeight * .08,
                      width: screenHeight * .08,
                      decoration: BoxDecoration(
                          color: themeValue.iconBGColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(
                        Icons.settings,
                        color: themeValue.iconColor,
                        size: value.getSettingsIconSize,
                      ),
                    ),
                  );
  }
  InkWell home_button(IconsProvider value, BuildContext context, double screenHeight, ThemeProvider themeValue) {
    return InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () async {
                      value.setThemeIconSize(screenHeight * .03);
                      Future.delayed(
                        Duration(milliseconds: 100),
                            () {
                          value.setThemeIconSize(screenHeight * .04);
                          Navigator.push(context, PageTransition(child: ThemeSelectScreen(), type: PageTransitionType.bottomToTop));
                        },
                      );
                    },
                    child: Container(
                      height: screenHeight * .08,
                      width: screenHeight * .08,
                      decoration: BoxDecoration(
                          color: themeValue.iconBGColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(
                        Icons.color_lens,
                        color: themeValue.iconColor,
                        size: value.getThemeIconSize,
                      ),
                    ),
                  );
  }
  InkWell favButton(IconsProvider value, BuildContext context, ThemeProvider themeValue, double screenHeight) {
    return InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  value.setFavIconSize(screenHeight * .03);
                  Future.delayed(
                    Duration(milliseconds: 100),
                        () {
                      value.setFavIconSize(screenHeight * .04);
                      Navigator.push(context, PageTransition(child: FavouriteItemsScreen(), type: PageTransitionType.bottomToTop));
                    },
                  );
                },
                child: Consumer<FavouriteProvider>(
                  builder: (context, val, child) {
                    return Badge(
                      backgroundColor: themeValue.badgeBGColor,
                      label: Text(
                        val.getFavList.length.toString(),
                        style: TextStyle(
                            color: themeValue.badgeTextColor,
                            fontSize: screenHeight * .02
                        ),),
                      child: Container(
                        height: screenHeight * .08,
                        width: screenHeight * .08,
                        decoration: BoxDecoration(
                          color: themeValue.iconBGColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: themeValue.iconColor,
                          size: value.getFavIconSize,
                        ),
                      ),
                    );
                  },
                ),
              );
  }

}
