Git
===

Очень хорошее введение в git: 
http://www-cs-students.stanford.edu/~blynn/gitmagic/intl/ru/ch01.html

Установка Git для linux:

    debian/ubuntu/altlinux: sudo apt-get install git
    rhel/fedora: sudo yum install git

Установка Git для windows: http://git-scm.com/download/win

Язык C
======

## Установка компилятора

Для linux:
GCC, желательно версии 4.6 или более поздней

Для windows: http://www.cygwin.com/

Так же можно попробовать использовать MinGW:

Для 32-битных версий windows:
http://sourceforge.net/projects/mingw-w64/files/Toolchains%20targetting%20Win32/Automated%20Builds/mingw-w32-bin_i686-linux_20121015.tar.bz2/download

Для 64-битных версий windows:
http://sourceforge.net/projects/mingw-w64/files/Toolchains%20targetting%20Win64/Automated%20Builds/mingw-w64-bin_x86_64-linux_20121031.tar.bz2/download

Вне зависимости от того какой компилятор вы используете в процессе
разработки, проверка заданий осуществляется на 64-битной версии Linux,
используемая локаль - ru_RU.UTF-8

## Компиляция и запуск

сборка: gcc -Wall -std=c99 main.c -o main
запуск: ./main


## Полезная информация

Обработка опций командной строки через getopt:
http://www.ibm.com/developerworks/ru/library/au-unix-getopt/

Интернационализация и gnu gettext:
http://www.gnu.org/software/gettext/
http://ru.wikipedia.org/wiki/Gettext
http://symmetrica.net/uploads/gtk/lesson2.htm

http://c-faq.com/index.html

Правила игры
============

5 лаб = 5000 баллов
1 лаба = 1000 баллов

Критерии оценки
===============

Наличие документация по использованию
-------------------------------------

Руководство по использованию выводится при запуске с
аргументом -h (или при запуске без аргументов если
использование без аргументов не предполагается) и
описание программы в файле README.

Поддержка автоматической сборки
-------------------------------

Наличие Makefile или файла описания для генерации Makefile
(CMakeLists.txt(CMake), SConstruct(SCons), configure.ac+Makefile.am
(GNU Autotools), premake4.lua(Premake) и т.п.). При использовании
CMake/SCons/premake/... обязательно наличие файла BUILD с описанием
действий, необходимых для получения Makefile.

Портируемость
-------------

Основное: возможность сборки в режиме C89 и C99 на
32 и 64-битных платформах.

Дополнительное: возможность сборки компиляторами отличными
от GCC (к примеру clang, intel, MS VC) и/или на платформах,
отличных от Linux/UNIX.


Отсутствие перерасхода ресурсов
-------------------------------

### Память

Отсутствие утечек памяти (логично использовать valgrind),
грамотное использование динамической памяти.

### Процессор

Разумный выбор алгоритмов, избегание полного перебора любой ценой.

Безопасность и отказоустойчивость
---------------------------------

https://security.web.cern.ch/security/recommendations/en/codetools/c.shtml
https://www.securecoding.cert.org/confluence/display/seccode/CERT+C+Secure+Coding+Standard


Простота в использовании и поддержке
------------------------------------

### Малая цикломатическая сложность

Цикломатическая сложность каждой функции не должна превышать 25
(см. http://msdn.microsoft.com/ru-ru/library/ms182212.aspx и 
http://ru.wikipedia.org/wiki/Цикломатическая_сложность ).

Для проверки используется утилита pmccabe. 
cccc

### Нет как лишних зависимостей, так и "велосипедов"

Если для определённой проблемы существует стандартное/
известное решение, изобретение своего не приветствуется.
Исключением являются случаи когда создание своего решения
требуется по заданию и предназначено для лучшего понимания
материала, а так же когда использование известного решения
это "overkill" (к примеру использование getopt когда нужно
поддержать всего одну опцию командной строки).
