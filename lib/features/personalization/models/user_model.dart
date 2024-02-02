import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String email;
  String phoneNumber;
  final String userName;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.userName,
    required this.profilePicture,
  });

  String get fullName => '$firstName $lastName';
  String get formattedPhoneNo => IFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(String fullName) {
    return fullName.split(' ');
  }

  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(' ');
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : '';

    String camelCaseUaername = '$firstName$lastName';
    String usernameWithPrefix = 'cwt_$camelCaseUaername'; //add 'cwt_' prefix
    return usernameWithPrefix;
  }

  //static function to create empty user model
  static UserModel empty() {
    return UserModel(
      id: '',
      firstName: '',
      lastName: '',
      email: '',
      phoneNumber: '',
      userName: '',
      profilePicture: '',
    );
  }

  //convert user model to json
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'UserName': userName,
      'ProfilePicture': profilePicture,
    };
  }

  //factory method to create a userModel from firebase document snapshot
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          id: document.id,
          firstName: data['FirstName'] ?? '',
          lastName: data['LastName'] ?? '',
          email: data['Email'] ?? '',
          phoneNumber: data['PhoneNumber'] ?? '',
          userName: data['UserName'] ?? '',
          profilePicture: data['ProfilePicture'] ?? '');
    } else {
      return UserModel.empty();
    }
  }
}
