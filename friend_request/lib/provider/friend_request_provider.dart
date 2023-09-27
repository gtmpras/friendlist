import 'package:flutter/foundation.dart';

class FriendRequestProvider with ChangeNotifier{

   List<String> _name=[];

   List<String> get Name => _name;

   void addItem(String value){
    _name.add(value);
    notifyListeners();
   }

   void removeItem(String value){
    _name.remove(value);
    notifyListeners();
   }
}