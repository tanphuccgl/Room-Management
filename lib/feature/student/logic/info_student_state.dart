// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'info_student_bloc.dart';

class InfoStudentState extends Equatable {
  final WStudent student;

  const InfoStudentState({required this.student});

  @override
  List<Object?> get props => [
        student,
      ];

  InfoStudentState copyWith({
    WStudent? student,
  }) {
    return InfoStudentState(
      student: student ?? this.student,
    );
  }
}
