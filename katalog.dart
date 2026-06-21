import 'dart:io';
import 'film.dart';
import 'queue.dart';

class Katalog extends Queue {
  final katalog = File('film.csv');
  Film? film;
  List list = [];

  Katalog() {
    final movie = katalog.readAsLinesSync();
    movie.remove(movie[0]);

    for (var films in movie) {
      final values = films.split(',');

      this.list.add({
        'judul': values[0],
        'genre': values[1],
        'tahun': values[2],
        'negara': values[3],
        'sutradara': values[4],
        'durasi': values[5],
      });
    }
  }

  void inputFilm(
    String judul,
    String genre,
    String tahun,
    String negara,
    String sutradara,
    String durasi,
  ) {
    film = Film(judul, genre, tahun, negara, sutradara, durasi);

    katalog.writeAsStringSync(
      "${film!.film['judul']},${film!.film['genre']},${film!.film['tahun']},${film!.film['negara']},${film!.film['sutradara']},${film!.film['durasi']}m\n",
      mode: FileMode.append,
    );
  }

  void updatekatalog() {
    final movie = katalog.readAsLinesSync();
    movie.remove(movie[0]);
    int i = 0;

    for (var films in movie) {
      final values = films.split(',');

      if (i == this.list.length - 1) {
        this.list.add({
          'judul': values[0],
          'genre': values[1],
          'tahun': values[2],
          'negara': values[3],
          'sutradara': values[4],
          'durasi': values[5],
        });
      }
      i++;
    }
  }

  void sortFilmByName() {
    for (int i = this.list.length - 1; i >= 0; i--) {
      for (int j = i + 1, k = i; j < this.list.length; j++) {
        if (this.list[j]['judul']!.compareTo(list[k]['judul']!) > 0) {
          break;
        } else {
          var temp = this.list[k];
          this.list[k] = this.list[j];
          this.list[j] = temp;
          k = j;
        }
      }
    }
  }

  void sortFilmByYear() {
    for (int i = this.list.length - 1; i >= 0; i--) {
      for (int j = i + 1, k = i; j < this.list.length; j++) {
        if (this.list[j]['tahun']!.compareTo(list[k]['tahun']!) < 0) {
          break;
        } else {
          var temp = this.list[k];
          this.list[k] = this.list[j];
          this.list[j] = temp;
          k = j;
        }
      }
    }
  }

  void filterFilmByCountry(String asalnegara) {
    int n = 1;
    List check = [];
    print(
      "+------+------------------------------------+----------------+-------+------------+--------------------------+--------+",
    );
    print(
      "| No   | Judul                              | Genre          | Tahun | Negara     | Sutradara                | Durasi |",
    );
    print(
      "+------+------------------------------------+----------------+-------+------------+--------------------------+--------+",
    );

    for (int i = 0; i < this.list.length; i++) {
      int judul = this.list[i]['judul'].length;
      int genre = this.list[i]['genre'].length;
      int negara = this.list[i]['negara'].length;
      int sutradara = this.list[i]['sutradara'].length;
      int durasi = this.list[i]['durasi'].length;
      String nomer = n.toString();
      int no = nomer.length;

      if (this.list[i]['negara'] == asalnegara) {
        print(
          "| $nomer" +
              (" " * (5 - no)) +
              "| ${this.list[i]['judul']}" +
              (" " * (35 - judul)) +
              "| ${this.list[i]['genre']}" +
              (" " * (15 - genre)) +
              "| ${this.list[i]['tahun']}  | ${this.list[i]['negara']}" +
              (" " * (11 - negara)) +
              "| ${this.list[i]['sutradara']}" +
              (" " * (25 - sutradara)) +
              "| ${this.list[i]['durasi']}" +
              (" " * (7 - durasi)) +
              "|",
        );
        n++;
        check.add(asalnegara);
      }
    }

    if (check.isEmpty) {
      print(
        "| Negara tidak ada dalam list                                                                                         |",
      );
    }
    print(
      "+------+------------------------------------+----------------+-------+------------+--------------------------+--------+",
    );
  }

  void filterFilmByDirector(String sutradarafilm) {
    int n = 1;
    List check = [];
    print(
      "+------+------------------------------------+----------------+-------+------------+--------------------------+--------+",
    );
    print(
      "| No   | Judul                              | Genre          | Tahun | Negara     | Sutradara                | Durasi |",
    );
    print(
      "+------+------------------------------------+----------------+-------+------------+--------------------------+--------+",
    );
    for (int i = 0; i < this.list.length; i++) {
      int judul = this.list[i]['judul'].length;
      int genre = this.list[i]['genre'].length;
      int negara = this.list[i]['negara'].length;
      int sutradara = this.list[i]['sutradara'].length;
      int durasi = this.list[i]['durasi'].length;
      String nomer = n.toString();
      int no = nomer.length;

      if (this.list[i]['sutradara'] == sutradarafilm) {
        print(
          "| $nomer" +
              (" " * (5 - no)) +
              "| ${this.list[i]['judul']}" +
              (" " * (35 - judul)) +
              "| ${this.list[i]['genre']}" +
              (" " * (15 - genre)) +
              "| ${this.list[i]['tahun']}  | ${this.list[i]['negara']}" +
              (" " * (11 - negara)) +
              "| ${this.list[i]['sutradara']}" +
              (" " * (25 - sutradara)) +
              "| ${this.list[i]['durasi']}" +
              (" " * (7 - durasi)) +
              "|",
        );
        n++;
        check.add(sutradarafilm);
      }
    }

    if (check.isEmpty) {
      print(
        "| Sutradara tidak ada dalam list                                                                                      |",
      );
    }
    print(
      "+------+------------------------------------+----------------+-------+------------+--------------------------+--------+",
    );
  }

  void filerFilmByGenre(String genrefilm) {
    int n = 1;
    List check = [];
    print(
      "+------+------------------------------------+----------------+-------+------------+--------------------------+--------+",
    );
    print(
      "| No   | Judul                              | Genre          | Tahun | Negara     | Sutradara                | Durasi |",
    );
    print(
      "+------+------------------------------------+----------------+-------+------------+--------------------------+--------+",
    );
    for (int i = 0; i < this.list.length; i++) {
      int judul = this.list[i]['judul'].length;
      int genre = this.list[i]['genre'].length;
      int negara = this.list[i]['negara'].length;
      int sutradara = this.list[i]['sutradara'].length;
      int durasi = this.list[i]['durasi'].length;
      String nomer = n.toString();
      int no = nomer.length;
      if (this.list[i]['genre'] == genrefilm) {
        print(
          "| $nomer" +
              (" " * (5 - no)) +
              "| ${this.list[i]['judul']}" +
              (" " * (35 - judul)) +
              "| ${this.list[i]['genre']}" +
              (" " * (15 - genre)) +
              "| ${this.list[i]['tahun']}  | ${this.list[i]['negara']}" +
              (" " * (11 - negara)) +
              "| ${this.list[i]['sutradara']}" +
              (" " * (25 - sutradara)) +
              "| ${this.list[i]['durasi']}" +
              (" " * (7 - durasi)) +
              "|",
        );
        n++;
        check.add(genrefilm);
      }
    }

    if (check.isEmpty) {
      print(
        "| Genre tidak ada dalam list                                                                                          |",
      );
    }
    print(
      "+------+------------------------------------+----------------+-------+------------+--------------------------+--------+",
    );
  }

  void viewFilm() {
    int n = 1;
    print(
      "+------+------------------------------------+----------------+-------+------------+--------------------------+--------+",
    );
    print(
      "| No   | Judul                              | Genre          | Tahun | Negara     | Sutradara                | Durasi |",
    );
    print(
      "+------+------------------------------------+----------------+-------+------------+--------------------------+--------+",
    );
    for (int i = 0; i < this.list.length; i++) {
      int judul = this.list[i]['judul'].length;
      int genre = this.list[i]['genre'].length;
      int negara = this.list[i]['negara'].length;
      int sutradara = this.list[i]['sutradara'].length;
      int durasi = this.list[i]['durasi'].length;
      String nomer = n.toString();
      int no = nomer.length;

      print(
        "| $nomer" +
            (" " * (5 - no)) +
            "| ${this.list[i]['judul']}" +
            (" " * (35 - judul)) +
            "| ${this.list[i]['genre']}" +
            (" " * (15 - genre)) +
            "| ${this.list[i]['tahun']}  | ${this.list[i]['negara']}" +
            (" " * (11 - negara)) +
            "| ${this.list[i]['sutradara']}" +
            (" " * (25 - sutradara)) +
            "| ${this.list[i]['durasi']}" +
            (" " * (7 - durasi)) +
            "|",
      );
      n++;
    }
    print(
      "+------+------------------------------------+----------------+-------+------------+--------------------------+--------+",
    );
  }

  void inputWatchlist(String film) {
    for (int i = 0; i < this.list.length; i++) {
      if (this.list[i]['judul'] == film) {
        Enqueue(list[i]);
      }
    }

    int n = 1;
    print(
      "+------+------------------------------------+----------------+-------+------------+--------------------------+--------+",
    );
    print(
      "| No   | Judul                              | Genre          | Tahun | Negara     | Sutradara                | Durasi |",
    );
    print(
      "+------+------------------------------------+----------------+-------+------------+--------------------------+--------+",
    );
    for (int i = 0; i < this.elements.length; i++) {
      int judul = this.elements[i]['judul'].length;
      int genre = this.elements[i]['genre'].length;
      int negara = this.elements[i]['negara'].length;
      int sutradara = this.elements[i]['sutradara'].length;
      int durasi = this.elements[i]['durasi'].length;
      String nomer = n.toString();
      int no = nomer.length;

      print(
        "| $nomer" +
            (" " * (5 - no)) +
            "| ${this.elements[i]['judul']}" +
            (" " * (35 - judul)) +
            "| ${this.elements[i]['genre']}" +
            (" " * (15 - genre)) +
            "| ${this.elements[i]['tahun']}  | ${this.elements[i]['negara']}" +
            (" " * (11 - negara)) +
            "| ${this.elements[i]['sutradara']}" +
            (" " * (25 - sutradara)) +
            "| ${this.elements[i]['durasi']}" +
            (" " * (7 - durasi)) +
            "|",
      );
      n++;
    }
    print(
      "+------+------------------------------------+----------------+-------+------------+--------------------------+--------+",
    );
  }

  @override
  void Dequeue() {
    Map<String, String> data = {};

    if (isEmpty()) {
      print("Queue Underflow");
    } else {
      data = elements[front];
      for (int i = front; i < rear; i++) {
        elements[i] = elements[i + 1];
      }
      elements.removeAt(rear);
      rear--;
      if (rear == -1) {
        front = -1;
      }
    }

    int n = 1;
    print(
      "+------+------------------------------------+----------------+-------+------------+--------------------------+--------+",
    );
    print(
      "| No   | Judul                              | Genre          | Tahun | Negara     | Sutradara                | Durasi |",
    );
    print(
      "+------+------------------------------------+----------------+-------+------------+--------------------------+--------+",
    );
    for (int i = 0; i < this.elements.length; i++) {
      int judul = this.elements[i]['judul'].length;
      int genre = this.elements[i]['genre'].length;
      int negara = this.elements[i]['negara'].length;
      int sutradara = this.elements[i]['sutradara'].length;
      int durasi = this.elements[i]['durasi'].length;
      String nomer = n.toString();
      int no = nomer.length;

      print(
        "| $nomer" +
            (" " * (5 - no)) +
            "| ${this.elements[i]['judul']}" +
            (" " * (35 - judul)) +
            "| ${this.elements[i]['genre']}" +
            (" " * (15 - genre)) +
            "| ${this.elements[i]['tahun']}  | ${this.elements[i]['negara']}" +
            (" " * (11 - negara)) +
            "| ${this.elements[i]['sutradara']}" +
            (" " * (25 - sutradara)) +
            "| ${this.elements[i]['durasi']}" +
            (" " * (7 - durasi)) +
            "|",
      );
      n++;
    }
    print(
      "+------+------------------------------------+----------------+-------+------------+--------------------------+--------+",
    );
  }
}
