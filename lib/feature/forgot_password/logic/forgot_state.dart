// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "forgot_bloc.dart";

class ForgotPasswordState extends Equatable {
  final String email;
  final WUser user;

  const ForgotPasswordState({this.email = "", required this.user});

  @override
  // TODO: implement props
  List<Object?> get props => [
        email,
        user,
      ];

  ForgotPasswordState copyWith({
    String? email,
    WUser? user,
  }) {
    return ForgotPasswordState(
      email: email ?? this.email,
      user: user ?? this.user,
    );
  }
}
