import 'package:flutter/material.dart';
import 'package:user_details/user_detail_card.dart';

// user details output page with what the user entered in the input page
class outputPage extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String address;

  outputPage(
      this.firstName, this.lastName, this.email, this.phone, this.address);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("User Details"),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              UserDetailCard(name: "Frist Name", content: firstName),
              UserDetailCard(name: "Last Name", content: lastName),
              UserDetailCard(name: "Email", content: email),
              UserDetailCard(name: "Phone", content: phone),
              UserDetailCard(name: "Address", content: address),
            ],
          ),
        ),
      ),
    );
  }
}
