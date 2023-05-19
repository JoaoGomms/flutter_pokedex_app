import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex_app/app/features/pokemon/presenter/controllers/home_controller.dart';

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
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        leading: const Icon(Icons.abc),
        title: const Text('Pokedex'),
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.0),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 5.0,
                        blurStyle: BlurStyle.inner,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.blueAccent,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 32.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 32.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
              ),
              Observer(builder: (_) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: Colors.white),
                  child: DropdownButton<String>(
                    value: controller.dropdownValue,
                    icon: Container(),
                    elevation: 16,
                    underline: Container(),
                    style: const TextStyle(color: Colors.deepPurple),
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
            margin: const EdgeInsets.only(top: 24, left: 8, right: 8, bottom: 2),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
            child: Observer(builder: (_) {
              return controller.pokemons.isEmpty && controller.isLoadingPokemons
                  ? const Center(
                      child: CircularProgressIndicator(),
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
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 1.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(0.0, 1.0), // shadow direction: bottom right
                                    )
                                  ],
                                ),
                                margin: const EdgeInsets.all(4),
                                child: Stack(alignment: Alignment.bottomCenter, children: [
                                  Container(
                                      height: 45,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[100], borderRadius: BorderRadius.circular(8))),
                                  Positioned(top: 4, right: 4, child: Text('#${pokemon.id}')),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Image.network(pokemon.imgUrl, fit: BoxFit.fill),
                                  ),
                                  Positioned(bottom: 4, child: Text(pokemon.name)),
                                ]),
                              );
                            }),
                        if (controller.isLoadingPokemons)
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 24.0),
                            child: Center(
                              child: CircularProgressIndicator(),
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
