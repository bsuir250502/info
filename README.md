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

сборка: `gcc -Wall -std=c99 main.c -o main`

запуск: `./main`


## Полезная информация

Обработка опций командной строки через getopt:
http://www.ibm.com/developerworks/ru/library/au-unix-getopt/

Интернационализация и gnu gettext:
* http://fedoraproject.org/wiki/How_to_do_I18N_through_gettext
* http://www.gnu.org/software/gettext/
* http://ru.wikipedia.org/wiki/Gettext
* http://symmetrica.net/uploads/gtk/lesson2.htm

Часто задаваемые вопросы по C: http://c-faq.com/index.html

Правила игры
============

5 лаб = 5000 баллов

1 лаба = 1000 баллов. Баллы выдаются за выполнение критериев оценки.

Пропуск пары - штраф. Для ОАиП это 100 баллов за одну пару.

__Плагиат = -700 и переписывание с нуля.__

лаба до дедлайна предыдущей = 1.2 * заработаные баллы

лаба до её дедлайна = 1 * заработаные баллы

лаба на n-ный день после дедлайна:

    n < 14: (0.5+0.5*(14-n)/14) * заработаные баллы
    n >= 14: 0.5 * заработаные баллы

Дополнительные баллы можно получить следующим образом:
1. день с коммитами = 8 баллов
2. выполнение дополнительного задания (берётся у преподавателя,
   доступно после выполнения основного)

Критерии оценки
===============

1. Базовое задание = 250
------------------

Программа выполняет то что указано в условии.


2. Единый стиль и оформление, простейшая система сборки = 100
-------------------------------------------------------

### 2.1. Оформление

Используется стандарт Кернигана и Ричи с отступами в 4 пробела
http://en.wikipedia.org/wiki/Indent_style#K.26R_style

Для автоматической корректировки наиболее удобно использовать утилиту indent.
* linux: устанавливается из репозиториев
* windows: http://gnuwin32.sourceforge.net/packages/indent.htm

Запускается так:

    indent -kr -nut main.c

ВНИМАНИЕ!!! Если файл использует окончания строк в стиле windows, то
indent следует запускать тоже на windows, т.к. windows автоматически
конвертирует "\r\n" в "\n". Если нужно отформатировать код на linux,
то предварительно следует конвертировать переводы строк. Для этого
можно использовать программу dos2unix. Если этого не сделать, то после
запуска `indent` файл превратится в месиво (т.к. под линуксом indent
ничего о виндовых переводах строк не слышал и "\r" воспринимается
просто как странный символ и не трогается. Если уже сделали, то
чинится так:

    mv main.c main.c.orig
    cat main.c.orig | tr -d "\r" > main.c
    indent -kr -nut main.c


### 2.2 Makefile

В простейшем случае Makefile выглядит следующим образом:

    all:
    	gcc -Wall -std=c99 lab1.c -o lab1


3. Простота в понимании, модификации и поддержке = 350
------------------------------------------------

### 3.1. Логичное именование переменных, функций, типов, ...

По имени функции сразу понятно что она делает. Нет переменных с
однобуквенными именами. Единственное исключение - i,j,k в качестве
переменных цикла (причём i всегда на первом уровне вложенности, j на
втором и k на третьем). Иногда может использоваться n для указания
количества, но только в случае, когда её смысл очевиден с первого
взгляда.

### 3.2. Имеется сигнализация и обработка ошибок

Функции обязательно должны уметь обрабатывать ошибки во входных данных
и сигнализировать о них. Так же функции должны обрабатывать сигналы об
ошибках от вызываемых функций.

### 3.3. Код состоит из функций, выполняющих простые задачи.

Логичное разбиение кода на функции. Каждая функция выполняет строго
одну задачу (нет функций do_everything на сотню строк). Все
повторяющиеся операции вынесены в функции. Нет дублирования кода.

Простота функции измеряется как цикломатическая сложность.
Для каждой функции она не должна превышать 15
(см. http://msdn.microsoft.com/ru-ru/library/ms182212.aspx и 
http://ru.wikipedia.org/wiki/Цикломатическая_сложность ).

Для проверки используется утилита pmccabe.

    pmccabe -v lab1.c

### 3.4. Независимые части вынесены в отдельные файлы

К примеру свои версии функций из стандартной библиотеки стоит вынести
в mystdlib.h и mystdlib.c

### 3.5. Нет глобальных переменных

Глобальные переменные есть только там где без них не обойтись (читай,
"нет нигде").

### 3.6. Минимальное использование функций с "побочными эффектами"

Побочными эффектами называются любые действия функций, отличные от
чтения аргументов, работы с локальными переменными и возврата
значения. Функции имеющие побочные эффекты должны быть явным образом
обозначены (к примеру, иметь имена начинающиеся на set_ или
initialize_).

### 3.7. Нет как лишних зависимостей, так и "велосипедов"

Если для определённой проблемы существует стандартное/
известное решение, изобретение своего не приветствуется.
Исключением являются случаи когда создание своего решения
требуется по заданию и предназначено для лучшего понимания
материала, а так же когда использование известного решения
это "overkill" (к примеру использование getopt когда нужно
поддержать всего одну опцию командной строки).

### 3.8. Нет кода "на всякий случай"

Программа  содержит только код, необходимый для решения задачи.


4. Наличие документация по использованию = 85
----------------------------------------

Описание программы в файле README = 47

Руководство по использованию выводится при запуске с
аргументом -h (или при запуске без аргументов если
использование без аргументов не предполагается) = 38


5. Безопасность и отказоустойчивость = 60
------------------------------------

Обязательно: https://security.web.cern.ch/security/recommendations/en/codetools/c.shtml

Желательно: https://www.securecoding.cert.org/confluence/display/seccode/CERT+C+Secure+Coding+Standard


6. Отсутствие перерасхода ресурсов = 55
----------------------------------

### 6.1. Память

Отсутствие утечек памяти (логично использовать valgrind),
грамотное использование динамической памяти.

### 6.2. Процессор

Разумный выбор алгоритмов, избегание полного перебора любой ценой.

### 6.3. Ресурсы

Закрытие файлов по окончании работы с ними, освобождение мьютексов и иных системных ресурсов.


7. Поддержка автоматической сборки = 50
----------------------------------

Наличие Makefile или файла описания для генерации Makefile
(CMakeLists.txt(CMake), SConstruct(SCons), configure.ac+Makefile.am
(GNU Autotools), premake4.lua(Premake) и т.п.). При использовании
CMake/SCons/premake/... обязательно наличие файла BUILD с описанием
действий, необходимых для получения Makefile.


8. Портируемость = 50
----------------

Основное: возможность сборки в режиме C89 и C99 на
32 и 64-битных платформах.

Дополнительное: возможность сборки компиляторами отличными
от GCC (к примеру clang, intel, MS VC) и/или на платформах,
отличных от Linux/UNIX.

