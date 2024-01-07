part of 'login_bloc.dart';
enum AuthenStatus { init, success, failed }
@immutable
class LoginState extends Equatable {

  final int count;
  final bool isAuthened;
  LoginState({
    this.count = 0,
    this.isAuthened = false,
  });
//  LoginState copyWith({int? count}){
//    return LoginState(count: count ?? this.count);
//  }
//   @override
//   // TODO: implement props
//   List<Object?> get props => [count];
// }


  LoginState copyWith({
    int? count,
    bool? isAuthened,
  }) {
    return LoginState(
      count: count ?? this.count,
      isAuthened: isAuthened ?? this.isAuthened,
    );
  }

  @override
  List<Object?> get props => [count, isAuthened];
}

