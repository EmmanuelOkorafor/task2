// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

import '../../../../web_core/global_fields/fields.dart';
import '../../../dependency_injections.dart';
import '../../../login/presentation/bloc/login_bloc.dart';
import '../../../login/presentation/states/login.dart';
import '../../../sign_up/presentation/bloc/sign_up_bloc.dart';
import '../../../sign_up/presentation/states/sign_up.dart';
import '../bloc/authentications_bloc.dart';




class Authentications extends StatefulWidget {
  
  const Authentications({Key? key}) : super(key: key);

  @override
  State<Authentications> createState() => _AuthenticationsState();

}

class _AuthenticationsState extends State<Authentications> {



  late FocusNode focusNode;
  late Uri url;



  @override 
  void initState() {
    focusNode = FocusNode();
    url = Uri.parse('https://pearmonie.com');
    super.initState();
  }








  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: navyBlue,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [

              sbhmax,
        
        
              Expanded(
                child: Align(
                  alignment: FractionalOffset.center,
                  child: Container(
                    width: w(context),
                    height: h(context),
                    child: Column(
                      children: [
                      
                        Expanded(
                          child: ListView(
                            children: [
                              // Change to single bloc provider later
                              // BlocProvider(create: ((context) => sl<AuthenticationsBloc>())), 

                              MultiBlocProvider(
                                providers: [
                                  BlocProvider(create: ((context) => sl<AuthenticationsBloc>())),
                                  BlocProvider(create: ((context) => sl<LoginBloc>())),
                                  BlocProvider(create: ((context) => sl<SignUpBloc>())),
                                ],
                                child: BlocConsumer<AuthenticationsBloc, AuthenticationsState>(
                                  listener: ((context, state) {}),
                                  builder: ((context, state) {
                                    if (state is AuthenticationsInitial) {
                                      return const Login();
                                
                                    } else 
                                    if(state is AuthenticationsLoading) {
                                      return const Center(child: GradientCircularProgressIndicator(gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [defaultColor, white],), radius: 100));
                                    
                                    } else
                                    if (state is AuthenticationsLoaded) {
                                      if (state.authenticationsEntity.loginStateIsPushed!) {
                                        return const Login();
                                
                                      } else  
                                      if (!state.authenticationsEntity.loginStateIsPushed!) {
                                        return const SignUp();
                                      
                                      } 
                                    } return const Login();
                              
                              
                                  })
                                ),
                              ),
                            ],
                          ),
                        ),

                      
                      ]
                    )
                  ),
                ),
              ),
              
        


              Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  child: Column(
                      children: [
                              
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(onPressed: () => (), child: Text('Support', style: Theme.of(context).textTheme.labelLarge), ),
                            TextButton(onPressed: () => (), child: Text('Community', style: Theme.of(context).textTheme.labelLarge), ),
                            TextButton(onPressed: () => (), child: Text('Terms', style: Theme.of(context).textTheme.labelLarge), ),
                            TextButton(onPressed: () => (), child: Text('Privacy', style: Theme.of(context).textTheme.labelLarge), ),
                          ],
                        ),
                  
                        sbhmin,
                              
                        RichText(text: TextSpan(children: [ TextSpan(text: '© 2024 ', style: Theme.of(context).textTheme.labelSmall),  TextSpan(text:'Pear Monie ', recognizer: TapGestureRecognizer()..onTap = () => launchUrl(url), style: Theme.of(context).textTheme.labelSmall), TextSpan(text: 'LLC. All rights reserved', style: Theme.of(context).textTheme.labelSmall), ])),
                        
                      ],
                    ),
                ),
              ),
        
        
        
        
        
              
            ]
          ),
        ),
      ),
    );
  }



  double w(BuildContext context) {

    if(MediaQuery.of(context).size.width <= 500) {
      return MediaQuery.of(context).size.width;
    
    } else 
    if(MediaQuery.of(context).size.width <= 800 && MediaQuery.of(context).size.width > 500) {
      return MediaQuery.of(context).size.width * 0.5;
    
    } else 
    if (MediaQuery.of(context).size.width <= 900 && MediaQuery.of(context).size.width > 800) {
      return MediaQuery.of(context).size.width * 0.7;
    
    } else 
    if(MediaQuery.of(context).size.width <= 1200 && MediaQuery.of(context).size.width > 900) {
      return MediaQuery.of(context).size.width * 0.5;
    
    } else 
    if(MediaQuery.of(context).size.width > 1200) {
      return MediaQuery.of(context).size.width * 0.3;
    
    } return MediaQuery.of(context).size.width * 0.3;
  }


  double h(BuildContext context) {

    if(MediaQuery.of(context).size.width <= 500) {
      return MediaQuery.of(context).size.height * 0.8;
    
    } else 
    if(MediaQuery.of(context).size.width <= 800 && MediaQuery.of(context).size.width > 500) {
      return MediaQuery.of(context).size.height * 0.8;
    
    } else 
    if (MediaQuery.of(context).size.width <= 900 && MediaQuery.of(context).size.width > 800) {
      return MediaQuery.of(context).size.height * 0.7;
    
    } else 
    if(MediaQuery.of(context).size.width <= 1200 && MediaQuery.of(context).size.width > 900) {
      return MediaQuery.of(context).size.height * 0.6;
    
    } else 
    if(MediaQuery.of(context).size.width > 1200) {
      return MediaQuery.of(context).size.height * 0.6;
    
    } return MediaQuery.of(context).size.height * 0.6;
  }





  @override 
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

}
