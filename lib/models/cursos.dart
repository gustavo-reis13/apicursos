class Cursos {
  final String nome;
  final String instituicao;
  final String duracao;
  final String nivel;

  Cursos({
    required this.nome,
    required this.instituicao,
    required this.duracao,
    required this.nivel,
  });

  factory Cursos.fromJson(Map<String, dynamic> json) {
    return Cursos(
      nome: json['nome'],
      instituicao: json['instituicao'],
      duracao: json['duracao'],
      nivel: json['nivel'],
    );
  }
}