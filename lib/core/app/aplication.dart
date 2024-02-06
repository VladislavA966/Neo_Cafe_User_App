import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_cafe_24/core/dependensies/di.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/domain/use_case/sign_in_use_case.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/presentation/bloc/sign_in_bloc.dart';
import 'package:neo_cafe_24/features/auth/create_new_proifle/domain/use_case/sign_up_use_case.dart';
import 'package:neo_cafe_24/features/auth/create_new_proifle/presentation/bloc/sign_up_bloc.dart';
import 'package:neo_cafe_24/features/main_screen/presentation/screens/main_screen.dart';
import 'package:neo_cafe_24/features/menu_screen/presentation/screens/menu_screen.dart';
import 'package:neo_cafe_24/features/welcom_screen/welcome_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignInBloc(
            getIt<SignInUseCase>(),
          ),
        ),
        BlocProvider(
          create: (context) => SignUpBloc(
            getIt<SignUpUseCase>(),
          ),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MenuScreen(),
      ),
    );
  }
}
