

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class NewProvider with ChangeNotifier{


  List<NewModel>  newModelList = [
    NewModel(
      title: 'New 2',
      isSelected: false
    ),
    NewModel(
        title: 'New 3',
        isSelected: false
    ),
    NewModel(
        title: 'New 4',
        isSelected: false
    ),
    NewModel(
        title: 'New 5',
        isSelected: false
    ),
  ];

void addItem(){
  print('adding');
  newModelList.add(NewModel(title: 'New Model', isSelected: false));
  // notifyListeners();
}



}



class NewModel with ChangeNotifier{
  String? title;
  bool? isSelected = false;

  NewModel({this.title,this.isSelected});

  void checkChanger(){
    isSelected = !isSelected!;
    notifyListeners();
  }

}