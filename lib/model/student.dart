class Data {
  int id;
  String name;
  String special;
  double score;
  String rate;
  String sub1;
  String sub2;
  String sub3;
  String sub4;
  String sub5;
  String sub6;

  Data({
    this.id,
    this.name,
    this.special,
    this.score,
    this.rate,
    this.sub1,
    this.sub2,
    this.sub3,
    this.sub4,
    this.sub5,
    this.sub6,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    special = json['special'];
    score = json['score'];
    rate = json['rate'];
    sub1 = json['sub1'];
    sub2 = json['sub2'];
    sub3 = json['sub3'];
    sub4 = json['sub4'];
    sub5 = json['sub5'];
    sub6 = json['sub6'];
    // result = Result.fromjson(json['result']);
  }
}

class Result {
  String sub1;
  String sub2;
  String sub3;
  String sub4;
  String sub5;
  String sub6;

  Result({this.sub1, this.sub2, this.sub3, this.sub4, this.sub5, this.sub6});

  Result.fromjson(Map<String, dynamic> json) {
    sub1 = json['sub1'];
    sub2 = json['sub2'];
    sub3 = json['sub3'];
    sub4 = json['sub4'];
    sub5 = json['sub5'];
    sub6 = json['sub6'];
  }
}


  //  "mat_id": "56789029",
  //   "Arabic_language": "70",
  //   "computer_science": "60",
  //   "Wedding": "99",
  //   "encryption": "80",
  //   "result": "77",
  //   "selec_id": "345689",
  //   "stu_name": "mohamed ali"