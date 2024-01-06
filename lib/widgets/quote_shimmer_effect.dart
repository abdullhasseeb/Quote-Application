import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quoteapp/providers/theme_provider.dart';
import 'package:shimmer/shimmer.dart';

class QuoteShimmerEffect extends StatelessWidget {
  const QuoteShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) {
        return Stack(
          children: [
            Center(
              child: Opacity(
                opacity: 0.02,
                child: Container(
                  margin: EdgeInsets.all(5),
                  width: double.infinity,
                  padding: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                      color: Colors.black,
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
            Shimmer.fromColors(
              baseColor: Colors.grey.shade400,
              highlightColor: Colors.grey.shade200,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(
                      flex: 2,
                    ),
                    //quote image
                    Image.asset(
                      'assets/images/quote.png',
                      height: 30,
                      width: 30,
                      color: Colors.white,
                    ),
                    SizedBox(height: 30,),
                    // quote String
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 100,
                    ),
                    SizedBox(height: 30,),
                    // author string
                    Container(
                      color: Colors.white,
                      width: 100,
                      height: 15,
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          padding: EdgeInsets.all(25),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1,color: Colors.white),
                              color: Colors.white
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          padding: EdgeInsets.all(25),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1,color: Colors.white),
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                    Spacer()
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
