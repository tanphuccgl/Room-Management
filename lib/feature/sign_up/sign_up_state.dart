// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "sign_up_bloc.dart";

class SignUpState extends Equatable {
  final String username;
  final String email;
  final String password;
  final String rePassword;
  final bool isLoading;

  const SignUpState({
    this.username = "",
    this.email = "",
    this.password = "",
    this.rePassword = "",
    this.isLoading = false,
  });
  @override
  List<Object?> get props => [
        username,
        email,
        password,
        rePassword,
        isLoading,
      ];

  SignUpState copyWith({
    String? username,
    String? email,
    String? password,
    String? rePassword,
    bool? isLoading,
  }) {
    return SignUpState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
