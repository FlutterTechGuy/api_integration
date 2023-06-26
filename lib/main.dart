import 'package:api_integrations/bloc/bloc_cubit.dart';
import 'package:api_integrations/bloc/bloc_state.dart';
import 'package:api_integrations/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => APICubit()),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            actions: [
              Builder(builder: (context) {
                return TextButton(
                    onPressed: () {
                      context.read<APICubit>().getAllProducts();
                    },
                    child: const Text(
                      'get data',
                      style: TextStyle(color: Colors.white),
                    ));
              })
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: BlocBuilder<APICubit, APIState>(builder: (context, state) {
                if (state is APILoading) {
                  //loading

                  return Text(state.msg);
                }

                if (state is APIError) {
                  state.err;

                  return Text(state.err);
                  //errror
                }

                if (state is APISuccess) {
                  return Column(
                    children: List.generate(state.data.length, (index) {
                      final singleData = state.data[index];
                      return Text(singleData.title);
                    }),
                  );
                }

                if (state is APIInital) {
                  return const Text(
                      "No products found. Try requesting to the server");
                }

                return const Text('Something went wrong!');
              }),
            ),
          ),
        ),
      ),
    );
  }
}
