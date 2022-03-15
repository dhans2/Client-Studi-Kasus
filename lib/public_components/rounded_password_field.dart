import 'package:flutter/material.dart';
import 'package:flutter_auth/controllers/register_controller.dart';
import 'package:get/get.dart';

class RoundedPasswordField extends StatelessWidget {
  final userController = Get.put(
      RegisterController()); //inisialisasi menggunakan get dari RegisterController
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(30, 10, 30, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 5),
            child: Text(
              'Kata Sandi',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
            ),
          ),
          //menggunakan obx
          Obx(() => TextFormField(
                controller: userController.passwordEditingController,
                obscureText: userController.txtPasswordVisibility
                    .value, //untuk mendapatkan value dari Registercontroller
                decoration: InputDecoration(
                  hintText: 'Masukkan password anda',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontFamily: 'Poppins'),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Color(0xFFF1F3EB),
                  suffixIcon: InkWell(
                    onTap: () {
                      //setstate() diganti
                      userController.txtPasswordVisibility.value =
                          !userController.txtPasswordVisibility.value;
                    },
                    child: Icon(
                        userController.txtPasswordVisibility.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Color(0xFF757575),
                        size: 22),
                  ),
                ),
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontFamily: 'Poppins'),
                keyboardType: TextInputType.number,
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Bagian ini tidak boleh kosong !';
                  }
                  return null;
                },
              )),
        ],
      ),
    );
  }
}
