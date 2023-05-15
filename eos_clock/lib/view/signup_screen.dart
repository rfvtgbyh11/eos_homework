import 'package:eos_clock/view/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Widget _userIdWidget() {
    return TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), labelText: 'email'),
        validator: (String? value) {
          if (value!.isEmpty) {
            return '이메일을 입력해주세요.';
          }
          return null;
        });
  }

  Widget _passwordWidget() {
    return TextFormField(
        controller: _passwordController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
            border: OutlineInputBorder(), labelText: 'password'),
        validator: (String? value) {
          if (value!.isEmpty) {
            return '비밀번호를 입력해주세요.';
          }
          return null;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFffffff),
        appBar: AppBar(
          title: Text("회원 가입"),
        ),
        body: SafeArea(
            child: Form(
                key: _formKey,
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        _userIdWidget(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        _passwordWidget(),
                        Container(
                          height: 50,
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 8.0),
                          child: ElevatedButton(
                            onPressed: () => _signup(),
                            child: const Text("회원 가입"),
                          ),
                        ),
                      ],
                    ))))
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _signup() async{
    // 키보드 숨기기
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).requestFocus(FocusNode());

      try{
        await _auth.createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('회원가입 완료'),
          backgroundColor: Colors.blue,
        ));
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false);
      } on FirebaseAuthException catch (e) {
        String message = '';

        if (e.toString().contains('week-password')){
          message = '비밀번호가 안전하지 않습니다';
        } else if (e.toString().contains('email-already-in-use')) {
          message = '해당 이메일의 계정이 이미 있습니다';
        } else if (e.toString().contains('invalid-email')){
          message = '이메일을 확인하세요';
        }

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message),
          backgroundColor: Colors.deepOrange,
        ));
      }
    }
  }

}
