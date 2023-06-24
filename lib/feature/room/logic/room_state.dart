// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'room_bloc.dart';

class RoomState extends Equatable {
  final List<WRoom> listroom;
  final String name;
  final bool roomEmpty;
  final String numberMember;
  final WRoom updateroom;
  const RoomState({
    this.listroom = const [],
    this.name = "",
    this.roomEmpty = false,
    this.numberMember = "",
    required this.updateroom,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [
        listroom,
        name,
        roomEmpty,
        numberMember,
        updateroom,
      ];

  RoomState copyWith({
    List<WRoom>? listroom,
    String? name,
    bool? roomEmpty,
    String? numberMember,
    WRoom? updateroom,
  }) {
    return RoomState(
      listroom: listroom ?? this.listroom,
      name: name ?? this.name,
      roomEmpty: roomEmpty ?? this.roomEmpty,
      numberMember: numberMember ?? this.numberMember,
      updateroom: updateroom ?? this.updateroom,
    );
  }
}
