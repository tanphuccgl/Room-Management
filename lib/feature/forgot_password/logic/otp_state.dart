// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "otp_bloc.dart";

class OTPState extends Equatable {
  final String text1;
  final String text2;
  final String text3;
  final String text4;

  const OTPState(
      {this.text1 = "", this.text2 = "", this.text3 = "", this.text4 = ""});

  @override
  // TODO: implement props
  List<Object?> get props => [
        text1,
        text2,
        text3,
        text4,
      ];

  OTPState copyWith({
    String? text1,
    String? text2,
    String? text3,
    String? text4,
  }) {
    return OTPState(
      text1: text1 ?? this.text1,
      text2: text2 ?? this.text2,
      text3: text3 ?? this.text3,
      text4: text4 ?? this.text4,
    );
  }
}
