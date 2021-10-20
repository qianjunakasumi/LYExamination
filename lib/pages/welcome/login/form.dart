import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lyexamination/pages/welcome/login/controller.dart';

class FormComponent extends StatelessWidget {
  FormComponent({Key? key}) : super(key: key);

  final LoginFormController c = Get.find(tag: loginFormControllerName);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: c.key,
      child: Column(
        children: [
          phone,
          const SizedBox(height: 16),
          password,
        ],
      ),
    );
  }

  OutlineInputBorder get border => const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)));

  Widget get phone => TextFormField(
        decoration: InputDecoration(labelText: '手机号', border: border),
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        onSaved: (v) => c.phone = v!,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        validator: phoneValidator,
      );

  String? phoneValidator(String? v) => v!.isEmpty
      ? '输入手机号才能登录哦'
      : v.length != 11
          ? '手机号的格式有误，请检查~'
          : null;

  Widget get password => TextFormField(
        decoration: InputDecoration(labelText: '密码', border: border),
        obscureText: true,
        onSaved: (v) => c.password = v!,
        validator: passwordValidator,
      );

  String? passwordValidator(String? v) => v!.isEmpty
      ? '输入密码才能登录哦'
      : v.length < 6 || v.length > 20
          ? '密码的格式有误，请检查~'
          : null;
}
