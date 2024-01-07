import 'package:flutter/material.dart';
import 'package:homework_barisalisaglam/view/common/commn_text_field.dart';
import 'package:homework_barisalisaglam/view_model/register_view_model.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 141, 14, 5),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 9, 4),
        title: Text(
          "Register Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                _buildEmailTextField(),
                SizedBox(
                  height: 16,
                ),
                _buildpasswordField(),
              ],
            ),
            _buildLoginButton(context),
            _buildOpenRegisterButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return CommonTextFiled(
      controller: _emailController,
      label: "Email",
    );
  }

  Widget _buildpasswordField() {
    return CommonTextFiled(
      controller: _passwordController,
      label: "Password",
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    RegisterViewModel viewModel = Provider.of(
      context,
      listen: false,
    );
    return ElevatedButton(
            style: ElevatedButton.styleFrom( backgroundColor: const Color.fromARGB(255, 80, 9, 4),),

      child: Text("Register",style: TextStyle(color: Colors.white),),
      onPressed: () {
        viewModel.register(
          context,
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );
      },
    );
  }

  Widget _buildOpenRegisterButton(BuildContext context) {
    RegisterViewModel viewModel = Provider.of(context, listen: false);
    return TextButton(
      child: Text("İf You Created An Acount, You Can Login",style: TextStyle(color: Colors.white),),
      onPressed: () {
        viewModel.openLoginPage(context);
      },
    );
  }
}
