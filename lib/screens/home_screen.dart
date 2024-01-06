import 'dart:async';
import 'dart:convert';
import 'dart:developer';


import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:quoteapp/providers/favourite_items.dart';
import 'package:quoteapp/providers/icons_provider.dart';
import 'package:quoteapp/providers/theme_provider.dart';
import 'package:quoteapp/screens/favourite_items.dart';
import 'package:quoteapp/screens/login_screen.dart';
import 'package:quoteapp/screens/user_screen.dart';
import 'package:quoteapp/widgets/bottom_navigation.dart';
import 'package:quoteapp/widgets/quote_shimmer_effect.dart';
import 'package:quoteapp/widgets/quote_widget.dart';
import 'package:http/http.dart' as http;
import 'package:random_color/random_color.dart';
import '../constants/get_data.dart';
import '../model/quote_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    print('build home screen');

    return Consumer<ThemeProvider>(
      builder: (context, themeValue, child) {
        return Scaffold(
            body: Stack(
              children: [
                Center(
                  child: Opacity(
                    opacity: 0.04,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: double.infinity,
                      padding: EdgeInsets.all(50),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          )
                      ),
                      child: Image.asset(
                        'assets/images/quote.png',
                        height: double.infinity,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                FutureBuilder(
                  future: GetQuotes().getJson(),
                  builder: (context, AsyncSnapshot<List<QuoteModel>> snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(
                        child: QuoteShimmerEffect(),
                      );
                    }else if(snapshot.hasError){
                      return Center(child: Text('Error: ${snapshot.error.toString()}'),);
                    }else if(snapshot.hasData && snapshot.data!.isNotEmpty){
                      var data = snapshot.data!;
                      return PageView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return QuoteWidget(
                            quote: data[index].quote.toString(),
                            author: data[index].author.toString(),
                            // pass this color from home because it changes the colors based on index
                            bgColor: (themeValue.quoteBackgroundColor.length == 1) ? themeValue.quoteBackgroundColor[0] : themeValue.quoteBackgroundColor[index],
                            itemId: data[index].id!.toInt(),
                          );
                        },
                      );
                    }else{
                      return Center(child: Text('No Quotes',style: TextStyle(color: Colors.white)),);
                    }
                  },
                ),
                Align(
                    child: BottomNavigation(),
                  alignment: Alignment.bottomCenter,
                ),
                userButton(themeValue)
              ],
            ),
        );
      },
    );
  }

  Consumer<IconsProvider> userButton(ThemeProvider themeValue) {
    return Consumer<IconsProvider>(
               builder: (context, value, child) {
                 return Align(
                   alignment: Alignment.topRight,
                   child: InkWell(
                     borderRadius: BorderRadius.circular(20),
                     highlightColor: Colors.transparent,
                     splashColor: Colors.transparent,
                     onTap: () {
                       final screenHeight = MediaQuery.of(context).size.height;
                       value.setUserIconSize(screenHeight * .03);
                       Future.delayed(Duration(milliseconds: 100), () {
                           value.setUserIconSize(screenHeight * .04);
                           Navigator.push(context, PageTransition(child: LoginScreen(), type: PageTransitionType.bottomToTop));
                         },
                       );
                     },
                     child: Consumer<FavouriteProvider>(
                       builder: (context, favValue, child) {
                         return Container(
                           margin: EdgeInsets.only(top: AppBar().preferredSize.height - 10,right: 10),
                           height: MediaQuery.of(context).size.height * .08,
                           width: MediaQuery.of(context).size.height * .08,
                           decoration: BoxDecoration(
                             color: themeValue.iconBGColor,
                             borderRadius: BorderRadius.circular(20),
                           ),
                           child: Icon(
                             LineIcons.user,
                             color: themeValue.iconColor,
                             size: value.getUserIconSize,
                           ),
                         );
                       },
                     ),
                   ),
                 );
               },
              );
  }
}