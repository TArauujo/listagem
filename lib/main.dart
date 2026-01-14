import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class Jogador {
  final String nome;
  final String time;
  final int idade;

  Jogador({required this.nome, required this.time, required this.idade});
}

final List<Jogador> jogadores = [
  Jogador(nome: 'Arrascaeta', time: 'Flamengo', idade: 31),
  Jogador(nome: 'Messi', time: 'Inter Miami', idade: 38),
  Jogador(nome: 'Serrote', time: 'Al-Nassr', idade: 40),
  Jogador(nome: 'BrunoBet', time: 'Flamengo', idade: 35),
  Jogador(nome: 'PaqueBet', time: 'WestHam', idade: 28),
];

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 248, 94, 145),
        appBar: AppBar(
          title: const Text(
            'Listagem de Jogadores',
            style: TextStyle(color: Colors.lightBlue),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          //Se tiver o contentPadding, a lista fica rolável se a tela não couber todas as informações. Na verdade, é no ListView que isso acontece.
          itemCount: jogadores.length, //A quantidade de itens da lista
          itemBuilder: (context, index) {
            final jogador = jogadores[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 6),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 30,
                  ), //Deixou com scroll
                  title: Center(
                    child: Text(
                      jogador.nome,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Time: ${jogador.time}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),

                      Text(
                        'Idade: ${jogador.idade} anos',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
