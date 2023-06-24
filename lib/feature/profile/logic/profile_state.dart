// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "profile_bloc.dart";

class ProfileState extends Equatable {
  final String totalGroup;
  final String totalRoom;
  final String totalRoomFull;
  final WUser user;

  const ProfileState({
    this.totalGroup = "",
    this.totalRoom = "",
    this.totalRoomFull = "",
    required this.user,
  });

  @override
  List<Object?> get props => [
        totalGroup,
        totalRoom,
        totalRoomFull,
        user,
      ];

  ProfileState copyWith({
    String? totalGroup,
    String? totalRoom,
    String? totalRoomFull,
    WUser? user,
  }) {
    return ProfileState(
      totalGroup: totalGroup ?? this.totalGroup,
      totalRoom: totalRoom ?? this.totalRoom,
      totalRoomFull: totalRoomFull ?? this.totalRoomFull,
      user: user ?? this.user,
    );
  }
}
