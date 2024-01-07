import 'package:flutter/material.dart';
import 'package:homework_barisalisaglam/view_model/main_view_model.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    MainViewModel viewModel = Provider.of<MainViewModel>(
      context,
      listen: false,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Characters",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 80, 9, 4),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 80, 9, 4),
          foregroundColor: Color.fromARGB(255, 253, 253, 253),
          child: Icon(Icons.add),
          onPressed: () {
            viewModel.openAddCharacterPage(context);
          }),
    );
  }

  Widget _buildBody() {
    return Consumer<MainViewModel>(
        builder: (context, viewModel, child) => ListView.builder(
              itemCount: viewModel.characters.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(viewModel.characters[index].name),
                  subtitle: Text(viewModel.characters[index].gender),
                );
              },
            ));
  }
}
