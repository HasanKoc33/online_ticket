part of 'app_config.dart';

/// Uygulamanın rotalarının tanımlandığı sınıf
final class AppRoutes {
  AppRoutes._();

  /// auth Service
  static final _authService = FirebaseAuthService.instance;

  /// rotalar
  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    initialLocation: AppRouteName.login.path,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: AppRouteName.login.path,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(child: LoginPage());
        },
      ),

      GoRoute(
        path: AppRouteName.dashboard.path,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(child: HomeScreen());
        },
      ),

      GoRoute(
        path: AppRouteName.createTicket.path,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(child: CreateTicketScreen());
        },
      ),

      GoRoute(
        path: AppRouteName.verifyTicket.path,
        pageBuilder: (BuildContext context, GoRouterState state) {
          final id = state.extra as String?;
          return NoTransitionPage(child: TicketVerificationScreen(id: id));
        },
      ),

      GoRoute(
        path: AppRouteName.ticketList.path,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage(child: TicketList());
        },
      ),

    ],
  );
}
