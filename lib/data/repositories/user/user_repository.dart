import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/personalization/models/user_model.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get to => Get.find();

  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      return await db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw IFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const IFormatException();
    } on PlatformException catch (e) {
      throw IPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
