import 'package:flutter/material.dart';
import 'package:topsis_tanaman_hias/Pages/textfield.dart';

class CriteriaPage extends StatefulWidget {
  static List<String> friendsList = [null];
  @override
  _CriteriaPageState createState() => _CriteriaPageState();
}

class _CriteriaPageState extends State<CriteriaPage> {
  final _formKey = GlobalKey<FormState>();
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

  List<Widget> _getFriends() {
    List<Widget> friendsTextFieldsList = [];
    for (int i = 0; i < CriteriaPage.friendsList.length; i++) {
      friendsTextFieldsList.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Expanded(child: FriendTextFields(i)),
            SizedBox(
              width: 16,
            ),
            // we need add button at last friends row only
            _addRemoveButton(i == CriteriaPage.friendsList.length - 1, i),
          ],
        ),
      ));
    }
    return friendsTextFieldsList;
  }

  Widget _addRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          // add new text-fields at the top of all friends textfields
          CriteriaPage.friendsList.insert(0, null);
        } else
          CriteriaPage.friendsList.removeAt(index);
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Dynamic TextFormFields'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Friends',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              ..._getFriends(),
              SizedBox(
                height: 40,
              ),
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                  }
                },
                child: Text('Submit'),
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
