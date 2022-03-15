import 'package:flutter_auth/Screens/Signup/components/action_button.dart';
import 'package:flutter_auth/Screens/Signup/components/header.dart';
import 'package:flutter_auth/public_components/name_field.dart';
import 'package:flutter_auth/public_components/rounded_input_field.dart';
import 'package:flutter_auth/public_components/rounded_password_field.dart';
import 'package:flutter_auth/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  final userController = Get.put(RegisterController());
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          actions: [],
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: Color(0xFFF5F5F5),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Header(),
                  RoundedNameField(/*txtName1: txtName1, txtName2: txtName2*/),
                  RoundedInputField(),
                  RoundedPasswordField(),
                  ActionButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
