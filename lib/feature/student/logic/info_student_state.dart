// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'info_student_bloc.dart';

class InfoStudentState extends Equatable {
  final WStudent student;
  final String name;
  final String gender;
  final String phone;
  final String email;
  final String place;
  final String numberId;
  final String dateOfBirth;

  const InfoStudentState({
    required this.student,
    this.name = "",
    this.gender = "",
    this.phone = "",
    this.email = "",
    this.place = "",
    this.numberId = "",
    this.dateOfBirth = "",
  });

  @override
  List<Object?> get props => [
        student,
        name,
        gender,
        phone,
        email,
        place,
        dateOfBirth,
        numberId,
      ];

  InfoStudentState copyWith({
    WStudent? student,
    String? name,
    String? gender,
    String? phone,
    String? email,
    String? place,
    String? numberId,
    String? dateOfBirth,
  }) {
    return InfoStudentState(
      student: student ?? this.student,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      place: place ?? this.place,
      numberId: numberId ?? this.numberId,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }
}
