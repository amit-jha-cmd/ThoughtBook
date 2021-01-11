import 'package:flutter_twitter/flutter_twitter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
final TwitterLogin twitterLogin = TwitterLogin(
  consumerKey: 'OixYnsjNPGZaFdQif141aBzxI',
  consumerSecret: 'cZBlewtbukn9zjx2KppFuMnJT7ucM8F14ggZEWaNFCwkXj9z54',
);

String name;
String imageURL;

Future<FirebaseUser> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    idToken: googleSignInAuthentication.accessToken,
    accessToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  if (user != null) {
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final Future<FirebaseUser> currentUser = _auth.currentUser();
    currentUser.then((value) {
      assert(user.uid == value.uid);
    });

    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoUrl != null);

    name = user.displayName;
    imageURL = user.photoUrl;

    print('singInWithGoogle succeeded: $user');

    return user;
  }

  return null;
}

Future<void> signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Signed Out");
}

Future<FirebaseUser> singinTwitter() async {
  final TwitterLoginResult result = await twitterLogin.authorize();

  switch (result.status) {
    case TwitterLoginStatus.loggedIn:
      var session = result.session;
      final AuthCredential credential = await TwitterAuthProvider.getCredential(
        authToken: session.token,
        authTokenSecret: session.secret,
      );

      final AuthResult authResult =
          await _auth.signInWithCredential(credential);
      final FirebaseUser user = authResult.user;

      if (user != null) {
        assert(!user.isAnonymous);
        assert(await user.getIdToken() != null);

        final Future<FirebaseUser> currentUser = _auth.currentUser();
        currentUser.then((value) {
          assert(user.uid == value.uid);
        });

        assert(user.displayName != null);
        assert(user.photoUrl != null);

        name = user.displayName;
        imageURL = user.photoUrl;

        print('singInWithTwitter succeeded: $user');

        return user;
      }

      return null;
      break;
    case TwitterLoginStatus.cancelledByUser:
      // _s(howCancelMessage();
      print("cancelled by user");
      return null;
      break;
    case TwitterLoginStatus.error:
      // _showErrorMessage(result.error);
      print(result.errorMessage);
      return null;
      break;
  }
}

Future<void> singOutTwitter() {
  twitterLogin.logOut();

  print("User Signed out");
}
