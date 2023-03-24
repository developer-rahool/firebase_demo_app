import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/veiw/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../authentication/auth_fire.dart';
import '../controller/state_controller.dart';
import 'home_page.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //bool isPassWordVisible = false;

  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  LoginController loginController = Get.put(LoginController());
  LoginController passvisible = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              const SizedBox(
                  width: 100,
                  height: 140,
                  child: Image(image: AssetImage("Images/loremlogo.JPG"))),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Email",
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5.5)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Obx(
                          () => TextFormField(
                        controller: password,
                        obscureText: passvisible.isPassWordVisible.value,
                        decoration: InputDecoration(
                          hintText: "Password",
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(5.5)),
                          suffixIcon: GestureDetector(
                            child: Icon(
                              passvisible.isPassWordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                            onTap: () {
                              passvisible.isPassWordVisible.value =
                              !passvisible.isPassWordVisible.value;
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Password";
                          } else if (value.length < 3) {
                            return "Password should be atleast 3 figures";
                          }

                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const SizedBox(height: 20.0),
                    GestureDetector(
                        onTap: () {
                          signInFunc(context);
                        },
                        child:  Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffE43228),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          height: 50,
                          alignment: Alignment.center,
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text("Not registered yet?"),
                        TextButton(
                          onPressed: () {
                            Get.to(RegisterPage());
                          },
                          child: const Text(
                            'Create an account',
                            style: TextStyle(color: Colors.purpleAccent),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Or Sign Up Using'),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45),
                      child: OutlinedButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.white),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Image(
                                image: AssetImage("Images/google_logo.png"),
                                fit: BoxFit.fill,
                                height: 35,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Sign In With Google",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  signInFunc(BuildContext context) async {

    final isValid = formKey.currentState!.validate();
    if (isValid) {
      User? result =
      await Auth().signInFunc(email: email.text, password: password.text);
      if(result != null) {
        //return Get.to(const HomePage());
        // ignore: use_build_context_synchronously
        return Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> const HomePage()), (route) => false) ;
      }
    }
  }
}
