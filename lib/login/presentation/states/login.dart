// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:task2/homescreen/presentation/bloc/home_screen_bloc.dart' as home_screen;

import '../../../../web_core/global_fields/fields.dart';
import '../../../authentications/presentation/bloc/authentications_bloc.dart';
import '../../../dependency_injections.dart';
import '../../../homescreen/presentation/states/homescreen.dart';
import '../bloc/login_bloc.dart';





class Login extends StatefulWidget {

  const Login({Key? key,}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();

}

class _LoginState extends State<Login> {

  
  late FocusNode _textFieldFocusNodeOne;
  late FocusNode _textFieldFocusNodeTwo;
  late FocusNode _buttonFocusNodeOne;
  late FocusNode _buttonFocusNodeTwo;
  late TextEditingController _textFieldControllerOne;
  late TextEditingController _textFieldControllerTwo;
  late GlobalKey<FormState> _formKey;

  bool? hasAnAccount;
  String? username;
  String? password;


  @override 
  void initState() {
    _textFieldFocusNodeOne = FocusNode();
    _textFieldFocusNodeTwo = FocusNode();
    _buttonFocusNodeOne = FocusNode();
    _buttonFocusNodeTwo = FocusNode();
    _textFieldControllerOne = TextEditingController();
    _textFieldControllerTwo = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => sl<home_screen.HomeScreenBloc>()),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: ((context, state) {if (state is Err) { SnackBar(width: const BoxConstraints().maxWidth * 0.35, padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0), content: Text(state.message!)); }}),
        builder: ((context, state) {
          if(state is LoginInitial) {
            return login(context);
    
            } else 
            if (state is LoginLoading) {
            return const Center(child: GradientCircularProgressIndicator(gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [navyBlue, white],), radius: 100));
          
          } else
           if (state is LoginLoaded) {
            
            if (state.loginEntity.username! == username && state.loginEntity.password! == password) {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute<void>(builder: (BuildContext context) => const HomeScreen()) , (route) => false);
            } else {hasAnAccount = false;}
    
          } return login(context); 
        }), 
      ),
    );
  
  }


  Widget login(BuildContext context) {
    return Title(
      title: 'Login',
      color: white,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
    
            // !hasAnAccount! ? Text('Incorrect username or password', style: Theme.of(context).textTheme.bodyLarge) : Container(),
    
            Text('Login', style: Theme.of(context).textTheme.titleMedium),
    
            sbhavg,
    
            SizedBox(
              width: const BoxConstraints().maxWidth,
              child: TextFormField(
                controller: _textFieldControllerOne,
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                  hintText: 'Username',
                ),
                cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
                textInputAction: TextInputAction.done,
                validator: (value) {if(value!.isEmpty) {  return 'Invalid input'; } return null; },
                onFieldSubmitted: (String value) { FocusScope.of(context).requestFocus(_textFieldFocusNodeTwo);},
                onChanged: (value) {username = value.trim().replaceAll(' ', ''); },
                focusNode: _textFieldFocusNodeOne,
              ),
            ),
    
            sbhavg,
    
            SizedBox(
              width: const BoxConstraints().maxWidth,
              child: TextFormField(
                controller: _textFieldControllerTwo,
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  hintText: 'Password',             
                ),
                cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
                focusNode: _textFieldFocusNodeTwo,
                obscureText: true,
                textInputAction: TextInputAction.done,
                validator: (value) {if(value!.isEmpty) {  return 'Invalid input'; } return null; },
                onFieldSubmitted: (String value) {FocusScope.of(context).requestFocus(_buttonFocusNodeOne); },
                onChanged: (value) { password = value; },
              ),
            ),
    
            sbhavg,
            sbhavg,
    
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () { if(_formKey.currentState!.validate()) {BlocProvider.of<LoginBloc>(context).add(Login_Event(username, password));} },
                    style: Theme.of(context).elevatedButtonTheme.style!.copyWith(padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0)), shape: MaterialStateProperty.all(const RoundedRectangleBorder()), overlayColor: MaterialStateColor.resolveWith((states) => transparent), backgroundColor: MaterialStateProperty.all(green)),
                    focusNode: _buttonFocusNodeOne,
                    child: Text('Log In', style: Theme.of(context).textTheme.bodyLarge),
                  )
                )
              ]
            ),
    
    
            sbhmax,

            TextButton(onPressed: () => BlocProvider.of<AuthenticationsBloc>(context).add(const PopLoginStateEvent()), focusNode: _buttonFocusNodeTwo, child: Text('Register', style: Theme.of(context).textTheme.bodyLarge),),
    
    
    
    
          ]
        ),
      ),
    );
  }


   

  @override 
  void dispose() {
    _textFieldFocusNodeOne.dispose();
    _textFieldFocusNodeTwo.dispose();
    _buttonFocusNodeOne.dispose();
    _buttonFocusNodeTwo.dispose();
    _textFieldControllerOne.dispose();
    // _textFieldControllerTwo.dispose();
    super.dispose();
  }


}