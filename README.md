# Мир танков на macOS с Apple silicon (M1/M2/M3/M4)
Мир танков отлично запускается на macOS без Windows на эмуляторах основанных на [Wine](https://winehq.org/) таких  как [Crossover](https://www.codeweavers.com/crossover) или [Whiskey](https://getwhisky.app/). Но к сожалению [Lesta Game Center](https://redirect.lesta.ru/LGC/Lesta_Game_Center_Install_RU.exe)(LGC) который скачивает и обновляет Мир танков не может нормально работать на эмуляторах.

Скачайте, разархивируйте и переместите Мир танков в папку Программы

```text
http://xerocop.ru/git/tanki.zip
```

Запустите Мир танков – начнётся скачивание

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/wineskin-12.jpg">

По окончании скачивания вы увидите следующее

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/wineskin-13.jpg">

Закройте Lesta Game Center

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/wineskin-5.jpg">

Снова запустите Мир танков. Вы великолепны!

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/wineskin-14.jpg">

# Доработки
Чтобы отображался магазин отключите Аппаратное ускорение браузера

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/shop-fix.jpg">

Если возникнут подлагивания звука, то это лечится включением опции Низкое качество в настройках звука. У меня такой проблемы нет, но есть на Crossover

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/sound-fix.jpg">

# Ручной способ создания Wineskin
Опишу самое простое решение которое я смог найти:
* Создаётся Wineskin c конфигом на скачивание клиента игры
* LGC скачивает клиент игры
* После скачивания игры можно запускать её как через Wineskin так и в любом другом эмуляторе


## Установка Homebrew
Homebrew это менеджер пакетов который позволит установить Wineskin
``` text
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
```
## Установка Wineskin
``` text
brew install --cask --no-quarantine The-Wineskin-Project/wineskin/wineskin
```

## Создание Wineskin оболочки
Запустив Wineskin Winery нажимаем + для добавления версии Wine движка

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/wineskin-1.jpg">

Выбираем WS12WineWhiskey-2.3.2 и нажимаем Download and install

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/wineskin-2.jpg">

Нажимаем Create New Blank Wrapper, вводим название в появившемся окне и нажимаем OK

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/wineskin-3.jpg">

Wineskin создаст враппер c введёным вами названием и будет располагаться по адресу /Users/user/Applications/Wineskin

## Установка Lesta Game Center
Скачиваем LGC (https://redirect.lesta.ru/LGC/Lesta_Game_Center_Install_RU.exe)

Запускаем созданный враппер и нажимаем верхний пункт Install Software и в следующем окне нажимаем Choose Setup Executable, после чего выбираем скачанный инсталятор LGC

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/wineskin-4.jpg">

После установки в доке будет логотип LGC – нажимаем по нему правой кнопкой и выбираем Завершить

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/wineskin-5.jpg">

## Настройка Lesta Game Center на скачивание Мира танков
Откройте содержимое созданного враппера кликнув правой кнопкой по нему и выберете Показать содержимое пакета

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/wineskin-6.jpg">

Кликните по папке Contents и по drive_c. После чего перетащите скачанную из этого репозитория папку Games и файл start.bat чтобы получилось как на этом скриншоте. Это файлы необходимые для правильной работы враппера

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/wineskin-7.jpg">

Вернитесь на уровень выше(в папку Contents) и откройте Wineskin

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/wineskin-8.jpg">

В открывшемся окне кликните по Advanced

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/wineskin-9.jpg">

Нажмите верхний Browse и выберите start.bat

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/wineskin-10.jpg">

Нажмите нижний Browse и выберите скачанную из репозитория иконку Мира танков

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/wineskin-11.jpg">

Закройте окно

## Запуск Мира танков
Запустите созданный враппер. Начнётся скачивание Мира танков

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/wineskin-12.jpg">

По окончании скачивания и установки вы увидите следующее

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/wineskin-13.jpg">

Завершите работу враппера

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/wineskin-5.jpg">

Запустите враппер вновь. Вы великолепны!
<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/wineskin-14.jpg">