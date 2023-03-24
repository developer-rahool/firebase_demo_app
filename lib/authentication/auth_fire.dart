import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Auth {
  FirebaseAuth firebaseauth = FirebaseAuth.instance;



  //Register Function

  Future<User?> register({required String email, password}) async {
    try{
      UserCredential userCredential = await firebaseauth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e){
        Get.snackbar(
          e.message.toString(),
          e.message.toString(),
          snackPosition: SnackPosition.BOTTOM,
          borderWidth: 2,
          borderRadius: 10,
          backgroundColor: Colors.red,

        );
    }
    return null;
  }

  //Login Function
  Future<User?> signInFunc({required String email, password}) async {
    
    try{
      UserCredential userCredential = await firebaseauth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException 
    catch (e){
      Get.snackbar(
        e.message.toString(),
        e.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        borderRadius: 10,
        borderWidth: 2,
      );
    }
    return null;
    
  }

  Future signOut() async{
    await firebaseauth.signOut();
  }
}
