import 'package:firebase_auth/firebase_auth.dart';

/// Firebase Authentication servisini kullanarak kullanıcı
/// giriş işlemlerini gerçekleştiren sınıf
class FirebaseAuthService {
  FirebaseAuthService._();

  static FirebaseAuthService? _instance;

  static FirebaseAuthService get instance => _instance ??= FirebaseAuthService._();


  final _firebaseAuth = FirebaseAuth.instance;


  /// mevcut kullanıcının id si ni döndürür
  String? get uid => _firebaseAuth.currentUser?.uid;

  /// mevcut kullanıcının email ini döndürür
  String? get email => _firebaseAuth.currentUser?.email;

  @override
  bool isSignedIn() => _firebaseAuth.currentUser != null;

  /// instance
  FirebaseAuth get instence => _firebaseAuth;

  @override
  Future<void> login({required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  /// parola sıfırla
  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }


  /// kullanıcı kaydı yapar
  Future<User?> singIn({
    required String email,
    required String password,
    required String fullName,
  }) async {
    final user = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
   return user.user;
  }

  /// kullanıcı sil
  Future<void> deleteUser() async {
    await _firebaseAuth.currentUser!.delete();
  }


}
