class Film {
  Map<String,String?> _film = {};

  Film(String judul, String genre, String tahun, String negara, String sutradara, String durasi){
    this._film.addAll({
      'judul' : judul,
      'genre' : genre,
      'tahun' : tahun,
      'negara' : negara,
      'sutradara' : sutradara,
      'durasi' : durasi,
    });
  }

  Map get film => this._film;
}