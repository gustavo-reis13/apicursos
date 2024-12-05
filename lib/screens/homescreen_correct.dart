import 'package:flutter/material.dart';
import '../models/cursos.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Cursos>> futureCursos;

  @override
  void initState() {
    super.initState();
    futureCursos = ApiService().fetchCursos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Dados'),
      ),
      body: Center(
        child: FutureBuilder<List<Cursos>>(
          future: futureCursos,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Erro: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('Nenhum dado encontrado');
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final cursos = snapshot.data![index];
                return ListTile(
                  title: Text(cursos.nome),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Duracao: ${cursos.duracao}"),
                      Text("Instituicao: ${cursos.instituicao}"),
                      Text("Nivel: ${cursos.nivel}"),
                    ],
                  ),
                  isThreeLine: true,
                );
              },
            );
          },
        ),
      ),
    );
  }
}