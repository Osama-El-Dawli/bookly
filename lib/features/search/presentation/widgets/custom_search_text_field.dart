import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({super.key, required this.onSearch});
  final Function(String) onSearch;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onSubmitted: onSearch,
      decoration: InputDecoration(
        hintText: 'Search',
        enabledBorder: buildOutlineBorder(),
        focusedBorder: buildOutlineBorder(),
        suffixIcon: IconButton(
          onPressed: () {
            onSearch(_controller.text);
          },
          icon: const Opacity(
            opacity: .7,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white),
    );
  }
}
