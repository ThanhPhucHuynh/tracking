import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking/blocs/auth/auth_bloc.dart';
import 'package:tracking/langs/locale_keys.g.dart';
import 'package:tracking/pages/list/list_page.dart';
import 'package:tracking/pages/login/login_page.dart';

import 'blocs/auth/auth_even.dart';
import 'blocs/auth/auth_state.dart';
import 'pages/home/home.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    print(change);
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // init firebase
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();

  runApp(BlocProvider(
    create: (context) => AuthenticationBloc()..add(AuthenticationStarted()),
    child: EasyLocalization(
      path: 'assets/translations',
      saveLocale: true,
      supportedLocales: [
        Locale('vi', 'VN'),
        Locale('en', 'US'),
        Locale('vi'),
        Locale('en'),
      ],
      fallbackLocale: Locale('en', 'US'),
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tracking",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        // if (state is AuthenticationFailure) {
        // return LoginPage();
        // }

        if (state is AuthenticationSuccess) {
          return HomePage();
        }

        return ListPage();

        return Scaffold(
          appBar: AppBar(),
          body: Container(
            child: Center(
              child: Text(LocaleKeys.LoginGoogle).tr(),
            ),
          ),
        );
      }),
      // MyHomePage(title: "Home a"),
    );
  }
}
