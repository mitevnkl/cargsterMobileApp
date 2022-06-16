import 'package:booking_sdk/providers/firebase_providers.dart';
import 'package:cargster/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseOtp {
  static void generateOtp(String contact) async {
    String verificationId =
        providerContainer.read(verificationIdProvider).state;
    FirebaseAuth _auth = providerContainer.read(firebaseAuthProvider).state;
    // String contact = providerContainer.read(contactNumberProvider).state;

    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      providerContainer.read(verificationIdProvider).state = verId;
    };
    await _auth.verifyPhoneNumber(
        phoneNumber: contact,
        codeAutoRetrievalTimeout: (String verId) {
          providerContainer.read(verificationIdProvider).state = verId;
        },
        codeSent: smsOTPSent,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (AuthCredential phoneAuthCredential) {},
        verificationFailed: (FirebaseAuthException exception) {
          // Navigator.pop(context, exception.message);
          //  switch (error.code) {
          //       case 'ERROR_INVALID_VERIFICATION_CODE':
        });
  }

  static Future<void> verifyOtp(String smsOTP) async {
    // String smsOTP = providerContainer.read(smsOtpProvider).state;
    String verificationId =
        providerContainer.read(verificationIdProvider).state;
    FirebaseAuth _auth = providerContainer.read(firebaseAuthProvider).state;

    if (smsOTP == null || smsOTP == '') {
      throw new Exception('emptyOtp');
    }

    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsOTP,
    );
    try {
      final UserCredential user = await _auth.signInWithCredential(credential);

      User currentUser = providerContainer.read(currentUserProvider).state;
      currentUser = _auth.currentUser;
      assert(user.user.uid == currentUser.uid);
    } catch (e) {
      throw e;
    }
    // Navigator.pushReplacementNamed(context, '/homeScreen');
  }
}
