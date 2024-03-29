import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finly_flutter001/src/pages/routes.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import '../../app.dart';
import '../../models/user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    // Add
    on<LoginEventAdd>((event, emit) async {
      // execute something
      await Future.delayed(Duration(seconds: 1));
      emit(state.copyWith(count: state.count + 1));
    });
    // Remove
    on<LoginEventRemove>((event, emit) async {
      if (state.count > 0) {
        // execute something
        await Future.delayed(Duration(seconds: 1));
        emit(state.copyWith(count: state.count - 1));
      }
    });
    // Login
    on<LoginEventLogin>((event, emit) async {
      // execute something
      if (event.payload.username == "admin" &&
          event.payload.password == "1234") {
        emit(state.copyWith(isAuthened: true));
        if (navigatorState.currentContext != null) {
          Navigator.pushReplacementNamed(
            navigatorState.currentContext!,
            AppRoute.home,
          );
        }
      } else {
        emit(state.copyWith(isAuthened: false));
      }
    });
  }
}
