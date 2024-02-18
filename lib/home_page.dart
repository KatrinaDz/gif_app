import 'package:flutter/material.dart';
import 'package:giphy_picker/giphy_picker.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(230, 142, 117, 234),
      appBar: AppBar(
        title: const Text(
          'Giphy Search App',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: const Color.fromARGB(158, 45, 18, 133),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(35, 70),
                bottomRight: Radius.elliptical(35, 70))
                ),
      ),
      body: Center(
      child: FilledButton(
        onPressed: () async {
          try {
          final gif = await GiphyPicker.pickGif(
            context: context,
            apiKey: dotenv.env['API_KEY'] ?? '',
          );
          if (gif != null){
            print(gif); // Print the selected gif URL
          } else {
            print('There is no Gif found');
          }
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('There is no Gif found: $e'),
                ),
              );
          }
        },
        child: const Text("Let's start"),
     ),
      ),
    );
  }
}
