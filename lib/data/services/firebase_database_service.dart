import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

/// Firebase DAtabase işlemleri
class FirebaseDatabaseService {

  FirebaseDatabaseService._();

  static FirebaseDatabaseService? _instance;

  static FirebaseDatabaseService get instance => _instance ??= FirebaseDatabaseService._();

  final _storage = FirebaseStorage.instance;

  /// singleton
  FirebaseDatabase get fInstance => FirebaseDatabase.instance;

  @override
  Future<void> addData({required String path,required Map<String, dynamic> data}) async {
    await FirebaseDatabase.instance.ref(path).set(data);
  }


  /// foto
  Future<String> uploadStronge(XFile filePath) async {
    try {
      final storageRef = _storage.ref();

      final metadata = SettableMetadata(
          contentType: filePath.mimeType ?? 'image/jpg',
          customMetadata: {'image/jpg': filePath.path,},);
      final data = await storageRef
          .child(filePath.name)
          .putData((await filePath.readAsBytes()), metadata);

      return data.ref.getDownloadURL();
    } catch (e) {
      rethrow;
    }
  }


  @override
  void init() {}

  @override
  Future<bool> isAdmin(String? uid) async {
    final response =
        await FirebaseDatabase.instance.ref('Admin').orderByKey().equalTo(uid).get();
    // ignore: avoid_bool_literals_in_conditional_expressions
    final isAdmin = response.value != null ? true : false;
    return isAdmin;
  }

  Future<void> updateData({required String path,required Map<String, dynamic> data}) async {
    await FirebaseDatabase.instance.ref(path).update(data);
  }

  @override
  Future<void> removeData(String path) async {
    await FirebaseDatabase.instance.ref(path).remove();
  }

  @override
  Future<Map<String, dynamic>> getData(String path) async {
    final data = await FirebaseDatabase.instance.ref().child(path).get();
    return Map<String, dynamic>.from(
      data.value as Map? ?? {},
    );
  }
  Future<dynamic> getOnceData(String path) async {
    final data = await FirebaseDatabase.instance.ref().child(path).once();
    return data.snapshot.value;
  }

  @override
  Stream<DatabaseEvent> onValue(String path) {
    return FirebaseDatabase.instance.ref(path).onValue;
  }

  @override
  Stream<DatabaseEvent> onChildRemoved(String path) {
    return FirebaseDatabase.instance.ref(path).onChildRemoved;
  }

  @override
  Future<String> getKey(String path) async {
    return FirebaseDatabase.instance.ref(path).push().key ?? '';
  }



}
