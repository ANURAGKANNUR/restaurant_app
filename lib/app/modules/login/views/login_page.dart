import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resource/all_restaurents.dart';
import '../../../routes/app_pages.dart';
import '../controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({super.key});
  var isObscure = true.obs;
  var isChecked = false.obs;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/login_background.png'),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Log in",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "your account",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.username,
                  maxLines: 1,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter username name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "   User Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: Colors.orange)),
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      fillColor: Colors.white),
                ),
                const SizedBox(
                  height: 25,
                ),
                Obx(() => TextFormField(
                      controller: controller.password,
                      maxLines: 1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter the password";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "   Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  const BorderSide(color: Colors.orange)),
                          filled: true,
                          suffixIcon: Obx(() => GestureDetector(
                                onTap: () {
                                  isObscure.value = !isObscure.value;
                                },
                                child: Icon(isObscure.value
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              )),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 15),
                          fillColor: Colors.white),
                      obscureText: isObscure.value,
                      obscuringCharacter: '*',
                    )),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Obx(
                      () => SizedBox(
                        height: 20,
                        width: 20,
                        child: Checkbox(
                          value: isChecked.value,
                          onChanged: (bool? value) {
                            isChecked.value = value!;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "Remember me",
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                    ),
                    const Spacer(),
                    const Text(
                      "Forgot password?",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.saveCredentials(controller.username.text,
                              controller.password.text);
                          Get.toNamed(Routes.restaurantsPage);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          disabledBackgroundColor: Colors.black,
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13))),
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
