import 'package:flutter/material.dart';
import 'package:homework_barisalisaglam/view/common/commn_text_field.dart';
import 'package:homework_barisalisaglam/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 141, 14, 5),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 80, 9, 4),
        centerTitle: true,
        title: Text(
          "LogIn Page",
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
    LoginViewModel viewModel = Provider.of(
      context,
      listen: false,
    );
    return ElevatedButton(
            style: ElevatedButton.styleFrom( backgroundColor: const Color.fromARGB(255, 80, 9, 4),),

      child: Text("Login",style: TextStyle(color: Colors.white),),
      onPressed: () {
        viewModel.login(
          context,
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );
      },
    );
  }

  Widget _buildOpenRegisterButton(BuildContext context) {
    LoginViewModel viewModel = Provider.of(context, listen: false);
    return TextButton(
      child: Text("Create An Acount",style: TextStyle(color: Colors.white),),
      onPressed: () {
        viewModel.openRegisterPage(context);
      },
    );
  }
}
