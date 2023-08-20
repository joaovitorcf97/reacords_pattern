import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reacords_pattern/home/home_controller.dart';
import 'package:reacords_pattern/home/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = false;

  void showLoader() {
    if (!loading) {
      loading = true;
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }
  }

  void hideLoader() {
    if (loading) {
      loading = false;
      Navigator.of(context).pop();
    }
  }

  void showError({required String message}) {
    hideLoader();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeController>().fazerQualquerCoisa();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<HomeController>().error();
        },
      ),
      body: BlocConsumer<HomeController, HomeState>(
        listener: (context, state) {
          switch (state) {
            case HomeLoading():
              showLoader();
            case HomeError(message: final message):
              showError(message: message);
            default:
              hideLoader();
          }
        },
        builder: (context, state) {
          return Center(
            child: switch (state) {
              HomeInitial() => const Text('Iniciando a tela'),
              HomeLoaded(name: final nameLoaded) => Text(nameLoaded),
              _ => SizedBox.fromSize(),
            },
          );
        },
      ),
    );
  }
}
