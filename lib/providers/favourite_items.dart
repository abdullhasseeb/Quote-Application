import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class FavouriteProvider with ChangeNotifier{
  List<int> _favList = [];
  bool favIcon = false; //true -> filled icon _____false -> unfilled icon
  static const String boxName = 'quote_box';
  static const String favListName = 'fav_list';

  List<int> get getFavList => _favList;

  setFavItem(int itemId) async{
    _favList =  await getFavFromHive();
    _favList.add(itemId);
    notifyListeners();
  }
  removeFavItem(int itemId) async{
    _favList = await getFavFromHive();
    _favList.remove(itemId);
    notifyListeners();
  }
  setFavToHive(int itemId) async{
    setFavItem(itemId);
    var box = await Hive.openBox(boxName);
    await box.put(favListName, getFavList);
    notifyListeners();
  }
  removeFavFromHive(int index) async{
    removeFavItem(index);
    var box = await Hive.openBox(boxName);
    await box.put(favListName, getFavList);
    notifyListeners();
  }
  Future<List<int>> getFavFromHive() async{
    var box = await Hive.openBox(boxName);
    _favList = await box.get(favListName) ?? [];
    return getFavList;
  }
  onClick(int itemId) async{
    await getFavFromHive();
    if(!_favList.contains(itemId)){
      await setFavToHive(itemId);
    }else{
      await removeFavItem(itemId);
    }
    print('list from provider after process: ' + getFavList.toString());
    notifyListeners();
  }
}