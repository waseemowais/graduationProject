
import 'package:flutter/material.dart';
import 'package:mr_bookshare/Route/const.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              const Text('SignUp',style: const TextStyle(fontSize: 30,color: Color(0xff069e79)),),
              const SizedBox(
                width: 200,
                child: const Icon(Icons.app_registration,color:  Color(0xff069e79),size: 110,)
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 350,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: fullName,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    labelStyle:const TextStyle(
                        color: Color(0xff069e79)
                    ),
                    hintText: 'Enter your full name',
                    suffixIcon: const Icon(Icons.person_outlined,color: const Color(0xff069e79)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder:OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black12, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff069e79), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  // validator: (value) {
                  //   if (value!.isEmpty) {
                  //     return 'Full name required';
                  //   } else if (value.length < 3) {
                  //     return 'Name should be more than 3 letters';
                  //   } else if (!fullNameValidator(value)) {
                  //     return 'Enter valid full name';
                  //   }
                  //   return null;
                  // },
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              SizedBox(
                width: 350,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle:const TextStyle(
                        color: Color(0xff069e79)
                    ),
                    hintText: 'Enter your Email',
                    suffixIcon: const Icon(Icons.email_outlined,color:const Color(0xff069e79) ,),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    enabledBorder:OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black12, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff069e79), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  // validator: (value) {
                  //   if (value!.isEmpty) {
                  //     return 'Email required';
                  //   } else if (!emailValidator(value)) {
                  //     return 'Enter Valid Email';
                  //   }
                  //   return null;
                  // },
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              SizedBox(
                width: 350,
                child: TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle:const TextStyle(
                        color: Color(0xff069e79)
                    ),
                    hintText: 'Enter your password',
                    suffixIcon: const Icon(Icons.password_outlined,color: Color(0xff069e79),),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    enabledBorder:OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black12, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff069e79), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  // validator: (value) {
                  //   if (value!.isEmpty) {
                  //     return '* required';
                  //   } else if (value.length < 6) {
                  //     return 'Password should be at least 6 characters';
                  //   } else if (value.length > 15) {
                  //     return "Password should not be greater than 15 characters";
                  //   } else if (!passValidator(value)) {
                  //     return 'At least 1 character ,a number, a symbol and CAPITAL character ';
                  //   }
                  //   return null;
                  // },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(loginScreen);
                },
                child: const Text(
                  'SignUp',
                  style: const TextStyle(fontSize: 20),
                ),
                color:  const Color(0xff069e79),
                textColor: Colors.white,
                padding: const EdgeInsets.all(8.0),
              ),
              const SizedBox(
                height: 6,
              ),

              const SizedBox(
                width: 290,
                child: const Divider(
                  thickness: 2,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account!"),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(loginScreen);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Color(0xff069e79),fontSize: 17),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
