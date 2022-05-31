import 'dart:io';

import 'package:doanchuyennganh/Screens/Welcome/Components/Login/Login.dart';
import 'package:doanchuyennganh/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../Setting/ThemeHelper.dart';
import 'Header.dart';

class RegisterAccount extends StatefulWidget {
  const RegisterAccount({Key? key}) : super(key: key);

  @override
  State<RegisterAccount> createState() => _RegisterAccountState();
}

class _RegisterAccountState extends State<RegisterAccount> {

  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  File? imageFile;
  Future<void>_openGallary(BuildContext context) async {
    XFile? picture = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    setState(() {
      imageFile = File(picture!.path);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Register Account"),
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: ()=>Navigator.of(context).pop()),
      ),
      body: BlocListener<AuthBloc,AuthState>(
        listener: (context,state) {
          if(state is Authenticated){
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => Login()
                ),
                    (Route<dynamic> route) => false
            );
          }
          if(state is AuthError){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("error")));
          }
        },
        child: BlocBuilder<AuthBloc,AuthState>(builder: (context,state){
          if(state is Loading){
            return const Center(child: CircularProgressIndicator());
          }
          if(state is UnAuthenticated){
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              GestureDetector(
                                child: Stack(
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        _openGallary(context);
                                      },
                                      child: imageFile != null ? Image.file(imageFile!,
                                          width: 100,height: 100,
                                          fit: BoxFit.cover
                                      ) :
                                      Icon(
                                        Icons.person,
                                        color: Colors.grey.shade300,
                                        size: 80.0,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                                      child: Icon(
                                        Icons.add_circle,
                                        color: Colors.grey.shade700,
                                        size: 25.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 30,),
                              Container(
                                child: TextFormField(
                                  decoration: ThemeHelper().textInputDecoration('Name', 'Enter your first name'),
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 30,),
                              Container(
                                child: TextFormField(
                                  decoration: ThemeHelper().textInputDecoration('Gender', 'Enter your gender'),
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                child: TextFormField(
                                  decoration: ThemeHelper().textInputDecoration('Birthday', 'Enter your birthday'),
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                child: TextFormField(
                                  controller: _emailController,
                                  onSaved: (value) => _emailController.text = value!,
                                  decoration: ThemeHelper().textInputDecoration("E-mail address", "Enter your email"),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (val) {
                                    if(!(val!.isEmpty) && !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                                      return "Enter a valid email address";
                                    }
                                    return null;
                                  },
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                child: TextFormField(
                                  decoration: ThemeHelper().textInputDecoration(
                                      "Mobile Number",
                                      "Enter your mobile number"),
                                  keyboardType: TextInputType.phone,
                                  validator: (val) {
                                    if(!(val!.isEmpty) && !RegExp(r"^(\d+)*$").hasMatch(val)){
                                      return "Enter a valid phone number";
                                    }
                                    return null;
                                  },
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration(
                                      "Password*", "Enter your password"),
                                  onChanged: (value) => _passwordController.text = value!,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please enter your password";
                                    }
                                    return null;
                                  },
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 15.0),
                              FormField<bool>(
                                builder: (state) {
                                  return Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Checkbox(
                                              value: checkboxValue,
                                              onChanged: (value) {
                                                setState(() {
                                                  checkboxValue = value!;
                                                  state.didChange(value);
                                                });
                                              }),
                                          Text("I accept all terms and conditions.", style: TextStyle(color: Colors.grey),),
                                        ],
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          state.errorText ?? '',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(color: Theme.of(context).errorColor,fontSize: 12,),
                                        ),
                                      )
                                    ],
                                  );
                                },
                                validator: (value) {
                                  if (!checkboxValue) {
                                    return 'You need to accept terms and conditions';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                decoration: ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text(
                                      "Register".toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    _createAccountwithEmailAndPassword(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          else{
            return Center(child: Text("Something went wrong"));
          }
        }
      ),
    ));

  }
  void _createAccountwithEmailAndPassword(BuildContext context){
    if(_formKey.currentState!.validate()){
      BlocProvider.of<AuthBloc>(context).add(
        SignUpRequested(_emailController.text, _passwordController.text)
      );
    }
  }
}
