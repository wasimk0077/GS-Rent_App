import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


Future<bool> signIn(String email,String password) async {
  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return true;
  }catch(e){
  print(e);
  return false;
}}
Future<bool> register(String email,String password) async {
  try{
    await FirebaseAuth.instance
    .createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch(e){
   if(e.code=='weak-password'){
    print('The password is weak');
    

   }else if(e.code=='email-already-in-use'){
    print('The account already exists for that email.');
   
   }
   return false;
  }
  catch(e){
    print(e.toString());
    return false;
  } 
}

// Future<bool> addDetails(String Propertyname,String CarpetArea,String Floor,String Firm,String Tenant,String Rent,String AssetValue,String Yield) async{
//   try{
//     await CollectionReference property_main=FirebaseFirestore.instance.collection("property_main");
//      property_main.add({'Carpet_Area':CarpetArea,'Firm':Firm,'Floor':Floor,'Property_name':Propertyname,'Tenant':Tenant,'Yield':Yield}).then((value)=>print("User Added")).catchError((error)=>print("failed to add"));
//   }
  
// }

