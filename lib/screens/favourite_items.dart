
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:quoteapp/constants/get_data.dart';
import 'package:quoteapp/model/quote_model.dart';
import 'package:quoteapp/providers/favourite_items.dart';
import 'package:quoteapp/widgets/icons_widget.dart';
import '../providers/theme_provider.dart';

class FavouriteItemsScreen extends StatefulWidget {
  const FavouriteItemsScreen({super.key});

  @override
  State<FavouriteItemsScreen> createState() => _FavouriteItemsScreenState();
}

class _FavouriteItemsScreenState extends State<FavouriteItemsScreen> {

  final searchController = TextEditingController();
  String searchKeywords  = '';
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteProvider>(context);
    return Consumer<ThemeProvider>(
      builder: (context, themeValue, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            forceMaterialTransparency: true,
            title: _isSearching ? searchBar() : Text('Favourites'),
            actions: [
              IconButton(
                  icon: Icon(_isSearching ? Icons.close : Icons.search),
                  onPressed: () {
                    setState(() {
                      _isSearching = !_isSearching;
                    });
                  }
                  ),
              SizedBox(width: 15,)
            ],
          ),
          body: FutureBuilder(
            future: searchKeywords.isEmpty ? GetQuotes().getFavJson(provider.getFavList)
                : GetQuotes().getFilteredFavJson(provider.getFavList, searchKeywords),
            builder: (context,AsyncSnapshot<List<QuoteModel>> snapshot) {
              if(snapshot.hasData && snapshot.data!.isNotEmpty){
                  return Container(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final data = snapshot.data!;
                          return Container(
                              margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: (themeValue.quoteBackgroundColor.length == 1) || (themeValue.quoteBackgroundColor.length == 0) ? themeValue.quoteBackgroundColor[0] : themeValue.quoteBackgroundColor[index],
                                borderRadius: BorderRadius.circular(10),

                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    data[index].quote.toString(),
                                    style: TextStyle(fontSize: 16,color: themeValue.textColor),
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        data[index].author.toString(),
                                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: themeValue.textColor),
                                      ),
                                      IconsWidget(
                                        itemId: data[index].id!.toInt(),
                                        author:data[index].author.toString() ,
                                        quote: data[index].quote.toString(),
                                      ),
                                    ],
                                  )
                                ],
                              )
                          );
                      },
                    ),
                  );
              }else{
                return Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.assignment_outlined,
                          size: 100,
                          color: themeValue.textColor,
                        ),
                        Text(
                          'You have no favourite items yet',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              color: themeValue.textColor
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }

  Widget searchBar(){
    return TextFormField(
      decoration: InputDecoration(
          hintText: 'Search...',
          border: InputBorder.none
      ),
      onChanged: (value){
        setState(() {
          searchKeywords = value;
        });
      },
    );
  }
}
