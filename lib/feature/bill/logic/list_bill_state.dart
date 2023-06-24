// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_bill_bloc.dart';

class BillState extends Equatable {
  final List<WBill> listBill;

  const BillState({
    this.listBill = const [],
  });
  @override
  // TODO: implement props
  List<Object?> get props => [
        listBill,
      ];

  BillState copyWith({
    List<WBill>? listBill,
  }) {
    return BillState(
      listBill: listBill ?? this.listBill,
    );
  }
}
