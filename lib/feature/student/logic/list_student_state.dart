// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_student_bloc.dart';

class ListStudentState extends Equatable {
  final List<WStudent> list;

  const ListStudentState({this.list = const []});
  @override
  List<Object?> get props => [
        list,
      ];

  ListStudentState copyWith({
    List<WStudent>? list,
  }) {
    return ListStudentState(
      list: list ?? this.list,
    );
  }
}
