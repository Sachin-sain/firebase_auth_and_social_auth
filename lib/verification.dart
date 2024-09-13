import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/utils/utils.dart';
import 'package:flutter/material.dart';

class VerificationCode extends StatefulWidget {
  final String verificationId;
  const VerificationCode({super.key, required this.verificationId});

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  TextEditingController verificationCodeController=TextEditingController();
  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Verification Screen"),
      ),
      body: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            controller: verificationCodeController,
            decoration: const InputDecoration(
                hintText: "Enter 6 digit code"
            ),
          ),
          const SizedBox(height: 20,),
          GestureDetector(
            onTap: ()async{
              final credential=PhoneAuthProvider.credential(
                  verificationId: widget.verificationId,
                  smsCode: verificationCodeController.text.toString());
              try{
                await _auth.signInWithCredential(credential);
                // await Navigator.push(context, MaterialPageRoute(builder: (context)=>PostScreen()));
              }catch(e){
                Utils.showToast(e.toString());
              }
            },
          )
        ],
      ),
    );
  }
}
