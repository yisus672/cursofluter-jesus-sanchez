import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
 final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
  final textController = TextEditingController();
  final focusNode = FocusNode();
    //final colors = Theme.of(context).colorScheme;

    final outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    final inputDecoration = InputDecoration(
    hintText: 'Escribe un mensaje',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      //fillColor: colors.surface,
      suffixIcon: IconButton(
      icon: const Icon(Icons.send_outlined),
        onPressed: () {
        final textValue = textController.value.text;
          textController.clear();
          onValue(textValue); // Handle the send button press here
        },
      ),
    );

    return TextFormField(
    onTapOutside:(event) {
      focusNode.unfocus(); // Dismiss the keyboard when tapping outside the text field
    },
    focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) { // Handle the submission of the text field here
       textController.clear();
       focusNode.requestFocus();
       onValue(value); // Clear the text field after submission
      },
      
    );
  }
}