// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

import '../../../authentications/presentation/bloc/authentications_bloc.dart';
import '../../../web_core/global_fields/fields.dart';
import '../bloc/sign_up_bloc.dart';



class SignUp extends StatefulWidget {

  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();

}



class _SignUpState extends State<SignUp> {
  
  String? emailAddress;
  String? password;
  String? username;

  late RegExp numbers;
  late RegExp alphabets;
  late int strength;
  late String errorText;
  late FocusNode _textFieldFocusNodeOne;
  late FocusNode _textFieldFocusNodeTwo;
  late FocusNode _textFieldFocusNodeThree;
  late FocusNode _buttonFocusNodeOne;
  late FocusNode _buttonFocusNodeTwo;
  late TextEditingController _textFieldControllerOne;
  late TextEditingController _textFieldControllerTwo;
  late TextEditingController _textFieldControllerThree;
  late GlobalKey<FormState>  _formKey;



  @override 
  void initState() {
    numbers = RegExp(r".*[0-9].*");
    alphabets = RegExp(r".*[A-Za-z].*");
    strength = 0;
    _textFieldFocusNodeOne = FocusNode();
    _textFieldFocusNodeTwo = FocusNode();
    _textFieldFocusNodeThree = FocusNode();
    _buttonFocusNodeOne = FocusNode();
    _buttonFocusNodeTwo = FocusNode();
    _textFieldControllerOne = TextEditingController();
    _textFieldControllerTwo = TextEditingController();
    _textFieldControllerThree = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: ((context, state) { if(state is Err) {SnackBar(width: const BoxConstraints().maxWidth * 0.35, padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0), content: Text(state.message!));} }),
    
      builder: ((context, state) {
        if (state is SignUpInitial) {
          return signUp(context);
            
        } else
        if (state is SignUpLoading) {
          return const Center(child: GradientCircularProgressIndicator(gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [navyBlue, white]), radius: 100));

        } else 
        if (state is SignUpLoaded) {
          if (state.signUpEntity.password != null && state.signUpEntity.emailAddress != null && state.signUpEntity.username != null) {
            BlocProvider.of<AuthenticationsBloc>(context).add(const PopLoginStateEvent());
          }
            
        } return signUp(context);
      }), 
    );
  }


  Widget signUp(BuildContext context) {
    return Title(
      title: 'Sign Up',
      color: white,
      child: Form(
        key: _formKey,
        child: Column(
          children: [

            Text('Register', style: Theme.of(context).textTheme.titleMedium),
    
            Row(children: [Text('Email address', style: Theme.of(context).textTheme.titleMedium), Text('*', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: red),)],),
    
            sbhmin,
    
            SizedBox(
              width: const BoxConstraints().maxWidth,
              child: TextFormField(
                controller: _textFieldControllerOne,
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  hintText: 'Email address',
                ),
                cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
                textInputAction: TextInputAction.done,
                validator: (value) {if (value!.trim().contains('<' )|| value.trim().contains('>') || value.isEmpty || !value.trim().contains('@') || !value.trim().contains('.')) {return 'Invalid email address'; } return null; },
                onFieldSubmitted: (String value) { FocusScope.of(context).requestFocus(_textFieldFocusNodeTwo); },
                onChanged: (value) {emailAddress = value.trim();},
                focusNode: _textFieldFocusNodeOne,
              ),
            ),
    
            sbhavg,
    
            Row(children: [Text('Username', style: Theme.of(context).textTheme.titleMedium), Text('*', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: red))],),
    
            sbhmin,
    
            SizedBox(
              width: const BoxConstraints().maxWidth,
              child: TextFormField(
                controller: _textFieldControllerTwo,
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                  hintText: 'Username',
                ),
                cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
                textInputAction: TextInputAction.next,
                validator: (value) {if (value!.isEmpty) {return 'Invalid username'; } return null; },
                onFieldSubmitted: (String value) { FocusScope.of(context).requestFocus(_textFieldFocusNodeThree); },
                focusNode: _textFieldFocusNodeTwo,
              ),
            ),
    
            sbhavg,
    
            Row(children: [Text('Password', style: Theme.of(context).textTheme.titleMedium), Text('*', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: red))],),
    
            sbhmin,
    
            SizedBox(
              width: const BoxConstraints().maxWidth,
              child: TextFormField(
                controller: _textFieldControllerThree,
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                  hintText: 'Password',
                  errorStyle: strength == 4? Theme.of(context).inputDecorationTheme.errorStyle!.copyWith(color: orange) : strength == 5? Theme.of(context). inputDecorationTheme.errorStyle!.copyWith(color: green) : Theme.of(context).inputDecorationTheme.errorStyle,
                ),
                cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
                focusNode: _textFieldFocusNodeThree,
                obscureText: true,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (String value) {FocusScope.of(context).requestFocus(_textFieldFocusNodeTwo);},
                onChanged: (value) => checkPasswordOne(value),
                validator: (value) => errorText,
              ),
            ),
    
    
            sbhavg,
            sbhavg,
    
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () { if(_formKey.currentState!.validate()) {BlocProvider.of<SignUpBloc>(context).add(SignUserUpEvent(emailAddress, password, username));} },
                    style: Theme.of(context).elevatedButtonTheme.style!.copyWith(padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0)), shape: MaterialStateProperty.all(const RoundedRectangleBorder()), overlayColor: MaterialStateColor.resolveWith((states) => transparent), backgroundColor: MaterialStateProperty.all(green) ),
                    focusNode: _buttonFocusNodeOne,
                    child: Text('Register', style: Theme.of(context).textTheme.bodyLarge),
                  )
                )
              ]
            ),
    
    
            sbhmin,
    
    
            TextButton(onPressed: () => BlocProvider.of<AuthenticationsBloc>(context).add(const PushLoginStateEvent()), focusNode: _buttonFocusNodeTwo, child: Text('Log in', style: Theme.of(context).textTheme.bodyLarge),),
    
    
    
    
          ],
        ),
      ),
    );
  }




  void checkPasswordOne(String value) {

    if (value.isEmpty) {
      setState(() {
        strength = 1;
      });

    } else  
    if (value.length < 8) {
      setState(() {
        strength = 2;
        errorText = 'Password is too short';
      });

    } else 
    if (value.length >= 8 && !alphabets.hasMatch(value) && !numbers.hasMatch(value)) {
      setState(() {
        strength = 3;
        errorText = 'Password not alphanumeric';
      });

    } else 
    if (value.length >= 8 && alphabets.hasMatch(value) && numbers.hasMatch(value)) {
      setState(() {
        strength = 4;
        errorText = 'Strong';
      });

    } else 
    if (value.length >= 8 && alphabets.hasMatch(value) && numbers.hasMatch(value) && value.contains('!@#%^&*()_')) {
      setState(() {
        strength = 5;
        errorText = 'Very Strong';
      });
    }
  }




  @override 
  void dispose() {
    _textFieldFocusNodeOne.dispose();
    _textFieldFocusNodeTwo.dispose();
    _textFieldFocusNodeThree.dispose();
    _buttonFocusNodeOne.dispose();
    _buttonFocusNodeTwo.dispose();
    _textFieldControllerOne.dispose();
    _textFieldControllerTwo.dispose();
    _textFieldControllerThree.dispose();
    super.dispose();
  }



}