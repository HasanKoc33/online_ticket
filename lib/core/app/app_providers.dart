part of 'app_config.dart';

/// Uygulama için gerekli olan providerların toplandığı sınıf
class AppProviders {
  /// Uygulama için gerekli olan providerların get metodu
  List<SingleChildWidget> items = [
    ChangeNotifierProvider(create: (context) => TicketProvider()..listen()),
    BlocProvider(create: (context) => AuthCubit()..authListen()),

  ];
}
