
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quoteapp/providers/theme_provider.dart';
import 'package:quoteapp/widgets/icons_widget.dart';

class QuoteWidget extends StatelessWidget {
  String quote;
  String author;
  Color bgColor;
  int itemId;

  QuoteWidget({
    required this.quote,
    required this.author,
    required this.bgColor,
    required this.itemId
  });

  @override
  Widget build(BuildContext context) {
    print('build quote widget');
    return Consumer<ThemeProvider>(
      builder: (context, value, child) {
        return Container(
          color: bgColor,
          child: Stack(
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
                          color:value.quoteImageColor,
                          width: 1,
                        )
                    ),
                    child: Image.asset(
                      'assets/images/quote.png',
                      height: double.infinity,
                      width: double.infinity,
                      color: value.quoteImageColor,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(
                      flex: 3,
                    ),
                    Image.asset(
                      'assets/images/quote.png',
                      height: 30,
                      width: 30,
                      color: value.textColor,
                    ),
                    SizedBox(height: 30,),
                    Text(
                      quote,
                      style: TextStyle(
                          color: value.textColor,
                          fontSize: 20
                      ),
                    ),
                    SizedBox(height: 30,),
                    Text(
                      author,
                      style: TextStyle(
                          color: value.textColor,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Spacer(),
                    Center(child: IconsWidget(
                      itemId: itemId,
                      quote: quote,
                      author: author,
                    )),
                    Spacer()
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
