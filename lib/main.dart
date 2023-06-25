
import 'package:api_integrations/bloc/bloc_cubit.dart';
import 'package:api_integrations/bloc/bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:api_integrations/product_model.dart';



void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}
class _MainAppState extends State<MainApp> {
  List<Product> product = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: BlocBuilder<APICubit, APIState>(

builder: (context, state)  {



if(state is APILoading) { 
  //loading
}

if(state is APIError) { 
  state.err ;


  //errror
}

if(state is APISuccess) { 

  print(state.data);

  /// 
}

return Text('');
}
           
            ),
          ),
        ),
      ),
    );
  }
}
