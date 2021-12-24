import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yum_health/data/model/user_model.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> signUp(String username, String email, String password) async {
    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await inputData(user.user!.uid, username, email);
      return user.user?.uid;
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> inputData(String uId, String username, String email) async {
    final user = DataUser(
      username: username,
      email: email,
      createdAt: Timestamp.fromDate(DateTime.now()),
    );
    final firebase = FirebaseFirestore.instance.collection('users').doc(uId);
    await firebase.set(user.toObject());
  }

  Future<String?> signIn(String email, String password) async {
    try {
      final user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return user.user?.uid;
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> signOut() async {
    await auth.signOut();
    return 'User Log Out';
  }

  bool? getUserId() {
    final id = auth.currentUser?.uid;
    if (id == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<DataUser?> getUserData(String uid) async {
    final snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    if (snapshot.exists) {
      return DataUser.fromObject(snapshot);
    } else {
      return null;
    }
  }
}
