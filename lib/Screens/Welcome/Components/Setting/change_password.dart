import 'package:doanchuyennganh/Screens/Welcome/Components/Setting/Setting.dart';
import 'package:doanchuyennganh/Screens/Welcome/Components/Tab.dart';
import 'package:doanchuyennganh/bloc/auth_bloc/auth_bloc.dart';
import 'package:doanchuyennganh/widgets/CustomShowSnackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ThemeHelper.dart';
class ChangePassword extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ChangePasswordState();
  }
}

class _ChangePasswordState extends State<ChangePassword>{

  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final _auth = FirebaseAuth.instance.currentUser!;
  bool checkCurrentPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => SettingPage()
                    ),
                        (Route<dynamic> route) => false
                )
            ),
            title: Text("Change Password"),
          ),
          body: BlocBuilder<AuthBloc,AuthState>(
            builder: (context,state){
              if(state is Loading){
                return Center(child: CircularProgressIndicator());
              }
              if(state is Authenticated){
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(height: 30,),
                              Container(
                                child: TextFormField(
                                  controller: _oldPasswordController,
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration(
                                      "Old Password*", "Enter your password"),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please enter your password";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) => _oldPasswordController.text = value!,
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                child: TextFormField(
                                  controller: _newPasswordController,
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration(
                                      "New Password*", "Enter your password"),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please enter your password";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) => _newPasswordController.text = value!,
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),

                              SizedBox(height: 15.0),
                              Container(
                                child: TextFormField(
                                  controller: _confirmPasswordController,
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration(
                                      "Confirm New Password*", "Enter your password"),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please confirm your password";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) => _confirmPasswordController.text = value!,
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              FormField<bool>(
                                builder: (state) {
                                  return Column(
                                    children: <Widget>[
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

                              ),
                              SizedBox(height: 20.0),
                              Container(
                                decoration: ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text(
                                      "CHANGE".toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    BlocProvider.of<AuthBloc>(context).add(ValidateCurrentPasswordRequested(_oldPasswordController.text));
                                    if (_formKey.currentState!.validate()) {
                                      if(_newPasswordController.text == _confirmPasswordController.text){
                                        _auth.updatePassword(_confirmPasswordController.text).then((value){
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: CustomSnackBarContent(errorText: "Password has been changed")));
                                          Navigator.of(context).pushAndRemoveUntil(
                                              MaterialPageRoute(
                                                  builder: (context) => TabPage()
                                              ),
                                                  (Route<dynamic> route) => false
                                          );}
                                        );
                                      }
                                      else{
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: CustomSnackBarContent(errorText: "Error")));
                                      }
                                    }
                                  },
                                ),
                              ),
                              SizedBox(height: 30.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              else{
                return Text("Something went wrong!");
              }
            }
          )
    );
  }

}