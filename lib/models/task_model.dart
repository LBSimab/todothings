class Task {
  int? id;
  String? title;
  String? description;
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;
  int? steps;
  String? category;
  int? color;
  int? step;
  int? joinedUID;
Task({

 this.id,
  this.title,
  this.description,
  this.startDate,
  this.endDate,
  this.startTime,
  this.endTime,
  this.steps,
  this.category,
  this.color,
  this.step,
  this.joinedUID,

});
Task.fromJson(Map<String,dynamic> json) {
  id=json['ID'];
  title=json['title'];
  description=json['description'];
  endDate=json['deadLine'];
  startTime=json['startTime'];
  startDate=json['startDate'];
  endTime=json['endTime'];
  steps=json['steps'];
  category=json['category'];
  color=json['color'];
  step=json['step'];
  joinedUID=json['JoinedUID'];

}
  Map<String, dynamic> toJson() {
    final Map<String , dynamic> data = new Map<String , dynamic>();
    data['id']=this.id;
    data['title']=this.title;
    data['description']=this.description;
    data['color']=this.color;
    data['endDate']=this.endDate;
    data['startDate']=this.startDate;
    data['startTime']=this.startTime;
    data['endTime']=this.endTime;
    data['category']=this.category;
    data['steps']=this.steps;
    data['step']=this.step;
    data['JoinedUID']=this.joinedUID;


    return data;
  }
}

