import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:poke_api/controlers/PokemonController.dart';
import 'package:poke_api/models/pokemon.dart';

class ListPokemons extends StatefulWidget {
  @override
  State<ListPokemons> createState() => _ListPokemonsState();
}

class _ListPokemonsState extends State<ListPokemons> {
  final PokemonController _controller = PokemonController();
  ScrollController _scroll = ScrollController();
  int offset = 0;
  bool loading = false;
  Size? size;
  List<Pokemon> allPokemons = [];

  @override
  void initState() {
    super.initState();
    getPokemons();
    _scroll.addListener(() => loadMorePokemons());
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(title: const Text('Pokemons')),
        body: Stack(children: [createList(), if (loading) createProgress()]));
  }

  Future<void> getPokemons() async {
    setState(() {
      loading = true;
    });
    List<Pokemon> pokemons = await _controller.getPokemons(offset);
    allPokemons.addAll(pokemons);
    setState(() {
      loading = false;
      offset += 20;
    });
  }

  createList() {
    return ListView.builder(
        itemBuilder: (context, index) {
          Pokemon pokemon = allPokemons[index];
          return ListTile(
            title: Text(pokemon.name),
            subtitle: Text(pokemon.url),
          );
        },
        itemCount: allPokemons.length);
  }

  createProgress() {
    return Positioned(
        child: CircularProgressIndicator(), bottom: 5, left: (size!.width / 2) - 20);
  }

  void loadMorePokemons() {
    double middleScroll = _scroll.position.maxScrollExtent * 0.6;
    double currentScroll = _scroll.position.pixels;
    print(middleScroll);
    if((currentScroll >= middleScroll) && !loading){
      getPokemons();
    }
  }
}
