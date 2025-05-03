class TaskModel {
  int? id;
  String? title;
  String? desc;
  String? date;
  TaskStatus? status;

  TaskModel({this.title ,
   this.date , 
   this.desc , 
   this.id, 
   this.status = TaskStatus.todo});

  TaskModel.fromJson(Map map){
    id = map['id'];
    title = map['title'];
    desc = map['desc'];
    date = map['date'];
    status = statusFromString(map['status']);
  }
  
}
enum TaskStatus{
  todo,
  done,
  archived
}
TaskStatus statusFromString(String statusName){
  switch(statusName){
    case 'todo' : return TaskStatus.todo; 
    case 'done' : return TaskStatus.done;
    case 'archived' : return TaskStatus.archived;
    default: return TaskStatus.todo; 
  }
}