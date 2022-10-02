import 'package:authh_app/ui/rent_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _db = FirebaseFirestore.instance;
//  addEmployee(RentDetails rentDetails) async {
//     await _db.collection("Employees").add(rentDetails._toMap());
//   }


  Future<DocumentReference> addPet(RentDetails rentDetailsRen) {
    return _db.collection("property_main").add(rentDetailsRen.toJson());
  }