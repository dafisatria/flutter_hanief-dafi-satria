import 'package:demo_flutter_app/view/screens/tugas_finite_state/list_food_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<FoodProvider>(context, listen: false).get();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FoodProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Food'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: provider.foods.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(provider.foods[index].id.toString()),
            title: Text(provider.foods[index].name),
          );
        },
        separatorBuilder: (context, index) => const Divider(
          thickness: 1,
        ),
      ),
    );
  }
}
