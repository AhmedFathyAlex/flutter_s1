class TaskModel {
  int? id;
  String? title;
  String? desc;
  String? date;

  TaskModel({this.title ,
   this.date , 
   this.desc , 
   this.id});

  TaskModel.fromJson(Map map){
    id = map['id'];
    title = map['title'];
    desc = map['desc'];
    date = map['date'];
  }
  
}