import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking/blocs/auth/auth_even.dart';
import 'package:tracking/blocs/auth/auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  // AuthenticationBloc(AuthenticationState initialState) : super(initialState);
  AuthenticationBloc() : super(AuthenticationInitial(false));
  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AuthenticationStarted) {
      yield* _mapAuthenticationStartedToState();
    } else if (event is AuthenticationLoggedIn) {
      yield* _mapAuthenticationLoggedInToState();
    } else if (event is AuthenticationLoggedOut) {
      yield* _mapAuthenticationLoggedOutInToState();
    }
  }

  //AuthenticationLoggedOut
  Stream<AuthenticationState> _mapAuthenticationLoggedOutInToState() async* {
    // yield AuthenticationFailure();
    // _userRepository.signOut();
  }

  //AuthenticationLoggedIn
  Stream<AuthenticationState> _mapAuthenticationLoggedInToState() async* {
    // yield AuthenticationSuccess(await _userRepository.getUser());
  }

  // AuthenticationStarted
  Stream<AuthenticationState> _mapAuthenticationStartedToState() async* {
    //   final isSignedIn = await _userRepository.isSignedIn();
    //   if (isSignedIn) {
    //     final firebaseUser = await _userRepository.getUser();
    //     yield AuthenticationSuccess(firebaseUser);
    //   } else {
    //     yield AuthenticationFailure();
    //   }
    // }
  }
}
