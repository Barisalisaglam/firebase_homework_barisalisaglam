import 'package:flutter/material.dart';
import 'package:homework_barisalisaglam/view/common/commn_text_field.dart';
import 'package:homework_barisalisaglam/view_model/add_character_page_view_model.dart';
import 'package:provider/provider.dart';

class AddCharacterPage extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _genderController = TextEditingController();

  AddCharacterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 80, 9, 4),
        centerTitle: true,
        title: Text(
          "Add Character",
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
            _buildAddCharacterButton(context)
          ],
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return CommonTextFiled(
      controller: _nameController,
      label: "Name",
    );
  }

  Widget _buildpasswordField() {
    return CommonTextFiled(
      controller: _genderController,
      label: "Gender",
    );
  }

  Widget _buildAddCharacterButton(BuildContext context) {
    AddCharacterViewModel viewModel = Provider.of(
      context,
      listen: false,
    );
    return ElevatedButton(
      style: ElevatedButton.styleFrom( backgroundColor: const Color.fromARGB(255, 80, 9, 4),),
      child:
       Text("Add Character",style: TextStyle(color: Colors.white),),
      onPressed: () {
        viewModel.addCharacter(
          context,
          _nameController.text.trim(),
          _genderController.text.trim(),
        );
      },
    );
  }
}
