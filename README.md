## Malang PHP User Group Community Website

Repository ini berisi *source code* untuk halaman website dari Malang PHP User Group.


## Kontribusi

Untuk berkontribusi, baik untuk *bug-fixing*, penambahan artikel, maupun perbaikan *layout* dapat dilakukan dengan cara melakukan *forking* pada repository ini, lalu *commit* perubahan yang anda buat dengan **template yang sudah ada**, lalu kirimkan *pull request* ke repository ini pada **branch development**.

Adapun untuk template *commit* bisa dipasang dengan cara menjalankan perintah berikut di direktori dimana *project* berada:

```sh
git config commit.template .gitmessage.txt
```

## Stack

Website menggunakan PHP 5.6 dan [PhileCMS](http://philecms.com),
serta dihosting pada platform [Heroku](http://heroku.com).

Untuk testing dilakukan dengan menggunakan [Travis CI](https://travis-ci.org/maman/malangphp).
