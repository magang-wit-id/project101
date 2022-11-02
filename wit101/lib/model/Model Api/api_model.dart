import 'package:flutter/widgets.dart';
import 'package:wit101/model/model%20Class/addproject_model.dart';

class ProciderProject extends ChangeNotifier {

  //add to Cart
List<Projectadd> addproject=[];
List<Projectadd> newaddproject=[];
late Projectadd addProject;
void tambahproject({
  required String projectname,
  required int dealprice,
  required String duration,
  required int worker,
  }){
    addProject = Projectadd(
      projectname: projectname, 
      dealprice: dealprice, 
      duration: duration, 
      worker: worker,);
  newaddproject.add(addProject);
  addproject = newaddproject;
}
}