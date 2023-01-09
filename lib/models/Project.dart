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
  String? key;


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
    this.userId,
    this.key,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      name: json['Pr_Name'],
      key: json['Pr_Key'],
      supervisor: json['Supervisor'],
      president: json['President'],
      examiner: json['Examiner'],
      firstStudent: json['Fst_Student'],
      secondStudent: json['Sst_Student'],
      thirdStudent: json['Tst_Student'],
      vivaMark: json['Final_Mark'],
      spMark: json['Sp_Mark'],
      prMark: json['Pr_Mark'],
      exMark: json['Ex_Mark'],
      year: json['Anee'],
    );
  }
}