import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/public_components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/public_components/rounded_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_auth/controllers/register_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_auth/public_components/loading_indicator.dart';

class ActionButton extends StatelessWidget {
  final userController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(30, 100, 30, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Get.to(LoginScreen());
                },
              ),
            ],
          ),
          RoundedButton(
              text: "MASUK",
              press: () async {
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return AlertDialog(
                      title: Text('Daftar'),
                      content: Text('Selamat, akun anda telah terdaftar !'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            userController.registerDataUser();
                            Get.back();
                          },
                          child: userController.isLoading.value
                              ? spinkit
                              : const Text('Login'),
                        )
                      ],
                    );
                  },
                );
                await Get.to(() => LoginScreen());
              }),
        ],
      ),
    );
  }
}
