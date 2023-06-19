// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email;

  final String password;

  final bool isLoading;

  const LoginState({
    this.email = "",
    this.password = "",
    this.isLoading = false,
  });
  @override
  List<Object?> get props => [
        email,
        password,
        isLoading,
      ];

  LoginState copyWith({
    String? email,
    String? password,
    bool? isLoading,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
