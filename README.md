**Крестики - нолики!**

Игра создана на движке  LÖVE2D и Lua

<img src="https://github.com/NorthernBlow/tic-tac-toe/blob/main/screenshots/Screenshot.png" />



#### Геймплей:

Игра расчитана на двух человек, ходят по очереди. 

Кто первым сможет выстроить в ряд свою фигуру тот и победил!



#### Особенности:

Игра находится в раннем доступе, карта 6х6 в стадии разработки.



#### Управление:

<p> Перемещение - стрелками</p>

<p>Сделать ход - space</p>

<p>Полноэкранный режим - F11</p>

<p>
 Выйти из игры - esc
</p>




### Установка:

#### Windows 64bit

Для запуска игры скачайте архив из этого репозитория **tic_tac_toe-win64.zip**

распакуйте в любую папку и запустите файл  `tic-tac-toe.exe`

#### Linux

Скажу сразу, что скомпилированную в AppImage игру у меня, как и у многих других с этим движком завести так и не получилось. Может быть получится у вас, ну а пока мы можем воспользоваться этой игрой в качестве отправной точки. Можно ее ковырять, разбирать, да в общем-то делать что голове вздумается с помощью следующей инструкции:

Для запуска игры из исходного кода необходимо скачать и скомпилировать исходные файлы движка LOVE2D, в .profile либо же в .bash_profile в переменной окружения `PATH` прописать путь к бинарнику .love (в Arch это будет .love-git скорее всего, с официального сайта возможно не скомпилируется, качайте из AUR)

`export PATH=/home/localhost/.local/bin:$PATH`

после чего можете смело клонировать данный репозиторий в любую директорию, после чего забирайте IDE ZeroBrane Studio, в качестве интерпретатора ставим LÖVE2D. Открывать и запускать через `main.lua`

и наслаждаемся игрой! 