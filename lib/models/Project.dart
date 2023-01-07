import 'package:shop_app/services/user_service.dart';

class Project{
  String? name;
  String? supervisor;
  String? president;
  String? examiner;
  String? firstStudent;
  String? secondStudent;
  String? thirdStudent;
  double? vivaMark;
  int? spMark;
  int? prMark;
  int? exMark;
  int? year;
  int? userId;


  Project({
   this.name,
   this.supervisor,
   this.president,
   this.examiner,
   this.firstStudent,
   this.secondStudent,
   this.thirdStudent,
   this.vivaMark,
   this.spMark,
   this.prMark,
   this.exMark,
    this.year,
    this.userId
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      supervisor: json['supervisor'],
      president: json['president'],
      examiner: json['examiner'],
      firstStudent: json['firstStudent'],
      secondStudent: json['familyName'],
      thirdStudent: json['thirdStudent'],
      vivaMark: json['vivaMark'],
      spMark: json['spMark'],
      prMark: json['prMark'],
      exMark: json['exMark'],
    );
  }
}