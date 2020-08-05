class Video {
  String id;
  String descricao;
  String titulo;
  String imagem;
  String canal;

  Video({this.id, this.descricao, this.canal, this.imagem, this.titulo});

 
    /* return Video(
 static converterJson(Map<String, dynamic> json) {
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelId"],
    ); */


  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      descricao: json["snippet"]["description"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelId"],
    );
  }
}
