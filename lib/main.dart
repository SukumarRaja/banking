import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/network/dio_client.dart';
import 'features/auth/data/api/auth_api_client.dart';
import 'features/auth/data/repository_implementation.dart';
import 'features/auth/domain/use_cases/login_use_case.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/ui/login_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (_) => AuthBloc(
                LoginUseCase(
                  AuthRepositoryImpl(apiClient: AuthApiClient(setupDio())),
                ),
              ),
        ),
      ],
      child: MaterialApp(home: LoginScreen()),
    ),
  );
}
