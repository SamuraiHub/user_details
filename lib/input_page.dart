import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_details/field_validation.dart';

import 'custom_form_field.dart';
import 'output_page.dart';

// user details input page with validation
class inputPage extends StatefulWidget {
  const inputPage({Key? key}) : super(key: key);
  @override
  _inputPageState createState() => _inputPageState();
}

class _inputPageState extends State<inputPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomFormField(
                hintText: 'First Name',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[a-zA-Z]+|\s"),
                  )
                ],
                validator: (val) {
                  if (!val!.isValidName) return 'Enter valid first name';
                },
                textController: firstNameController,
              ),
              CustomFormField(
                hintText: 'Last Name',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[a-zA-Z]+|\s"),
                  )
                ],
                validator: (val) {
                  if (!val!.isValidName) return 'Enter valid last name';
                },
                textController: lastNameController,
              ),
              CustomFormField(
                hintText: 'Email',
                validator: (val) {
                  if (!val!.isValidEmail) return 'Enter valid email';
                },
                textController: emailController,
              ),
              CustomFormField(
                hintText: 'Phone',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[0-9]"),
                  )
                ],
                validator: (val) {
                  if (!val!.isValidPhone) return 'Enter valid phone';
                },
                textController: phoneController,
              ),
              CustomFormField(
                hintText: 'Address',
                validator: (val) {
                  if (!val!.isValidAddress) return 'Enter valid address';
                },
                textController: addressController,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => outputPage(
                            firstNameController.text,
                            lastNameController.text,
                            emailController.text,
                            phoneController.text,
                            addressController.text),
                      ),
                    );
                  }
                },
                child: const Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
