import 'package:darzi/models/customer.dart';
import 'package:darzi/models/tailor.dart';
import 'package:darzi/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _authtailor = FirebaseAuth.instance;
  final FirebaseAuth _authcustomer = FirebaseAuth.instance;

  //TAILOR MODULE

  //create tailor obj base on FirebaseUser
  Tailor _tailorFromFirebaseUser(FirebaseUser tailor){
    if (tailor !=null) {
      return Tailor(tid:tailor.uid);
    } else {
      return null;
    }
  }

  //auth change user stream
  Stream<Tailor> get tailor{
    return _authtailor.onAuthStateChanged
    //.map((FirebaseUser user)=>_userFromFirebaseUser(user));
    .map(_tailorFromFirebaseUser);
  }

  //sign in tailor with email & password
  Future signIntailorWithEmailAndPassword(String email,String password) async{
    try{
      AuthResult result = await _authtailor.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user= result.user;
      return _tailorFromFirebaseUser(user);
    } catch(e){
        print(e.toString());
      return null;
    }
  }
  

  //register tailor with email & password
  Future registertailorWithEmailAndPassword(String firstname,String lastname,String email,String mobileno,String password) async{
    try{
      AuthResult result = await _authtailor.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user= result.user;

      //create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updatetailorsdata(firstname,lastname, email,mobileno,password);

      return _tailorFromFirebaseUser(user);
    } catch(e){
        print(e.toString());
      return null;
    }
  }

  Future tailordata(shopname,contactno,specilization,dropdownvalue,_shopaddress,_city,currentItemSelected,_country,_pincode)async{
    try{
      FirebaseUser result= await _authtailor.currentUser();
      FirebaseUser user=result;
      await DatabaseService(uid:user.uid).tailordata(shopname,contactno,specilization,dropdownvalue,_shopaddress,_city,currentItemSelected,_country,_pincode);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future tailordataextra(_ubsprice,_lbsprice,_fbsprice,_ubsprice1,_lbsprice1,_fbsprice1)async{
    try{
      FirebaseUser result= await _authtailor.currentUser();
      FirebaseUser user=result;
      await DatabaseService(uid:user.uid).tailordataextra(_ubsprice,_lbsprice,_fbsprice,_ubsprice1,_lbsprice1,_fbsprice1);
    }catch(e){
      print(e.toString());
      return null;
    }
  }


  //sign out
  Future signOuttailor() async{
    try{
      return await _authtailor.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }


//  CUSTOMER MODULE

   //create tailor obj base on FirebaseUser
  Customer _customerFromFirebaseUser(FirebaseUser customer){
    if (customer !=null) {
      return Customer(cid:customer.uid);
    } else {
      return null;
    }
  }

  //auth change user stream
  Stream<Customer> get customer{
    return _authcustomer.onAuthStateChanged
    //.map((FirebaseUser user)=>_userFromFirebaseUser(user));
    .map(_customerFromFirebaseUser);
  }

 // sign in customer with email & password
  Future signIncustomerWithEmailAndPassword(String email,String password) async{
    try{
      AuthResult result = await _authcustomer.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user= result.user;
      return _customerFromFirebaseUser(user);
    } catch(e){
        print(e.toString());
      return null;
    }
  }
  

  //register customer with email & password
  Future registercustomerWithEmailAndPassword(String firstname,String lastname,String email,String mobileno,String password) async{
    try{
      AuthResult result = await _authcustomer.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user= result.user;
      
      //create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updatecustomersdata(firstname,lastname, email,mobileno);
      return _customerFromFirebaseUser(user);
    } catch(e){
        print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOutcustomer() async{
    try{
      return await _authcustomer.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}
