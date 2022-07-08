class Task {
  int? id;
  String? title;
  String? description;
  int? color;
  String? deadLine;
  String? startDate;
  String? category;
  String? startTime;
  String? endTime;
  int? steps;
Task({

 this.id,
  this.title,
  this.description,
  this.color,
  this.startDate,
  this.deadLine,
  this.startTime,
  this.endTime,
  this.category,
  this.steps,

});
Task.fromJson(Map<String,dynamic> Json) {
  id=Json['id'];
  title=Json['title'];
  description=Json['description'];
  color=Json['color'];
  deadLine=Json['deadLine'];
  startDate=Json['startDate'];
  startTime=Json['startTime'];
  endTime=Json['endTime'];
  category=Json['category'];
  steps=Json['steps'];


}

Map<String, dynamic> toJson() {
  final Map<String , dynamic> data = new Map<String , dynamic>();
  data['id']=this.id;
  data['title']=this.title;
  data['description']=this.description;
  data['color']=this.color;
  data['deadLine']=this.deadLine;
  data['startDate']=this.startDate;
  data['startTime']=this.startTime;
  data['endTime']=this.endTime;
  data['category']=this.category;
  data['steps']=this.steps;

  return data;
}
}