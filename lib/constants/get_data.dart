import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quoteapp/providers/favourite_items.dart';

import '../model/quote_model.dart';

class GetQuotes{

  Future<List<QuoteModel>> getJson() async{
    List<QuoteModel> quotesList = [];
    try{
      String data = await rootBundle.loadString('assets/quotes.json');
      final jsonData = jsonDecode(data);
      for(Map i in jsonData){
        quotesList.add(QuoteModel.fromJson(i));
      }
      return quotesList;
    } on PlatformException catch(e){
      ErrorWidget(e);
    }

    return quotesList;
  }

  Future<List<QuoteModel>> getFilteredJson(String keywords) async{
    List<QuoteModel> quotesList = [];
    try{
      String data = await rootBundle.loadString('assets/quotes.json');
      final jsonData = jsonDecode(data);
      for(Map i in jsonData){
        QuoteModel quote = QuoteModel.fromJson(i);
        if(quote.author!.toLowerCase().contains(keywords) || quote.quote!.toLowerCase().contains(keywords)){
          print(' searching ============${quote.author!.toString()} == $keywords');
          quotesList.add(quote);
        }
      }
      return quotesList;
    }on PlatformException catch(e){
      ErrorWidget(e);
    }
    return quotesList;
  }

  Future<List<QuoteModel>> getFavJson(List list) async{
    List<QuoteModel> quotesList = [];
    try{
      String data = await rootBundle.loadString('assets/quotes.json');
      final jsonData = jsonDecode(data);
      for(Map i in jsonData){
        QuoteModel quote = QuoteModel.fromJson(i);
        if(list.contains(quote.id)){
          quotesList.add(quote);
        }
      }
      return quotesList;
    }on PlatformException catch(e){
      ErrorWidget(e);
    }
    return quotesList;
  }

  Future<List<QuoteModel>> getFilteredFavJson(List list, String keywords) async{
    List<QuoteModel> quotesList = [];
    try{
      String data = await rootBundle.loadString('assets/quotes.json');
      final jsonData = jsonDecode(data);
      for(Map i in jsonData){
        QuoteModel quote = QuoteModel.fromJson(i);
        if(list.contains(quote.id) && (quote.author!.toLowerCase().contains(keywords) || quote.quote!.toLowerCase().contains(keywords))){
          quotesList.add(quote);
        }
      }
      return quotesList;
    }on PlatformException catch(e){
      ErrorWidget(e);
    }
    return quotesList;
  }
}