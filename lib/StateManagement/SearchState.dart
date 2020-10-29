import 'package:flutter/foundation.dart';
import 'package:fluttersigmaapp/Models/Model.dart';

class SearchState with ChangeNotifier{
 List<Model> _models ;
 List<Model> get models => _models;


 List<Model> mainDataList;




 set models(List<Model> models)
  {
    notifyListeners();
    _models=models;
  }
 void setmodelsWithoutNotifiying(List<Model> models)
 {
   if(_models==null) {
     _models = models;
     mainDataList = List.from(_models);
   }
 }

 void search(String value){
   _models.clear();
   for(Model model in mainDataList){
     if(model.displayName.toLowerCase().contains(value.toLowerCase()))
       _models.add(model);
   }

   notifyListeners();
 }


}