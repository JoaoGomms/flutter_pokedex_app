import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_app/app/features/pokemon/presenter/controllers/home_controller.dart';
import 'package:pokedex_app/app/theme/icons/pokemon_app_icons.dart';
import 'package:pokedex_app/app/theme/palette.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = GetIt.I.get<HomeController>();
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent &&
          !controller.isLoadingPokemons) {
        controller.fetchPokemons();
        _scrollController.position.jumpTo(_scrollController.position.maxScrollExtent + 70);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primary,
        leading: const Icon(
          PokemonAppIcons.pokeball,
          color: Palette.white,
        ),
        title: Text(
          'Pokédex',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const ScrollPhysics(),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Container(
                  decoration: BoxDecoration(
                    color: Palette.white,
                    borderRadius: BorderRadius.circular(24.0),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 5.0,
                        spreadRadius: -12,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  child: TextField(
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Palette.primary,
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Palette.white, width: 32.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Palette.white, width: 32.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
              ),
              Observer(builder: (_) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                      blurRadius: 10.0,
                      spreadRadius: -12,
                      color: Colors.black,
                    ),
                  ], shape: BoxShape.circle, color: Palette.white),
                  child: DropdownButton<String>(
                    value: controller.dropdownValue,
                    icon: Container(),
                    elevation: 16,
                    underline: Container(),
                    style: const TextStyle(color: Palette.primary),
                    onChanged: (String? value) {
                      controller.dropdownValue = value ?? 'A';
                      controller.sortPokemons(value == '#' ? 0 : 1);
                    },
                    items: ['A', '#'].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                );
              }),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(top: 24, left: 6, right: 6, bottom: 2),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Palette.white),
            child: Observer(builder: (_) {
              return controller.pokemons.isEmpty && controller.isLoadingPokemons
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Palette.primary,
                      ),
                    )
                  : Column(
                      children: [
                        GridView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: controller.pokemons.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 10 / 10.5,
                            ),
                            itemBuilder: (context, index) {
                              var pokemon = controller.pokemons[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/details', arguments: pokemon);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Palette.light,
                                        blurRadius: 1.0,
                                        spreadRadius: 1.0,
                                        offset: Offset(0.0, 1.0), // shadow direction: bottom right
                                      )
                                    ],
                                  ),
                                  margin: const EdgeInsets.all(8),
                                  child: Stack(alignment: Alignment.bottomCenter, children: [
                                    Container(
                                        height: 45,
                                        decoration: BoxDecoration(
                                            color: Palette.light100, borderRadius: BorderRadius.circular(8))),
                                    Positioned(
                                        top: 4,
                                        right: 4,
                                        child: Text(
                                          '#${pokemon.id.toString().padLeft(3, '0')}',
                                          style: Theme.of(context).textTheme.displaySmall,
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: Image.network(pokemon.imgUrl, fit: BoxFit.fill),
                                    ),
                                    Positioned(
                                        bottom: 4,
                                        child: Text(
                                          pokemon.name,
                                          style: Theme.of(context).textTheme.displayLarge,
                                        )),
                                  ]),
                                ),
                              );
                            }),
                        if (controller.isLoadingPokemons)
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 24.0),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Palette.primary,
                              ),
                            ),
                          )
                      ],
                    );
            }),
          )
        ]),
      ),
    );
  }
}
