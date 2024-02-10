import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/personalization/models/user_model.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore db = FirebaseFirestore.instance;

  //function to save user data to firestore
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

//function to fetch user data using user id
  Future<UserModel> fetchUserData() async {
    try {
      final documentSnapshot = await db
          .collection('Users')
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
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

  //function to update user data
  Future<void> updateUserRecord(UserModel updateUseer) async {
    try {
      return await db
          .collection('Users')
          .doc(updateUseer.id)
          .update(updateUseer.toJson());
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

  //function update any fields in specific user collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await db
          .collection('Users')
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
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

  //function to delete user data
  Future<void> deleteUserRecord(String userId) async {
    try {
      await db.collection('Users').doc(userId).delete();
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

  //upload image
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
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
