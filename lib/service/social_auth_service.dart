import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SocialAuthServices {
  static Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      UserCredential result = await FirebaseAuth.instance.signInWithCredential(
        authCredential,
      );
      final User? user = result.user;
      String? getIdToken = await result.user!.getIdToken();
      print('authCredential----$getIdToken');

      // final UserCredential authResult =
      //     await FirebaseAuth.instance.signInWithCredential(credential);

      // final User? user = authResult.user;
      // Get.to(const CreateAccountScreen());
      /*Get.to(Demo(
        email: user?.email,
      ));*/
      // print("User Email: ${user?.email}");
      // print("idToken: ${credential}");

      return user;
    } catch (error) {
      print("Error signing in with Google: $error");
      return null;
    }
  }
}
