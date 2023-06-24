// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "view_contract_bloc.dart";

class ViewContractState extends Equatable {
  final WContract contract;
  final WStudent student;

  const ViewContractState({
    required this.contract,
    required this.student,
  });
  @override
  List<Object?> get props => [
        contract,
        student,
      ];

  ViewContractState copyWith({
    WContract? contract,
    WStudent? student,
  }) {
    return ViewContractState(
      contract: contract ?? this.contract,
      student: student ?? this.student,
    );
  }
}
