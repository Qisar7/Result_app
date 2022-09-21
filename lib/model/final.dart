// class Final {
//   List<Result1> result1;

//   Final({this.result1});

//   Final.fromjson(List<dynamic> json) {
//     List<Result1> result0 = [];

//     result0 = json.map((e) => Result1.formjsonn(e)).toList();

//     result1 = result0;
//   }
// }

// class Result1 {
//   String stu_id;
//   String sub1;
//   String sub2;
//   String sub3;
//   String sub4;
//   String sub5;
//   String selec_id;
//   String stu_name;

//   Result1({
//     this.stu_id,
//     this.sub1,
//     this.sub2,
//     this.sub3,
//     this.sub4,
//     this.sub5,
//     this.selec_id,
//     this.stu_name,
//   });
//   Result1.formjsonn(Map<String, dynamic> json) {
//     stu_id = json["mat_id"];
//     sub1 = json["Arabic_language"];
//     sub2 = json["computer_science"];
//     sub3 = json["Wedding"];
//     sub4 = json["encryption"];
//     sub5 = json["result"];
//     selec_id = json["selec_id"];
//     stu_name = json["stu_name"];
//   }
// }
