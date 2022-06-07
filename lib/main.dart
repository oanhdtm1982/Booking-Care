import 'dart:async';
import 'package:doanchuyennganh/Screens/welcome_screen.dart';
import 'package:doanchuyennganh/bloc/auth_bloc/auth_bloc.dart';
import 'package:doanchuyennganh/bloc/banner_bloc/banner_bloc.dart';
import 'package:doanchuyennganh/bloc/bookRegister/book_reg_bloc.dart';
import 'package:doanchuyennganh/bloc/book_add_register_user/book_reg_user_bloc.dart';
import 'package:doanchuyennganh/bloc/email_bloc/email_bloc.dart';
import 'package:doanchuyennganh/bloc/email_information_register/email_information_register_bloc.dart';
import 'package:doanchuyennganh/bloc/notification_bloc/notification_bloc.dart';
import 'package:doanchuyennganh/bloc/register_bloc/booking_bloc.dart';
import 'package:doanchuyennganh/cubit/theme_cubit.dart';
import 'package:doanchuyennganh/repository/auth_repository/auth_repository.dart';
import 'package:doanchuyennganh/repository/banner_repository/bannerRepository.dart';
import 'package:doanchuyennganh/repository/booking_repository/bookingRepository.dart';
import 'package:doanchuyennganh/repository/email_repository/email_repository.dart';
import 'package:doanchuyennganh/repository/notification_repository/notification_repository.dart';
import 'package:doanchuyennganh/widgets/AppBlocObserver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  await Firebase.initializeApp();
  BlocOverrides.runZoned(
      () => HydratedBlocOverrides.runZoned(
          () => runApp(
                MaterialApp(
                  home: MyApp(),
                ),
              ),
          storage: _storage),
      blocObserver: AppBlocObserver());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => NotificationRepository()),
          RepositoryProvider(create: (context) => AuthRepository()),
          RepositoryProvider(create: (context) => BookingRepository()),
          RepositoryProvider(create: (context) => BannerRepository()),
          RepositoryProvider(create: (context) => EmailRepository()),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
            BlocProvider(
                create: (context) => AuthBloc(
                    authRepository:
                        RepositoryProvider.of<AuthRepository>(context))),
            BlocProvider(
                create: (context) => EmailBloc(
                    emailRepository:
                        RepositoryProvider.of<EmailRepository>(context))),
            BlocProvider(
                create: (context) => BookRegUserBloc(
                    bookingRepository:
                        RepositoryProvider.of<BookingRepository>(context))..add(LoadBookingRegUser())),
            BlocProvider(
                create: (context) => EmailRegUserBloc(
                    bookingRepository:
                        RepositoryProvider.of<BookingRepository>(context))),
            BlocProvider(
                create: (context) => BookingBloc(
                    bookingRepository:
                        RepositoryProvider.of<BookingRepository>(context))
                  ..add(LoadBooking())),
            BlocProvider(
                create: (context) => NotificationBloc(
                    notificationRepository:
                        RepositoryProvider.of<NotificationRepository>(context))
                  ..add(LoadNotification())),
            BlocProvider(
                create: (context) => BannerBloc(
                    bannerRepository:
                        RepositoryProvider.of<BannerRepository>(context))
                  ..add(LoadBanner())),
            BlocProvider(
                create: (context) => BookRegBloc(
                    bookingRepository:
                        RepositoryProvider.of<BookingRepository>(context))
                  ..add(LoadBookingReg())),
          ],
          child: BlocBuilder<ThemeCubit, bool>(builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Đồ Án Chuyên Ngành',
              themeMode: state ? ThemeMode.dark : ThemeMode.light,
              darkTheme: ThemeData.dark(),
              home: WelcomeScreen(),
              theme: ThemeData(primarySwatch: Colors.blue),
            );
          }),
        ));
  }
}