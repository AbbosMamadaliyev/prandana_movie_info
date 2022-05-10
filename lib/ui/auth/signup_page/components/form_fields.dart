import 'package:flutter/material.dart';

import 'create_button.dart';
import 'custom_container_for_forms.dart';
import 'custom_input_decoration.dart';
import 'error_text.dart';

class FormFields extends StatefulWidget {
  const FormFields({Key? key}) : super(key: key);

  @override
  State<FormFields> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          nameFormField(),
          emailFormField(),
          passwordFormField(),
          const ErrorText(),
          CreateButton(
            email: emailController.text,
            password: passwordController.text,
            name: nameController.text,
          ),
        ],
      ),
    );
  }

  CustomContainer passwordFormField() {
    return CustomContainer(
      titleForm: 'Пароль',
      child: TextFormField(
        style: const TextStyle(color: Colors.black),
        controller: passwordController,
        decoration: customPasswordInputDecoration('Your password'),
        obscureText: !_showPassword,
      ),
    );
  }

  CustomContainer emailFormField() {
    return CustomContainer(
      titleForm: 'Email',
      child: TextFormField(
        controller: emailController,
        style: const TextStyle(color: Colors.black),
        decoration: customInputDecoration('Your email address'),
      ),
    );
  }

  CustomContainer nameFormField() {
    return CustomContainer(
      titleForm: 'Имя',
      child: TextFormField(
        controller: nameController,
        style: const TextStyle(color: Colors.black),
        decoration: customInputDecoration('Your name'),
      ),
    );
  }

  InputDecoration customPasswordInputDecoration(String hintText) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      suffixIcon: IconButton(
        onPressed: () {
          _toggleVisibility();
        },
        icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
      ),
      border: InputBorder.none,
      hintText: hintText,
      enabledBorder: InputBorder.none,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: (Colors.lightBlue)),
      ),
    );
  }

  void _toggleVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
}
