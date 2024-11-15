
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_ticked/data/services/auth_service.dart';
import 'package:online_ticked/util/bildiriler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthInitalize());
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();


  Future<void> authListen() async {
    emit(const AuthLoading());
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      if (kDebugMode) {
        email.text = 'test@gmail.com';
        password.text = '123456';
        // signIn();
      }
      emit(const AuthUnauthenticated());
    } else {

        emit(AuthAuthenticated(FirebaseAuth.instance.currentUser!));

    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    emit(const AuthUnauthenticated());
    authListen();
  }

  Future<void> signIn() async {
    try {
      emit(const AuthLoading());
      if (email.text.isEmpty || password.text.isEmpty) {
        emit(AuthError(mesaage: 'Email and password cannot be empty.'));
        return;
      }
      await AuthService.instance
          .login(email: email.text, password: password.text);
      authListen();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', email.text);
      prefs.setString('password', password.text);
      mesajj('Giriş Başarılı');
    } catch (e) {
      emit(AuthError(mesaage: '$e'));
    }
  }

  void forgetPassword() {
    if (email.text.isEmpty) {
      emit(AuthError(mesaage: 'Boş Alan Bırakmayın'));
      return;
    }
    emit(const AuthLoading());
    FirebaseAuth.instance
        .sendPasswordResetEmail(email: email.text)
        .then((value) {
      emit(const AuthUnauthenticated());
    }).catchError((error) {
      emit(AuthError(mesaage: error.toString()));
    });
  }


  void login() {
    emit(const Login());
  }

}



abstract class AuthState {
  const AuthState();
}

/// kimlik dogrulama bekleniyor
class AuthInitalize extends AuthState {
  const AuthInitalize();
}

/// kimlik dogrulama bekleniyor
class AuthLoading extends AuthState {
  const AuthLoading();
}

/// kimlik dogrulama hata
class AuthError extends AuthState {
  String mesaage;
  AuthError({required this.mesaage});
}

/// kimliği doğrulanmış adam
class AuthAuthenticated extends AuthState {
  final User user;
  const AuthAuthenticated(this.user);
}


/// kimliksiz adam
class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

class Login extends AuthState {
  const Login();
}

