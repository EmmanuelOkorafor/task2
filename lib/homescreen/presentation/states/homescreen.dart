// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:task2/web_core/global_fields/fields.dart';

import '../bloc/home_screen_bloc.dart';

class HomeScreen extends StatefulWidget {
  
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {


  String? currency;
  double? balance;
  List<Map<String, dynamic>>? transactions;


  @override
  void initState() {
    BlocProvider.of<HomeScreenBloc>(context).add(const GetUserBalanceEvent());
    BlocProvider.of<HomeScreenBloc>(context).add(const GetUserTransactionsEvent());
    super.initState();
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(overlayColor: MaterialStateColor.resolveWith((states) => transparent), onTap: () => {}, hoverColor: navyBlueLighter, splashColor: navyBlueLighter, radius: 25.0, child: const Icon(Icons.menu_open_rounded, color: pink, size: 20.0,)),
        title: Text('Hello Sandra,', style: Theme.of(context).textTheme.titleLarge),
        actions: [Padding(padding: const EdgeInsets.all(8.0), child: ElevatedButton(onPressed: (){}, style: Theme.of(context).elevatedButtonTheme.style!.copyWith(padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0)), shape: MaterialStateProperty.all(const RoundedRectangleBorder()), overlayColor: MaterialStateColor.resolveWith((states) => transparent) ), child: Text('Add money', style: Theme.of(context).textTheme.labelLarge!.copyWith(color: navyBlueLighter))), ) ],
      ),

      body: Title(
        title: 'Homepage',
        color: white,
        child: BlocConsumer<HomeScreenBloc, HomeScreenState>(
          listener: ((context, state) { if(state is Err) {SnackBar(width: const BoxConstraints().maxWidth * 0.35, padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0), content: Text(state.message!));} }),
          builder: ((context, state) {
            if(state is HomeScreenInitial) {
              return Container();
            
            } else 
            if( state is HomeScreenLoading) {
              return const Center(child: GradientCircularProgressIndicator(gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [navyBlue, white],), radius: 100));
            
            } else 
            if (state is HomeScreenLoaded) {
              if(state.homeScreenEntity.currency != null && state.homeScreenEntity.balance != null && state.homeScreenEntity.transactions != null) {
                balance = state.homeScreenEntity.balance!;
                currency =  state.homeScreenEntity.currency!;
                transactions =  state.homeScreenEntity.transactions!;
      
                return screen(context);
              }
            
            } return screen(context);
          }), 
        ),
      )
    );
  }


  Widget screen(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: navyBlue,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
      
            sbhmax,
      
            Text('Your current balance is', style: Theme.of(context).textTheme.bodyLarge),
      
            sbhmin,
      
            Text('$currency $balance', style: Theme.of(context).textTheme.titleLarge),
      
            sbhmax,
      
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('All Transactions', style: Theme.of(context).textTheme.bodyLarge),
      
                Row(children: [Text('Sort by', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: navyBlueLighter)), sbwmin, Row(children: [Text('Recent', style: Theme.of(context).textTheme.bodyLarge), Icon(Icons.arrow_drop_down, size: 15.0, color: Theme.of(context).iconTheme.color) ])],)
              ],
            ),
      
            sbhmin,
      
            Expanded(
              child: ListView.separated(
                itemCount: transactions!.length,
                separatorBuilder: (context, _) => const Divider(height: 1, color: transparent),
                itemBuilder: (context, index) => Material(
                  child: ListTile(
                    onTap: () => {},
                    leading: const Icon(Icons.account_circle, color: grey, size: 50.0),
                    title: Text('${transactions![index][transactions![index][ 'type'] == 'credit'?'from_wallet':'to_wallet']}', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: navyBlueLighter)),
                    subtitle: Padding(padding: const EdgeInsets.all(8.0), child: ElevatedButton(onPressed: (){}, style: Theme.of(context).elevatedButtonTheme.style!.copyWith(padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0)), shape: MaterialStateProperty.all(const RoundedRectangleBorder()), backgroundColor: MaterialStateProperty.all(green), overlayColor: MaterialStateColor.resolveWith((states) => transparent),), child: Text('${transactions![index]['type']}'.toUpperCase(), style: Theme.of(context).textTheme.labelLarge!.copyWith(color: navyBlueLighter))) ),
                    trailing: Text('${transactions![index]['currency']}} ${transactions![index]['amount']}}', style: Theme.of(context).textTheme.bodySmall),
                    hoverColor: navyBlueLighter,
                  )
                )
              ),
            )
      
      
      
      
          ]
        ),
      ),
    );
  }

  
}