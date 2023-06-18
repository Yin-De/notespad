

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ListProvider extends ChangeNotifier{

  List datas=[];
  final note=Hive.box('note');
  void items({ind})async{
    await Future.delayed(const Duration(milliseconds: 100), (){});

    final data=note.keys.map((ind){
      final item=note.get(ind);
      // return {"key":e,"title":item['title'],"textera":item['textera']};
      return item;
    }).toList();
    datas=data;
    print(datas);
    notifyListeners();

  }
}
