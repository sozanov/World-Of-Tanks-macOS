# Мир танков на macOS
Мир танков отлично работает на macOS без Windows на эмуляторах основанных на [Wine](https://winehq.org/) таких  как [Crossover](https://www.codeweavers.com/crossover) или [Whiskey](https://getwhisky.app/). Но к сожалению [Lesta Game Center](https://redirect.lesta.ru/LGC/Lesta_Game_Center_Install_RU.exe)(LGC) который скачивает и обновляет Мир танков не может нормально работать на эмуляторах

Данная сборка:

* Без виртуальной Windows
* Может скачивать и устанавливать обновления Мира танков
* Нет глюков с вращающимися гусеницами
* Магазин отображается без искажений
* Нет проблем с изменёнными цветами
* По умолчанию скачивается SD клиент
* Занимает около 55 Гб

## Установка

* Скачайте
* Разархивируйте
* Переместите Tanki и LGC в папку Программы

```text
http://xerocop.ru/git/tanki.zip
```

Выполните следующую команду в **Терминале**
```text
xattr -r -c /Applications/Tanki.app
```

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/22.jpg">

Запустите LGC – начнётся скачивание

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/0.jpg">

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/1.jpg">

По окончании скачивания вы увидите следующее

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/2.jpg">

Закройте Lesta Game Center

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/3.jpg">

Запустите Tanki

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/4.jpg">

Вы великолепны!

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/5.jpg">

# Обновления

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/6.jpg">

Если вы видите что Мир танков стал сообщать о необходимости обновления игры, то запустите LGC (Мир танков при этом должен быть закрыт) он скачает и установит все обновления сам

После того как обновления будут установлены, закройте Lesta Game Center и только после этого запускайте Мир танков 



# Доработки
Чтобы отображался магазин отключите Аппаратное ускорение браузера

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/shop-fix.jpg">

Если возникнут подлагивания звука, то это лечится включением опции Низкое качество в настройках звука. У меня такой проблемы нет, но есть на Crossover

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/sound-fix.jpg">

# Ручной способ создания Wineskin

* Создаётся Wineskin c конфигом для скачивание клиента игры
* LGC скачивает клиент игры
* После скачивания игры её можно запускать
* Обновления происходят через запуск LGC


## Установка Homebrew
Homebrew это менеджер пакетов который позволит установить Wineskin
``` text
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
```
## Установка Wineskin
``` text
brew install --cask --no-quarantine The-Project/wineskin/wineskin
```

## Создание Wineskin враппера
Запустив Wineskin Winery нажимаем **+** для добавления версии Wine движка

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/14.jpg">

Выбираем **WS12WineWhiskey-2.3.2** и нажимаем **Download and install**

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/15.jpg">

Нажимаем **Create New Blank Wrapper**, вводим **Tanki** в появившемся окне и нажимаем **OK**

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/16.jpg">

Wineskin создаст враппер c введённым вами названием и будет располагаться по адресу ~/Applications/Wineskin

Перенесите созданный враппер в папку Программы

## Установка Lesta Game Center
Скачиваем LGC (https://redirect.lesta.ru/LGC/Lesta_Game_Center_Install_RU.exe)

Запускаем созданный враппер и нажимаем верхний пункт **Install Software** и в следующем окне нажимаем **Choose Setup Executable**, после чего выбираем скачанный инсталлятор LGC

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/17.jpg">

После установки в доке будет логотип LGC – нажимаем по нему правой кнопкой и выбираем **Завершить**

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/3.jpg">

## Настройка Lesta Game Center
Откройте содержимое созданного враппера кликнув правой кнопкой по нему и выберете **Показать содержимое пакета**

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/18.jpg">

Откройте папку **Contents**, **drive_c**.

Создайте папку **Games**, в ней создайте папку **Tanki**, а в папке Tanki создайте папку **game_metadata**

Создайте 2 файла в папке Tanki
* **app_type.xml**
* **game_info.xml**

В папке game_metadata создайте
* **metadata.xml**

Как указано на скриншоте

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/19.jpg">


Скопируйте это в файл **app_type.xml**
```text
<?xml version="1.0" encoding="UTF-8"?>
<protocol name="app_type" version="3.0">
 <app_type>incomplete</app_type>
 <switch_to_type>sd</switch_to_type>
</protocol>
```

Скопируйте это в файл **game_info.xml**
```text
<?xml version="1.0" encoding="utf-8"?>
<protocol name="game_info" version="2.16" wgc_publisher_id="lesta">
    <game>
        <id>WOT.RU.PRODUCTION</id>
        <index>0</index>
        <installed>false</installed>
        <localization>RU</localization>
        <content_localizations>
            <content_localization realm="ru">ru</content_localization>
        </content_localizations>
        <client_type>sd</client_type>
        <show_guide>false</show_guide>
        <update_urls>
            <value>https://lstus-ru.lesta.ru/</value>
        </update_urls>
        <corrupt_parts/>
        <part_versions>
        </part_versions>
        <parameters>
            <value name="post_install_action_required">false</value>
            <value name="preinstall_balloon_shown">false</value>
        </parameters>
        <dlc/>
        <in_game_overlay>true</in_game_overlay>
        <accepted_preinstalls/>
        <available_content_languages/>
    </game>
</protocol>
```

Скопируйте это в файл **metadata.xml**
```text
<protocol name="app_metadata" version="7.2" wgc_publisher_id="lesta">
    <version>20250122074514</version>
    <predefined_section>
		<app_id>WOT.RU.PRODUCTION</app_id>
		<chain_id>sd3_hd3</chain_id>
		<supported_languages>BE,RU</supported_languages>
		<default_language>RU</default_language>
		<name>Мир танков</name>
		<fs_name>Tanki</fs_name>
		<shortcut_name>Мир танков</shortcut_name>
		<executables>
			<executable>Tanki.exe</executable>
		</executables>
		<launch_options>
			<option id="safe_mode">-safe</option>
			<option id="reset_graphics">-rg</option>
			<option id="force_32bit">--win32</option>
		</launch_options>
		<keep_patches_interval>0</keep_patches_interval>
		<client_types default="sd">
			<client_type id="sd">
				<initial_app_type>incomplete</initial_app_type>
				<final_app_type>sd</final_app_type>
				<min_supported_os>Win7</min_supported_os>
				<client_parts>
					<client_part id="locale" integrity="false" lang="true" />
					<client_part id="client" integrity="true" />
					<client_part app_type="sd" id="sdcontent" integrity="true" />
				</client_parts>
			</client_type>
			<client_type arch="x64" id="hd">
				<initial_app_type>incomplete</initial_app_type>
				<final_app_type>hd</final_app_type>
				<min_supported_os>Win7</min_supported_os>
				<client_parts>
					<client_part id="locale" integrity="false" lang="true" />
					<client_part id="client" integrity="true" />
					<client_part app_type="sd" id="sdcontent" integrity="true" />
					<client_part app_type="hd" id="hdcontent" integrity="true" />
				</client_parts>
			</client_type>
		</client_types>
		<login_enabled>true</login_enabled>
		<demo_accounts>
			<enabled>false</enabled>
		</demo_accounts>
		<realms_settings>
			<instances>
				<instance default="true" id="wot_ru">
					<platform_realm_id>ru</platform_realm_id>
					<game_id>wot</game_id>
					<title_id>ru.wot</title_id>
					<content_service_url>https://lstuscs-ru.lesta.ru/</content_service_url>
					<features>
						<feature enabled="true" id="game_pages_targeting" />
						<feature enabled="true" id="buy_game_items" />
					</features>
					<common_commerce_agreements>
						<agreement id="ru_eula" />
					</common_commerce_agreements>
				</instance>
			</instances>
		</realms_settings>
		<localization>
			<item id="ENVIRONMENT_NAME__CT">
				<text xml:lang="en-ZW">Common Test</text>
				<text xml:lang="ru">Общий тест</text>
				<text xml:lang="en">Common Test</text>
				<text xml:lang="be">Агульнае тэставанне</text>
			</item>
			<item id="ENVIRONMENT_NAME__SB">
				<text xml:lang="en-ZW">Sandbox</text>
				<text xml:lang="ru">Песочница</text>
				<text xml:lang="en">Sandbox</text>
				<text xml:lang="be">Пясочніца</text>
			</item>
			<item id="ENVIRONMENT_NAME__ST">
				<text xml:lang="en-ZW">Supertest</text>
				<text xml:lang="ru">Супертест</text>
				<text xml:lang="en">Supertest</text>
				<text xml:lang="be">Супертэставанне</text>
			</item>
			<item id="SD__NAME">
				<text xml:lang="en-ZW">Standard (SD) Client.</text>
				<text xml:lang="ru">Стандартный клиент (SD)</text>
				<text xml:lang="en">Standard (SD) Client</text>
				<text xml:lang="be">Звычайны кліент (SD)</text>
			</item>
			<item id="SD__SHORT_NAME">
				<text xml:lang="en-ZW">SD</text>
				<text xml:lang="ru">SD</text>
				<text xml:lang="en">SD</text>
				<text xml:lang="be">SD</text>
			</item>
			<item id="SD__DESCRIPTION">
				<text xml:lang="en-ZW">Full game without maximum-quality textures.</text>
				<text xml:lang="ru">Полная версия игры, за исключением текстур максимального разрешения.</text>
				<text xml:lang="en">Full game without maximum-quality textures.</text>
				<text xml:lang="be">Поўная версія гульні, толькі без тэкстур высокай разрознасці.</text>
			</item>
			<item id="SD__CLIENT__TITLE">
				<text xml:lang="en-ZW">Mini Client</text>
				<text xml:lang="ru">Мини-клиент</text>
				<text xml:lang="en">Mini Client</text>
				<text xml:lang="es-MX">Minicliente</text>
				<text xml:lang="be">Міні-кліент</text>
			</item>
			<item id="SD__CLIENT__INFO_BEFORE_INSTALL_TEXT">
				<text xml:lang="en-ZW">You will receive access to Battle Training and vehicles of starting tiers</text>
				<text xml:lang="ru">Вы получите доступ к боевому обучению и технике начальных уровней</text>
				<text xml:lang="en">You will receive access to Battle Training and vehicles of starting tiers</text>
				<text xml:lang="be">Вы атрымаеце доступ да баявога навучання і тэхнікі пачатковых узроўняў</text>
			</item>
			<item id="SD__CLIENT__INFO_AFTER_INSTALL_TITLE">
				<text xml:lang="en-ZW">Start Playing!</text>
				<text xml:lang="ru">Начинайте играть!</text>
				<text xml:lang="en">Start Playing!</text>
				<text xml:lang="be">Пачынайце гуляць!</text>
			</item>
			<item id="SD__CLIENT__INFO_AFTER_INSTALL_TEXT">
				<text xml:lang="en-ZW">You now have access to Battle Training and vehicles of starting tiers</text>
				<text xml:lang="ru">У вас уже есть доступ к боевому обучению и технике начальных уровней</text>
				<text xml:lang="en">You now have access to Battle Training and vehicles of starting tiers</text>
				<text xml:lang="be">Вы ўжо маеце доступ да баявога навучання і тэхнікі пачатковых узроўняў</text>
			</item>
			<item id="HD__NAME">
				<text xml:lang="en-ZW">HD Client</text>
				<text xml:lang="ru">HD клиент</text>
				<text xml:lang="en">HD Client</text>
				<text xml:lang="be">HD-кліент</text>
			</item>
			<item id="HD__SHORT_NAME">
				<text xml:lang="en-ZW">HD</text>
				<text xml:lang="ru">HD</text>
				<text xml:lang="en">HD</text>
				<text xml:lang="be">HD</text>
			</item>
			<item id="HD__DESCRIPTION">
				<text xml:lang="en-ZW">Full game including maximum-quality textures. Requires more space on the hard drive than the Standard (SD) Client.</text>
				<text xml:lang="ru">Полная версия игры, включая текстуры максимального разрешения. Занимает больше места на жёстком диске, чем стандартный клиент (SD).</text>
				<text xml:lang="en">Full game including maximum-quality textures. Requires more space on the hard drive than the Standard (SD) Client.</text>
				<text xml:lang="be">Поўная версія гульні з тэкстурамі высокай разрознасці. Займае больш месца на цвёрдым дыску.</text>
			</item>
			<item id="HD__CLIENT__TITLE">
				<text xml:lang="en-ZW">Mini Client</text>
				<text xml:lang="ru">Мини-клиент</text>
				<text xml:lang="en">Mini Client</text>
				<text xml:lang="be">Міні-кліент</text>
			</item>
			<item id="HD__CLIENT__INFO_BEFORE_INSTALL_TEXT">
				<text xml:lang="en-ZW">You will receive access to Battle Training and vehicles of starting tiers</text>
				<text xml:lang="ru">Вы получите доступ к боевому обучению и технике начальных уровней</text>
				<text xml:lang="en">You will receive access to Battle Training and vehicles of starting tiers</text>
				<text xml:lang="be">Вы атрымаеце доступ да баявога навучання і тэхнікі пачатковых узроўняў</text>
			</item>
			<item id="HD__CLIENT__INFO_AFTER_INSTALL_TITLE">
				<text xml:lang="en-ZW">Start Playing!</text>
				<text xml:lang="ru">Начинайте играть!</text>
				<text xml:lang="en">Start Playing!</text>
				<text xml:lang="be">Пачынайце гуляць!</text>
			</item>
			<item id="HD__CLIENT__INFO_AFTER_INSTALL_TEXT">
				<text xml:lang="en-ZW">You now have access to Battle Training and vehicles of starting tiers</text>
				<text xml:lang="ru">У вас уже есть доступ к боевому обучению и технике начальных уровней</text>
				<text xml:lang="en">You now have access to Battle Training and vehicles of starting tiers</text>
				<text xml:lang="be">Вы ўжо маеце доступ да баявога навучання і тэхнікі пачатковых узроўняў</text>
			</item>
			<item id="HD__SDCONTENT__TITLE">
				<text xml:lang="en-ZW">Standard Client</text>
				<text xml:lang="ru">Стандартный клиент</text>
				<text xml:lang="en">Standard Client</text>
				<text xml:lang="be">Звычайны кліент</text>
			</item>
			<item id="HD__SDCONTENT__INFO_BEFORE_INSTALL_TEXT">
				<text xml:lang="en-ZW">You will receive access to the full game without maximum-quality textures</text>
				<text xml:lang="ru">Вы получите доступ к полной версии игры, за исключением текстур максимального разрешения</text>
				<text xml:lang="en">You will receive access to the full game without maximum-quality textures</text>
				<text xml:lang="be">Вы атрымаеце доступ да поўнай версіі гульні, толькі без тэкстур высокай разрознасці</text>
			</item>
			<item id="HD__SDCONTENT__INFO_AFTER_INSTALL_TITLE">
				<text xml:lang="en-ZW">Start Playing!</text>
				<text xml:lang="ru">Начинайте играть!</text>
				<text xml:lang="en">Start Playing!</text>
				<text xml:lang="be">Пачынайце гуляць!</text>
			</item>
			<item id="HD__SDCONTENT__INFO_AFTER_INSTALL_TEXT">
				<text xml:lang="en-ZW">You now have access to the full game without maximum-quality textures</text>
				<text xml:lang="ru">У вас уже есть доступ к полной версии игры, за исключением текстур максимального разрешения</text>
				<text xml:lang="en">You now have access to the full game without maximum-quality textures</text>
				<text xml:lang="be">Вы ўжо маеце доступ да поўнай версіі гульні, толькі без тэкстур высокай разрознасці</text>
			</item>
			<item id="LAUNCH_OPTION_TITLE__SAFE_MODE">
				<text xml:lang="en-ZW">Launch the game in safe mode</text>
				<text xml:lang="ru">Запуск игры без модификаций</text>
				<text xml:lang="en">Launch the game in safe mode</text>
				<text xml:lang="be">Запуск гульні без мадыфікацый</text>
			</item>
			<item id="LAUNCH_OPTION_DESCRIPTION__SAFE_MODE">
				<text xml:lang="en-ZW">Any installed game client modifications will be ignored.</text>
				<text xml:lang="ru">Игра запустится без установленных модификаций клиента.</text>
				<text xml:lang="en">Any installed game client modifications will be ignored.</text>
				<text xml:lang="be">Гульня запусціцца без усталяваных мадыфікацый кліента.</text>
			</item>
			<item id="LAUNCH_OPTION_TITLE__RESET_GRAPHICS">
				<text xml:lang="en-ZW">Launch the game with default graphics settings</text>
				<text xml:lang="ru">Запуск игры с графическими настройками по умолчанию</text>
				<text xml:lang="en">Launch the game with default graphics settings</text>
				<text xml:lang="be">Запуск гульні з перадвызначанымі графічнымі наладамі</text>
			</item>
			<item id="LAUNCH_OPTION_DESCRIPTION__RESET_GRAPHICS">
				<text xml:lang="en-ZW">All graphics settings will be reset to default.</text>
				<text xml:lang="ru">При запуске игры будут использованы графические настройки по умолчанию.</text>
				<text xml:lang="en">All graphics settings will be reset to default.</text>
				<text xml:lang="be">Пры запуску гульні будуць выкарыстаны перадвызначаныя графічныя налады.</text>
			</item>
			<item id="LAUNCH_OPTION_TITLE__FORCE_32BIT">
				<text xml:lang="en-ZW">Launching x86 game client</text>
				<text xml:lang="ru">Запуск x86 клиента игры</text>
				<text xml:lang="en">Launching x86 game client</text>
				<text xml:lang="be">Запуск x86 кліента гульні</text>
			</item>
			<item id="LAUNCH_OPTION_DESCRIPTION__FORCE_32BIT">
				<text xml:lang="en-ZW">32-bit version of the game client will be launched.</text>
				<text xml:lang="ru">Запустится 32-битная версия клиента игры.</text>
				<text xml:lang="en">32-bit version of the game client will be launched.</text>
				<text xml:lang="be">Запусціцца 32-бітная версія кліента гульні.</text>
			</item>
		</localization>
	</predefined_section>

    <generated_section>
        
            <launch_forbidden>False</launch_forbidden>
        
            <stop_supporting>False</stop_supporting>
        
    </generated_section>
</protocol>
```

## Настройка Lesta Game Center для скачивания Мира танков

В папке Program Files (x86)/Lesta/GameCenter удаляем **preferences.xml.bak**

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/20.jpg">

В той же папке откройте файл **preferences.xml**

Нужно изменить раздел **games_manager**. Вот его изначальный вид
```text
        <games_manager>
            <games/>
            <game_update_interval>7200000</game_update_interval>
            <content_update_interval>1800000</content_update_interval>
            <start_auto_import>false</start_auto_import>
            <selectedGames/>
            <update_check_threshold>600000</update_check_threshold>
            <background_installation>true</background_installation>
            <schedule>
                <slots period="9">[0;24]</slots>
            </schedule>
        </games_manager>
```

Замените его на это
```text
        <games_manager>
            <games>
                <game>
                    <working_dir>C:\Games\Tanki</working_dir>
                    <auto_update>true</auto_update>
                </game>
            </games>
            <default_install_path>C:\Games</default_install_path>
            <game_update_interval>7200000</game_update_interval>
            <content_update_interval>1800000</content_update_interval>
            <start_auto_import>false</start_auto_import>
            <current_game>C:\Games\Tanki</current_game>
            <active_game>C:\Games\Tanki</active_game>
            <selectedGames>
                <WOT>C:\Games\Tanki</WOT>
            </selectedGames>
            <update_check_threshold>600000</update_check_threshold>
            <background_installation>true</background_installation>
            <schedule>
                <slots period="9">[0;24]</slots>
            </schedule>
        </games_manager>
```

Вернитесь в папку Contents и откройте Wineskin

В открывшемся окне кликните по Advanced

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/7.jpg">

В поле **Windows app** введите это (с кавычками)
```text
"C:\Games\Tanki\Tanki.exe" 
```
<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/11.jpg">


Нажмите нижний **Browse** и выберите иконку Мира танков
<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/12.jpg">

Откройте вкладку **Tools** и нажмите кнопку **Custom EXE Creator**

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/8.jpg">

В поле **Name to use** введите **LGC**.

В поле **Windows EXE** вставьте это (с кавычками)
```text
"C:\Program Files (x86)/Lesta/GameCenter/lgc.exe" 
```

Нажмите **Save**

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/9.jpg">

У вас появится файл LGC, это исполняемый файл для установки и обновления через Lesta Game Center

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/10.jpg">

Чтобы у LGC была соответствующая иконка, кликните правой кнопкой мыши по LGC и выберете **Показать содержимое пакета**

Скопируйте **LGC.icns** и переименуйте в **Wineskin.icns** с заменой в папку **Resources** как показано на скриншоте

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/21.jpg">

Чтобы он стал исполняем вне враппера необходимо сделать на него ссылку следующей командой в **Терминале**

```text
ln -s /Applications/Tanki.app/Contents/LGC.app /Applications/LGC.app
```

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/13.jpg">


Теперь у вас в программах появился LGC

Для начала процесса скачивания Мира танков запустите LGC и дождитесь его окончания

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/0.jpg">

В лаунчере и в программах иконки могут отображаться не верно, но это исправится после перезагрузки

После скачивания закройте Lesta Game Center и запустите Tanki
