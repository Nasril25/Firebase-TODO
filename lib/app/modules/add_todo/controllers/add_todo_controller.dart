import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_firebase/app/widgets/custom_toast.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class AddTodoController extends GetxController {
  @override
  onClose() {
    titleC.dispose();
    descriptionC.dispose();
  }

  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;

  TextEditingController titleC = TextEditingController();
  TextEditingController descriptionC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void>addTodo() async {
    if (titleC.text.isNotEmpty && descriptionC.text.isNotEmpty) {
      isLoading.value = true;

      if (isLoadingCreateTodo.isFalse) {
        await createTodoData();
        isLoading.value = false;
      }
    } else {
      isLoading.value = false;
      CustomToast.errorToast('Error', 'you need to fill all form');
    }
  }

  createTodoData() async {
    isLoadingCreateTodo.value = true;
    try{
      String uid = auth.currentUser!.uid;
      CollectionReference<Map<String, dynamic>> childrenCollection = 
      await firestore.collection("users").doc(uid).collection("todos");

      var uuidTodo = Uuid().v1();

      await childrenCollection.doc(uuidTodo).set({
        "task_id": uuidTodo,
        "title": titleC.text,
        "description": descriptionC.text,
        "created_at": DateTime.now().toIso8601String(),
      });

      Get.back();
      Get.back();
      CustomToast.successToast('Success', 'Berhasil menambahkan todo');

      isLoadingCreateTodo.value = false;
    } on FirebaseAuthException catch (e) {
      isLoadingCreateTodo.value = false;
      CustomToast.errorToast('Error', 'error : ${e.code}');
    } catch (e) {
      isLoadingCreateTodo.value = false;
      CustomToast.errorToast('Error', 'error : ${e.toString()}');
    }
  }
}