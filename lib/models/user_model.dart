class User {
  int? id;
  String? name;
  String? alias;
  int? commits;
  String? startDate;
  String? role;
  String? about;
  String? category;

  User({

    this.id,
    this.name,
    this.alias,
    this.commits,
    this.startDate,
    this.role,
    this.about,
    this.category,


  });
  User.fromJson(Map<String,dynamic> json) {
    id=json['id'];
    name=json['name'];
    alias=json['alias'];
    commits=json['commits'];
    startDate=json['joinedDate'];
    role=json['role'];
    about=json['about'];
    category=json['category'];

  }
  Map<String, dynamic> toJson() {
    final Map<String , dynamic> data = new Map<String , dynamic>();
    data['id']=this.id;
    data['name']=this.name;
    data['alias']=this.alias;
    data['commits']=this.commits;
    data['joinedDate']=this.startDate;
    data['role']=this.role;
    data['about']=this.about;
    data['category']=this.category;






    return data;
  }
}

