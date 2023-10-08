import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist_app/presentation/bloc/events/auth_events.dart';
import 'package:todolist_app/presentation/bloc/states/auth_states.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  AuthBloc()
      : super(StateAuth(
            loginScreen: true,
            viewPassword: true,
            loadingScreenAuth: false)) // Valor inicial
  {
    on<UpdateLoginScreen>(
      (event, emit) {
        // Informar que ele terá um novo estado
        emit(
          StateAuth(
              loginScreen: event.loginScreen,
              loadingScreenAuth: (state as StateAuth).loadingScreenAuth,
              viewPassword: (state as StateAuth).viewPassword),
        );
      },
    ); // Monitorar esses eventos
    on<UpdateLoadingAuth>(
      (event, emit) {
        emit(StateAuth(
          loadingScreenAuth: event.loadingScreen,
          loginScreen: (state as StateAuth).loginScreen,
          viewPassword: (state as StateAuth).viewPassword,
        ));
      },
    );
    on<UpdateViewPasswords>(
      (event, emit) {
        emit(
          StateAuth(
            viewPassword: event.viewPassword,
            loginScreen: (state as StateAuth).loginScreen,
            loadingScreenAuth: (state as StateAuth).loadingScreenAuth,
          ),
        );
      },
    );
  }
}
