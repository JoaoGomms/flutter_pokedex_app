import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_app/app/features/pokemon/presenter/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = GetIt.I.get<HomeController>();

  @override
  void initState() {
    super.initState();
    controller.fetchPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        leading: const Icon(Icons.abc),
        title: const Text('Pokedex'),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(children: [
          Row(
            children: [
              const SizedBox(width: 120, child: TextField()),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(top: 24, left: 16, right: 16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: GridView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: controller.pokemons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (context, index) {
                  var pokemon = controller.pokemons[index];
                  return Card(
                    child: Column(children: [
                      Text('#${pokemon.id}'),
                      Image.network(pokemon.imgUrl),
                      Text(pokemon.name),
                    ]),
                  );
                }),
          )
        ]),
      ),
    );
  }
}
