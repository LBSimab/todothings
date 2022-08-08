class Task {
  int? id;
  String? title;
  String? description;
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;
  int? done;
  String? category;
  int? color;
  String? reminder;
  int? joinedUID;
Task({

 this.id,
  this.title,
  this.description,
  this.startDate,
  this.endDate,
  this.startTime,
  this.endTime,
  this.done,
  this.category,
  this.color,
  this.reminder,
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
  done=json['done'];
  category=json['category'];
  color=json['color'];
  reminder=json['reminder'];
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
    data['done']=this.done;
    data['reminder']=this.reminder;
    data['JoinedUID']=this.joinedUID;


    return data;
  }
}

