// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_student_bloc.dart';

class CreateStudentState extends Equatable {
  final String name;
  final String gender;
  final String phone;
  final String email;
  final String place;
  final String numberId;
  final String dateOfBirth;
  final bool isLoading;

  const CreateStudentState({
    this.name = "",
    this.gender = "",
    this.phone = "",
    this.email = "",
    this.place = "",
    this.numberId = "",
    this.dateOfBirth = "",
    this.isLoading = false,
  });
  @override
  List<Object?> get props => [
        name,
        gender,
        phone,
        email,
        place,
        dateOfBirth,
        numberId,
        isLoading,
      ];

  CreateStudentState copyWith({
    String? name,
    String? gender,
    String? phone,
    String? email,
    String? place,
    String? numberId,
    String? dateOfBirth,
    bool? isLoading,
  }) {
    return CreateStudentState(
      name: name ?? this.name,
      gender: gender ?? this.gender,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      place: place ?? this.place,
      numberId: numberId ?? this.numberId,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
