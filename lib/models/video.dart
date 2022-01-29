class Video {
  String? id;
  String? titulo;
  String? descricao;
  String? imagem;

  Video({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.imagem,
  });

  //quando usa o factory, ele cria somente uma instância de Video. Então, nesse
  //caso como precisa percorrer uma lista para fazer a conversão da lista para
  //Video, o ideal é usar o factory senão vai ocupar muito mais memória
  factory Video.fromJson(Map json) {
    return Video(
      id: json['id']['videoId'],
      titulo: json['snippet']['title'],
      descricao: json['snippet']['description'],
      imagem: json['snippet']['thumbnails']['high']['url'],
    );
  }
}
