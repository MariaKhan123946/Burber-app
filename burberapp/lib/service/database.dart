import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseMethods {
  Future<void> addUserDetails(Map<String, dynamic> userInfoMap, String id) async {
    await FirebaseFirestore.instance.collection("Users").doc(id).set(userInfoMap);
  }
  Future<DocumentReference<Map<String, dynamic>>> addUserBooking(Map<String, dynamic> userInfoMap) async {
    return FirebaseFirestore.instance.collection("Booking").add(userInfoMap);
  }
}
