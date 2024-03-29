## Resume Materi KMFlutter - MVVM Architecture
- MVVM merupakan singkatan dari Model-View-View Model. Kegunaan dari MVVM ini yaitu untuk membuat arsitektur folder project kita menjadi lebih rapi agar nantinya mudah jika ingin melakukan maintenance. Inti dari MVVM ini yaitu memisahkan alur logic yang ada pada aplikasi kita dengan tampilan aplikasi kita.
- Pada struktur folder project kita bisa membagi menjadi 2 folder, yaitu model dan view. Model disini berguna sebagai sumber data dan bentuk data yang akan kita gunakan. Biasanya terdapat class yang berisi constructor yang nantinya akan dipanggil sebagai objek dan juga class untuk menjalankan fungsi API. 
- Untuk didalam view sendiri juga biasanya terdapat file UI lalu ada file state management sebagai view model dan juga ada file widget jika nantinya pada UI ada widget yang ingin di convert ke file tersendiri agar lebih rapi.

## Praktikum MVVM Architecture
- Folder dibuat menjadi struktur 2 bagian, yaitu Model dan View. Untuk Model berisi class konstruktor yang dibutuhkan dan service sebagai API. Lalu yang View berisi screen tiap halaman dan juga Model View yang berisi State Management tiap screen.