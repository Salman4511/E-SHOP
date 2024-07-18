// ignore_for_file: avoid_print

import 'package:e_shop/model/user_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? _user;

  User? get user => _user;

  Future<void> signUp(String email, String password, String name) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String id = DateTime.now().microsecondsSinceEpoch.toString();

      UserModel user = UserModel(
        id: id,
        name: name,
        email: email,
      );
      await firestore.collection("users").doc(id).set(user.toMap());
    } on Exception catch (e) {
      print("the error is found $e");
      notifyListeners();
    } catch (e) {
      print(e);
      rethrow;
    }
  }


  Future<bool> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }
}
