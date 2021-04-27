import 'package:flutter/material.dart';
import 'package:topsis_tanaman_hias/Pages/criteria_page.dart';

class FriendTextFields extends StatefulWidget {
  final int index;
  FriendTextFields(this.index);
  @override
  _FriendTextFieldsState createState() => _FriendTextFieldsState();
}

class _FriendTextFieldsState extends State<FriendTextFields> {
  TextEditingController _nameController;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nameController.text = CriteriaPage.friendsList[widget.index] ?? '';
    });
    return TextFormField(
      controller: _nameController,
      // save text field data in friends list at index
      // whenever text field value changes
      onChanged: (v) => CriteriaPage.friendsList[widget.index] = v,
      decoration: InputDecoration(hintText: 'Enter your friend\'s name'),
      validator: (v) {
        if (v.trim().isEmpty) return 'Please enter something';
        return null;
      },
    );
  }
}
