import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_firebase/app/widgets/custom_toast.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
RxBool isLoading = false.obs;
RxBool obsecureText = true.obs;
TextEditingController nameC = TextEditingController();
TextEditingController emailC = TextEditingController();
TextEditingController passC = TextEditingController();
FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;

@override
Future<void> onInit() async {
  super.onInit();
}

Future<void> registration() async {
  if (passC.text.isNotEmpty) {
    isLoading.value = true;
    try{
      UserCredential respondentCredential = await auth.createUserWithEmailAndPassword(
        email: emailC.text.trim(), 
        password: passC.text,
      );

      if (respondentCredential.user != null) {
        String uid = respondentCredential.user!.uid;

        DocumentReference users = firestore.collection("users").doc(uid);
        await users.set({
          "user_id": uid,
          "name": nameC.text,
          "email": emailC.text.trim(),
          "created_at": DateTime.now().toIso8601String(),
        });

        await respondentCredential.user!.sendEmailVerification();
        auth.signOut();
        await auth.signInWithEmailAndPassword(
          email: emailC.text.trim(), 
          password: passC.text
        );
        Get.back();
        Get.back();
        CustomToast.successToast('Success', 'berhasil mendaftar');

        isLoading.value = false;
      }
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      if (e.code == 'weak-password') {
        CustomToast.errorToast('Error', 'kata sandi terlalu pendek');
      }else if (e.code == 'email-already-in-use') {
        CustomToast.errorToast('Error', 'Email sudah ada');
      }else if (e.code == 'wrong-password') {
        CustomToast.errorToast('Error', 'Salah kata sandi');
      }else {
        CustomToast.errorToast('Error', 'error : ${e.code}');
      }
    } catch (e) {
      isLoading.value = false;
      CustomToast.errorToast('Error', 'error :${e.toString()}');
    }
  } else {
    CustomToast.errorToast('Error', 'Kata sandi harus diisikan');
  }
}
}

