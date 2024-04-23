class Pokemon {
  String name;
  String url;

  Pokemon({required this.name, required this.url});

/*   factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      // Completa con más propiedades según la estructura de datos de la PokeAPI
    );
  } */
}