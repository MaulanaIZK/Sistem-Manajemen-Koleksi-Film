import 'dart:io';
import 'katalog.dart';

void main(){
  Katalog katalog = Katalog();
  bool running = true;

  while(running){
    print('============================================================================');
    print('<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Katalog Film>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    print('');
    print('1. Tampilkan list');
    print('2. Tampilkan list berdasarkan tahun');
    print('3. Tampilakan list berdasarkan judul');
    print('4. Tampilkan list berdasarkan negara');
    print('5. Tampilkan list berdasarkan genre');
    print('6. Tampilkan list berdasarkan sutradara');
    print('7. Tambah film');
    print('8. Membuat watchlist');
    print('9. Keluar');
    print('');

    stdout.write('Input pilihan> ');
    String pilih = stdin.readLineSync()!;

    switch(pilih){

      case '1':
        katalog.viewFilm();
        break;

      case '2':
        katalog.sortFilmByYear();
        katalog.viewFilm();
        break;

      case '3':
        katalog.sortFilmByName();
        katalog.viewFilm();
        break;

      case '4':
        List negara = [];
        final compare = negara;
        for(int i = 0; i < katalog.list.length - 1; i++){

          if(!compare.contains(katalog.list[i]['negara'])){
            negara.add(katalog.list[i]['negara']);
          }
        }
        print('============================================================================');
        print('<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<List negara>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
        print('');

        int n = 1;
        for(int l = 0; l < negara.length; l++){
          print('${n}. ${negara[l]}');
          n++;
        }
        print('');
        print('Keluar');
        print('');

        stdout.write("Input nama negara> ");
        String nama = stdin.readLineSync()!;
        
        if(nama == 'keluar' || nama == 'Keluar'){
          break;
        } else {
          katalog.filterFilmByCountry(nama);
        }
        break;
      case '5':
        List genre = [];
        final compare = genre;
        for(int i = 0; i < katalog.list.length - 1; i++){

          if(!compare.contains(katalog.list[i]['genre'])){
            genre.add(katalog.list[i]['genre']);
          }
        }
        print('============================================================================');
        print('<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<List genre>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
        print('');

        int n = 1;
        for(int l = 0; l < genre.length; l++){
          print('${n}. ${genre[l]}');
          n++;
        }
        print('');
        print('Keluar');
        print('');

        stdout.write("Input nama genre> ");
        String nama = stdin.readLineSync()!;
        
        if(nama == 'keluar' || nama == 'Keluar'){
          break;
        } else {
          katalog.filerFilmByGenre(nama);
        }
        break;
      case '6':
        List sutradara = [];
        final compare = sutradara;
        for(int i = 0; i < katalog.list.length - 1; i++){

          if(!compare.contains(katalog.list[i]['sutradara'])){
            sutradara.add(katalog.list[i]['sutradara']);
          }
        }
        print('============================================================================');
        print('<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<List sutradara>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
        print('');

        int n = 1;
        for(int l = 0; l < sutradara.length; l++){
          print('${n}. ${sutradara[l]}');
          n++;
        }
        print('');
        print('Keluar');
        print('');

        stdout.write("Input nama genre> ");
        String nama = stdin.readLineSync()!;
        
        if(nama == 'keluar' || nama == 'Keluar'){
          break;
        } else {
          katalog.filterFilmByDirector(nama);
        }
        break;
      case '7':
        print('============================================================================');
        print('<<<<<<<<<<<<<<<<<<<<<<<Tambah film baru dalam list>>>>>>>>>>>>>>>>>>>>>>>>>>');
        print('');
        print('Judul film: ');
        stdout.write("{Tulis 'keluar' untuk batal}> ");
        String judul = stdin.readLineSync()!;
        if(judul == 'keluar'){
          break;
        }
        
        print('Genre film: ');
        stdout.write("{Tulis 'keluar' untuk batal}> ");
        String genre = stdin.readLineSync()!;
        if(genre == 'keluar'){
          break;
        }

        print('Tahun keluar film: ');
        stdout.write("{Tulis 'keluar' untuk batal}> ");
        String tahun = stdin.readLineSync()!;
        if(tahun == 'keluar'){
          break;
        }
        
        print('Negara asal film: ');
        stdout.write("{Tulis 'keluar' untuk batal}> ");
        String negara = stdin.readLineSync()!;
        if(negara == 'keluar'){
          break;
        }

        print('Sutradara film: ');
        stdout.write("{Tulis 'keluar' untuk batal}> ");
        String sutradara = stdin.readLineSync()!;
        if(sutradara == 'keluar'){
          break;
        }
        
        print('Durasi film: ');
        stdout.write("{Tulis 'keluar' untuk batal}> ");
        String durasi = stdin.readLineSync()!;
        if(durasi == 'keluar'){
          break;
        }

        katalog.inputFilm(judul, genre, tahun, negara, sutradara, durasi);
        katalog.updatekatalog();
        katalog.viewFilm();
        break;
      case '8':
        bool queue = true;

        while(queue){
          print('============================================================================');
          print('<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Watchlist>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
          print('');
          print('1. Watchlist');
          print('2. Tambah watchlist');
          print('3. Hapus watchlist');
          print('4. Keluar');
          print('');
          stdout.write("input> ");
          String pilih = stdin.readLineSync()!;

          switch(pilih){

            case '1':
              int n = 1;
              String nomer = n.toString();
              print("+------+------------------------------------+----------------+-------+------------+--------------------------+--------+");
              print("| No   | Judul                              | Genre          | Tahun | Negara     | Sutradara                | Durasi |");
              print("+------+------------------------------------+----------------+-------+------------+--------------------------+--------+");
              for(int i = 0; i < katalog.elements.length; i++){
                int judul = katalog.elements[i]['judul'].length;
                int genre = katalog.elements[i]['genre'].length;
                int negara = katalog.elements[i]['negara'].length;
                int sutradara = katalog.elements[i]['sutradara'].length;
                int durasi = katalog.elements[i]['durasi'].length;
                int no = nomer.length;

                print("| $n" + ( " " * (5 - no)) + "| ${katalog.elements[i]['judul']}" + ( " " * (35 - judul ))+"| ${katalog.elements[i]['genre']}" + (" " * (15 - genre)) + "| ${katalog.elements[i]['tahun']}  | ${katalog.elements[i]['negara']}" + (" " * (11 - negara)) + "| ${katalog.elements[i]['sutradara']}" + (" " * (25 - sutradara)) + "| ${katalog.elements[i]['durasi']}" + (" " * (7 - durasi)) + "|");
                n++;
              }
              print("+------+------------------------------------+----------------+-------+------------+--------------------------+--------+");
              break;
            case '2':
              print('Nama film:');
              stdout.write('> ');
              String film = stdin.readLineSync()!;
              katalog.inputWatchlist(film);
              break;
            case '3':
              katalog.Dequeue();
              break;
            case '4':
              queue = false;
              break;
            default:
              print('ERROR: input tidak dikenal');
          }
        }
      case '9':
        running = false;
        break;
      default:
        print('ERROR: input tidak dikenal');
    } 
  }
  
}