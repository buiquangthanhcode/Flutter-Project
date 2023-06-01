import 'package:flutter/material.dart';

class Header_Homepage extends StatelessWidget {
  const Header_Homepage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.search),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(
                hintText: "Search",
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.settings_input_component)),
        ],
      ),
    );
  }
}
