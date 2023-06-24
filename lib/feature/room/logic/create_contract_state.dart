// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "create_contract_bloc.dart";

class CreateContractState extends Equatable {
  final String hostName;
  final String hostPhone;
  final String hostPlace;
  final String hostEmail;

  final WStudent student;
  final String roomPlace;
  final String roomStart;
  final String roomEnd;

  final String roomPrice;
  final String roomPay;
  final String roomOtherFees;
  final String roomDeposit;

  final String roomRule;
  final String roomFix;

  final String roomContractTerminatio;
  final String roomDispute;

  const CreateContractState({
    this.hostName = "",
    this.hostPhone = "",
    this.hostPlace = "",
    this.hostEmail = "",
    required this.student,
    this.roomPlace = "",
    this.roomStart = "",
    this.roomEnd = "",
    this.roomPrice = "",
    this.roomPay = "",
    this.roomOtherFees = "",
    this.roomDeposit = "",
    this.roomRule = "",
    this.roomFix = "",
    this.roomContractTerminatio = "",
    this.roomDispute = "",
  });
  @override
  List<Object?> get props => [
        hostName,
        hostPhone,
        hostPlace,
        hostEmail,
        student,
        roomPlace,
        roomStart,
        roomEnd,
        roomPrice,
        roomPay,
        roomOtherFees,
        roomDeposit,
        roomRule,
        roomFix,
        roomContractTerminatio,
        roomDispute,
      ];

  CreateContractState copyWith({
    String? hostName,
    String? hostPhone,
    String? hostPlace,
    String? hostEmail,
    WStudent? student,
    String? roomPlace,
    String? roomStart,
    String? roomEnd,
    String? roomPrice,
    String? roomPay,
    String? roomOtherFees,
    String? roomDeposit,
    String? roomRule,
    String? roomFix,
    String? roomContractTerminatio,
    String? roomDispute,
  }) {
    return CreateContractState(
      hostName: hostName ?? this.hostName,
      hostPhone: hostPhone ?? this.hostPhone,
      hostPlace: hostPlace ?? this.hostPlace,
      hostEmail: hostEmail ?? this.hostEmail,
      student: student ?? this.student,
      roomPlace: roomPlace ?? this.roomPlace,
      roomStart: roomStart ?? this.roomStart,
      roomEnd: roomEnd ?? this.roomEnd,
      roomPrice: roomPrice ?? this.roomPrice,
      roomPay: roomPay ?? this.roomPay,
      roomOtherFees: roomOtherFees ?? this.roomOtherFees,
      roomDeposit: roomDeposit ?? this.roomDeposit,
      roomRule: roomRule ?? this.roomRule,
      roomFix: roomFix ?? this.roomFix,
      roomContractTerminatio:
          roomContractTerminatio ?? this.roomContractTerminatio,
      roomDispute: roomDispute ?? this.roomDispute,
    );
  }
}
