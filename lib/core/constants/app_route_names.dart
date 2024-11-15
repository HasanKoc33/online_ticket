/// Uygulşama sayfa isimlerinin tutulduğu enum
enum AppRouteName {
  /// Splash Screen
  splash('/', '/'),

  /// giriş yap
  login('/login', 'login'),


  /// şifremi unuttum
  forgotPassword('/forgotPassword', 'forgotPassword'),

  /// ana sayfa panel
  dashboard('/dashboard', 'dashboard'),


  createTicket('/createTicket', 'createTicket'),
  verifyTicket('/verifyTicket', 'verifyTicket'),
  ticketList('/ticketList', 'ticketList'),

  ;

  const AppRouteName(this.path, this.routeName);

  /// Sayfa isimleri
  final String routeName;

  /// Sayfa pathleri
  final String path;
}
