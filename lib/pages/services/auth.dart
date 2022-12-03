
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';

class AuthService {
  final FirebaseAuth _auth =FirebaseAuth.instance;
User? get currentUser => _auth.currentUser;
Stream<User?> get authStateChanges => _auth.authStateChanges();
String email=GetStorage().read('usermail');
String password=GetStorage().read('userpassword');



 Future <void> signInWithEmailandPassword(
  {
  required String email,
    required String password,
} 
     )async{
   await _auth.signInWithEmailAndPassword(email: email, password: password);
 }


 Future<void> createUserWithEmailandPassword({
  required String email,
   required String password
}) async {
   print (' try to sign up');
   await _auth.createUserWithEmailAndPassword(email: email, password: password);
   print('signed up------');
 }
 Future<void> signOut() async {
   await _auth.signOut();
 }



}