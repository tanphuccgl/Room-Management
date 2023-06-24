// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "new_password_bloc.dart";

class NewPasswordState extends Equatable {
  final String pw;
  final String confirmPw;

  const NewPasswordState({this.pw = "", this.confirmPw = ""});
  @override
  List<Object?> get props => [
        pw,
        confirmPw,
      ];

  NewPasswordState copyWith({
    String? pw,
    String? confirmPw,
  }) {
    return NewPasswordState(
      pw: pw ?? this.pw,
      confirmPw: confirmPw ?? this.confirmPw,
    );
  }
}
