// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "info_contract_bloc.dart";

class InfoContractState extends Equatable {
  final WRoom room;
  final String name;
  final String numberMember;
  final String numberRoom;
  final WStudent student;
  final bool isEdit;
  final String idStudentSelected;

  const InfoContractState({
    required this.room,
    this.name = "",
    this.numberMember = "",
    this.numberRoom = "",
    required this.student,
    this.isEdit = false,
    this.idStudentSelected = "",
  });
  @override
  List<Object?> get props => [
        room,
        name,
        numberMember,
        numberRoom,
        student,
        isEdit,
        idStudentSelected,
      ];

  InfoContractState copyWith({
    WRoom? room,
    String? name,
    String? numberMember,
    String? numberRoom,
    WStudent? student,
    bool? isEdit,
    String? idStudentSelected,
  }) {
    return InfoContractState(
      room: room ?? this.room,
      name: name ?? this.name,
      numberMember: numberMember ?? this.numberMember,
      numberRoom: numberRoom ?? this.numberRoom,
      student: student ?? this.student,
      isEdit: isEdit ?? this.isEdit,
      idStudentSelected: idStudentSelected ?? this.idStudentSelected,
    );
  }
}
