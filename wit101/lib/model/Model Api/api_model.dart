import 'package:flutter/widgets.dart';
import 'package:wit101/model/model%20Class/addproject_model.dart';
import 'package:wit101/view/screens/addproject.dart';

class provider extends ChangeNotifier {

  //add to Cart
List<addProject> addproject=[];
List<addProject> newaddproject=[];
late addProject Addproject;
void tambahproject({
  required String projectname,
  required int dealprice,
  required String duration,
  required int worker,
  }){
    Addproject = addProject(
      projectname: projectname, 
      dealprice: dealprice, 
      duration: duration, 
      worker: worker,);
  newaddproject.add(Addproject);
  addproject = newaddproject;
}
}