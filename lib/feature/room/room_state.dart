// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "room_bloc.dart";

class RoomState extends Equatable {
  final List<WGroup> listGroup;
  final String name;
  final String place;
  final String number;
  final String numberEmpty;
  const RoomState({
    this.listGroup = const [],
    this.name = "",
    this.place = "",
    this.number = "",
    this.numberEmpty = "",
  });
  @override
  // TODO: implement props
  List<Object?> get props => [
        listGroup,
        name,
        place,
        number,
        numberEmpty,
      ];

  RoomState copyWith({
    List<WGroup>? listGroup,
    String? name,
    String? place,
    String? number,
    String? numberEmpty,
  }) {
    return RoomState(
      listGroup: listGroup ?? this.listGroup,
      name: name ?? this.name,
      place: place ?? this.place,
      number: number ?? this.number,
      numberEmpty: numberEmpty ?? this.numberEmpty,
    );
  }
}
