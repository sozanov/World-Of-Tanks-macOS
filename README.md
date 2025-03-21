# The main repository with the idea:
https://github.com/gmaxus/Mir-tankov-macOS
[Original russian version for Lesta](README_RU.md)

In turn, I translated the guide and prepared a version for the World Of Tanks EU region (Screenshots are original).


# How to Play World Of Tanks on macOS
World Of Tanks works great on macOS without Windows, using Wine-based emulators such as [Crossover](https://www.codeweavers.com/crossover) or [Whiskey](https://getwhisky.app/). Unfortunately, [Wargaming Game Center](https://redirect.wargaming.net/WGC/Wargaming_Game_Center_Install_EU.exe) (WGC), which downloads and updates World Of Tanks, does not function properly on emulators.

This build:

* No virtual Windows
* Can download and install World Of Tanks updates
* No issues with rotating tracks
* The store displays correctly without distortions
* No problems with altered colors
* By default, the SD client is downloaded
* Occupies about 55 GB

## Installation

* [Download](https://github.com/sozanov/World-Of-Tanks-macOS/raw/refs/heads/main/WorldOfTanks.zip)
* Unzip the archive
* Move **World Of Tanks** and **WGC** into the **Applications** folder

Run the following command in the **Terminal**
```text
xattr -r -c /Applications/WorldOfTanks.app
```

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/22.jpg">

Launch WGC – the download will begin

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/0.jpg">

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/1.jpg">

After the download completes, you will see the following

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/2.jpg">

Close Wargaming Game Center

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/3.jpg">

Launch WorldOfTanks.app

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/4.jpg">

You are awesome!

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/5.jpg">

# Updates

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/6.jpg">

If you see that World Of Tanks is reporting that an update is required, then launch WGC (World Of Tanks must be closed at this point) and it will download and install all updates automatically.

After the updates are installed, close Wargaming Game Center and only then launch World Of Tanks.

# Improvements

To display the store correctly, disable hardware acceleration in your browser.

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/shop-fix.jpg">

If you experience audio stuttering, it can be fixed by enabling the Low Quality option in the sound settings. I don’t have this issue, but it occurs on Crossover.

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/sound-fix.jpg">

# Manual Wineskin Creation Method

* A Wineskin is created with a configuration to download the game client
* WGC downloads the game client
* After downloading, the game can be launched
* Updates are performed through launching WGC

## Installing Homebrew
Homebrew is a package manager that will allow you to install Wineskin.
```text
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
```
## Installing Wineskin
```text
brew install --cask --no-quarantine The-Project/wineskin/wineskin
```

## Creating a Wineskin Wrapper
Launch Wineskin Winery and click the **+** button to add a Wine engine version.

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/14.jpg">

Select **WS12WineWhiskey-2.3.2** and click **Download and install**.

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/15.jpg">

Click **Create New Blank Wrapper**, enter **WorldOfTanks** in the popup window and click **OK**.

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/16.jpg">

Wineskin will create a wrapper with the name you entered and it will be located at ~/Applications/Wineskin.

Move the created wrapper to the Applications folder.

## Installing Wargaming Game Center
Download WGC (https://redirect.wargaming.net/WGC/Wargaming_Game_Center_Install_EU.exe).

Launch the created wrapper and click the top option **Install Software**; in the next window click **Choose Setup Executable**, then select the downloaded WGC installer.

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/17.jpg">

After installation, the WGC icon will appear in the Dock – right-click on it and select **Quit**.

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/3.jpg">

## Configuring Wargaming Game Center
Open the contents of the created wrapper by right-clicking on it and selecting **Show Package Contents**.

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/18.jpg">

Open the **Contents** folder, then **drive_c**.

Create a folder named **Games**, inside it create a folder **World_of_Tanks_EU**, and inside the World_of_Tanks_EU folder create a folder **game_metadata**.

Create 2 files in the World_of_Tanks_EU folder:
* **app_type.xml**
* **game_info.xml**

Inside the **game_metadata** folder, create:
* **metadata.xml**

As shown in the screenshot:

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/19.jpg">

Copy the following into **app_type.xml**
```text
<?xml version="1.0" encoding="UTF-8"?>
<protocol name="app_type" version="3.0">
 <app_type>incomplete</app_type>
 <switch_to_type>sd</switch_to_type>
</protocol>
```

Copy the following into **game_info.xml**
```text
<?xml version="1.0" encoding="utf-8"?>
<protocol name="game_info" version="2.16" wgc_publisher_id="wargaming">
    <game>
        <id>WOT.EU.PRODUCTION</id>
        <index>0</index>
        <installed>false</installed>
        <localization>EN</localization>
        <content_localizations>
            <content_localization realm="eu">en</content_localization>
        </content_localizations>
        <client_type>sd</client_type>
        <show_guide>false</show_guide>
        <update_urls>
            <value>wgus-woteu.wargaming.net/</value>
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
        <available_content_languages>
            <language_id>cs</language_id>
            <language_id>de</language_id>
            <language_id>en</language_id>
            <language_id>es</language_id>
            <language_id>fr</language_id>
            <language_id>hu</language_id>
            <language_id>it</language_id>
            <language_id>pl</language_id>
            <language_id>ru</language_id>
            <language_id>tr</language_id>
            <language_id>uk</language_id>
        </available_content_languages>
    </game>
</protocol>
```

Copy the following into **metadata.xml**
```text
<protocol name="app_metadata" version="7.2" wgc_publisher_id="wargaming,steam">
	<version>20250122074514</version>
	<predefined_section>
		<app_id>WOT.EU.PRODUCTION</app_id>
		<chain_id>sd3_hd3</chain_id>
		<supported_languages>BG,CS,DA,DE,EL,EN,ES,ET,FI,FR,HR,HU,IT,LT,LV,NL,NO,PL,PT,RO,SR,SV,TR,RU,UK,KK</supported_languages>
		<default_language>EN</default_language>
		<name>World of Tanks</name>
		<fs_name>World_of_Tanks_EU</fs_name>
		<shortcut_name>World_of_Tanks_EU</shortcut_name>
		<executables>
			<executable>WorldOfTanks.exe</executable>
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
				<instance default="true" id="wot_eu">
					<platform_realm_id>eu</platform_realm_id>
					<game_id>wot</game_id>
					<title_id>eu.wot</title_id>
					<content_service_url>http://wguscs-woteu.wargaming.net/</content_service_url>
					<features>
						<feature enabled="true" id="game_pages_targeting" />
						<feature enabled="true" id="buy_game_items" />
					</features>
					<common_commerce_agreements>
						<agreement id="eu_eula" />
					</common_commerce_agreements>
				</instance>
			</instances>
		</realms_settings>
		<localization>
			<item id="ENVIRONMENT_NAME__ASIA">
				<text xml:lang="en-ZW">Asia</text>
				<text xml:lang="ru">Азия</text>
				<text xml:lang="en">Asia</text>
				<text xml:lang="de">Asien</text>
				<text xml:lang="pl">Azja</text>
				<text xml:lang="cs">Asie</text>
				<text xml:lang="fr">Asie</text>
				<text xml:lang="es">Asia</text>
				<text xml:lang="it">Asia</text>
				<text xml:lang="lv">Āzija</text>
				<text xml:lang="pt">Ásia</text>
				<text xml:lang="sr">Azija</text>
				<text xml:lang="pt-BR">Ásia</text>
				<text xml:lang="hu">Ázsia</text>
				<text xml:lang="hr">Azija</text>
				<text xml:lang="fi">Aasia</text>
				<text xml:lang="da">Asien</text>
				<text xml:lang="nl">Azië</text>
				<text xml:lang="ro">Asia</text>
				<text xml:lang="tr">Asya</text>
				<text xml:lang="sv">Asien</text>
				<text xml:lang="ja">アジア</text>
				<text xml:lang="ko">아시아</text>
				<text xml:lang="lt">Azija</text>
				<text xml:lang="et">Aasia</text>
				<text xml:lang="bg">Азия</text>
				<text xml:lang="id">Asia</text>
				<text xml:lang="zh-TW">亞洲</text>
				<text xml:lang="zh-CN">亚服</text>
				<text xml:lang="vi">Châu Á</text>
				<text xml:lang="th">เอเชีย</text>
				<text xml:lang="no">Asia</text>
				<text xml:lang="es-AR">Asia</text>
				<text xml:lang="el">Ασία</text>
				<text xml:lang="zh-SG">亚洲</text>
				<text xml:lang="es-MX">Asia</text>
				<text xml:lang="be">Азія</text>
				<text xml:lang="uk">Азія</text>
				<text xml:lang="kk">Азия</text>
			</item>
			<item id="ENVIRONMENT_NAME__EU">
				<text xml:lang="en-ZW">Europe</text>
				<text xml:lang="ru">Европа</text>
				<text xml:lang="en">Europe</text>
				<text xml:lang="de">Europa</text>
				<text xml:lang="pl">Europa</text>
				<text xml:lang="cs">Evropa</text>
				<text xml:lang="fr">Europe</text>
				<text xml:lang="es">Europa</text>
				<text xml:lang="it">Europa</text>
				<text xml:lang="lv">Eiropa</text>
				<text xml:lang="pt">Europa</text>
				<text xml:lang="sr">Evropa</text>
				<text xml:lang="pt-BR">Europa</text>
				<text xml:lang="hu">Európa</text>
				<text xml:lang="hr">Europa</text>
				<text xml:lang="fi">Eurooppa</text>
				<text xml:lang="da">Europa</text>
				<text xml:lang="nl">Europa</text>
				<text xml:lang="ro">Europa</text>
				<text xml:lang="tr">Avrupa</text>
				<text xml:lang="sv">Europa</text>
				<text xml:lang="ja">ヨーロッパ</text>
				<text xml:lang="ko">유럽</text>
				<text xml:lang="lt">Europa</text>
				<text xml:lang="et">Euroopa</text>
				<text xml:lang="bg">Европа</text>
				<text xml:lang="id">Eropa</text>
				<text xml:lang="zh-TW">歐洲</text>
				<text xml:lang="zh-CN">欧服</text>
				<text xml:lang="vi">Châu Âu</text>
				<text xml:lang="th">ยุโรป</text>
				<text xml:lang="no">Europa</text>
				<text xml:lang="es-AR">Europa</text>
				<text xml:lang="el">Ευρώπη</text>
				<text xml:lang="zh-SG">欧洲</text>
				<text xml:lang="es-MX">Europa</text>
				<text xml:lang="be">Еўропа</text>
				<text xml:lang="uk">Європа</text>
				<text xml:lang="kk">Еуропа</text>
			</item>
			<item id="ENVIRONMENT_NAME__EU2">
				<text xml:lang="en-ZW">Europe2</text>
				<text xml:lang="ru">Европа 2</text>
				<text xml:lang="en">Europe 2</text>
				<text xml:lang="de">Europa 2</text>
				<text xml:lang="pl">Europa 2</text>
				<text xml:lang="cs">Evropa 2</text>
				<text xml:lang="fr">Europe 2</text>
				<text xml:lang="es">Europa 2</text>
				<text xml:lang="it">Europa 2</text>
				<text xml:lang="lv">Eiropa 2</text>
				<text xml:lang="pt">Europa 2</text>
				<text xml:lang="sr">Evropa 2</text>
				<text xml:lang="pt-BR">Europa 2</text>
				<text xml:lang="hu">Európa 2</text>
				<text xml:lang="hr">Europa 2</text>
				<text xml:lang="fi">Eurooppa 2</text>
				<text xml:lang="da">Europa 2</text>
				<text xml:lang="nl">Europa 2</text>
				<text xml:lang="ro">Europa 2</text>
				<text xml:lang="tr">Avrupa 2</text>
				<text xml:lang="sv">Europa 2</text>
				<text xml:lang="ja">ヨーロッパ2</text>
				<text xml:lang="ko">유럽 2</text>
				<text xml:lang="lt">Europa 2</text>
				<text xml:lang="et">Euroopa 2</text>
				<text xml:lang="bg">Европа 2</text>
				<text xml:lang="id">Eropa 2</text>
				<text xml:lang="zh-TW">歐洲2</text>
				<text xml:lang="zh-CN">欧服2</text>
				<text xml:lang="vi">Châu Âu 2</text>
				<text xml:lang="th">ยุโรป 2</text>
				<text xml:lang="no">Europa 2</text>
				<text xml:lang="es-AR">Europa 2</text>
				<text xml:lang="el">Ευρώπη 2</text>
				<text xml:lang="zh-SG">欧洲2</text>
				<text xml:lang="es-MX">Europa 2</text>
				<text xml:lang="be">Еўропа 2</text>
				<text xml:lang="uk">Європа 2</text>
				<text xml:lang="kk">Еуропа 2</text>
			</item>
			<item id="ENVIRONMENT_NAME__NA">
				<text xml:lang="en-ZW">North America</text>
				<text xml:lang="ru">Северная Америка</text>
				<text xml:lang="en">North America</text>
				<text xml:lang="de">Nordamerika</text>
				<text xml:lang="pl">Ameryka Północna</text>
				<text xml:lang="cs">Severní Amerika</text>
				<text xml:lang="fr">Amérique du Nord</text>
				<text xml:lang="es">Norteamérica</text>
				<text xml:lang="it">Nord America</text>
				<text xml:lang="lv">Ziemeļamerika</text>
				<text xml:lang="pt">América do Norte</text>
				<text xml:lang="sr">Severna Amerika</text>
				<text xml:lang="pt-BR">América do Norte</text>
				<text xml:lang="hu">Észak-Amerika</text>
				<text xml:lang="hr">Sjeverna Amerika</text>
				<text xml:lang="fi">Pohjois-Amerikka</text>
				<text xml:lang="da">Nordamerika</text>
				<text xml:lang="nl">Noord-Amerika</text>
				<text xml:lang="ro">America de Nord</text>
				<text xml:lang="tr">Kuzey Amerika</text>
				<text xml:lang="sv">Nordamerika</text>
				<text xml:lang="ja">北アメリカ</text>
				<text xml:lang="ko">북미</text>
				<text xml:lang="lt">Šiaurės Amerika</text>
				<text xml:lang="et">Põhja-Ameerika</text>
				<text xml:lang="bg">Северна Америка</text>
				<text xml:lang="id">Amerika Utara</text>
				<text xml:lang="zh-TW">北美</text>
				<text xml:lang="zh-CN">美服</text>
				<text xml:lang="vi">Bắc Mỹ</text>
				<text xml:lang="th">อเมริกาเหนือ</text>
				<text xml:lang="no">Nordamerika</text>
				<text xml:lang="es-AR">América del Norte</text>
				<text xml:lang="el">Βόρεια Αμερική</text>
				<text xml:lang="zh-SG">北美</text>
				<text xml:lang="es-MX">Norteamérica</text>
				<text xml:lang="be">Паўночная Амерыка</text>
				<text xml:lang="uk">Північна Америка</text>
				<text xml:lang="kk">Солтүстік Америка</text>
			</item>
			<item id="ENVIRONMENT_NAME__CIS">
				<text xml:lang="en-ZW">CIS</text>
				<text xml:lang="ru">СНГ</text>
				<text xml:lang="en">CIS</text>
				<text xml:lang="de">CIS</text>
				<text xml:lang="pl">CIS</text>
				<text xml:lang="cs">CIS</text>
				<text xml:lang="fr">CIS</text>
				<text xml:lang="es">CIS</text>
				<text xml:lang="it">CIS</text>
				<text xml:lang="lv">CIS</text>
				<text xml:lang="pt">CIS</text>
				<text xml:lang="sr">CIS</text>
				<text xml:lang="pt-BR">CIS</text>
				<text xml:lang="hu">CIS</text>
				<text xml:lang="hr">CIS</text>
				<text xml:lang="fi">CIS</text>
				<text xml:lang="da">CIS</text>
				<text xml:lang="nl">CIS</text>
				<text xml:lang="ro">CIS</text>
				<text xml:lang="tr">CIS</text>
				<text xml:lang="sv">CIS</text>
				<text xml:lang="ja">CIS</text>
				<text xml:lang="ko">CIS</text>
				<text xml:lang="lt">CIS</text>
				<text xml:lang="et">CIS</text>
				<text xml:lang="bg">CIS</text>
				<text xml:lang="id">CIS</text>
				<text xml:lang="zh-TW">CIS</text>
				<text xml:lang="zh-CN">CIS</text>
				<text xml:lang="vi">CIS</text>
				<text xml:lang="th">CIS</text>
				<text xml:lang="no">CIS</text>
				<text xml:lang="es-AR">CIS</text>
				<text xml:lang="el">CIS</text>
				<text xml:lang="zh-SG">CIS</text>
				<text xml:lang="es-MX">CIS</text>
				<text xml:lang="be">СНД</text>
				<text xml:lang="uk">СНД</text>
				<text xml:lang="kk">ТМД</text>
			</item>
			<item id="ENVIRONMENT_NAME__CN">
				<text xml:lang="en-ZW">China</text>
				<text xml:lang="ru">Китай</text>
				<text xml:lang="en">China</text>
				<text xml:lang="de">China</text>
				<text xml:lang="pl">Chiny</text>
				<text xml:lang="cs">Čína</text>
				<text xml:lang="fr">Chine</text>
				<text xml:lang="es">China</text>
				<text xml:lang="it">Cina</text>
				<text xml:lang="lv">Ķīna</text>
				<text xml:lang="pt">China</text>
				<text xml:lang="sr">Kina</text>
				<text xml:lang="pt-BR">China</text>
				<text xml:lang="hu">Kína</text>
				<text xml:lang="hr">Kina</text>
				<text xml:lang="fi">Kiina</text>
				<text xml:lang="da">Kina</text>
				<text xml:lang="nl">China</text>
				<text xml:lang="ro">China</text>
				<text xml:lang="tr">Çin</text>
				<text xml:lang="sv">Kina</text>
				<text xml:lang="ja">中国</text>
				<text xml:lang="ko">중국</text>
				<text xml:lang="lt">Kinija</text>
				<text xml:lang="et">Hiina</text>
				<text xml:lang="bg">Китай</text>
				<text xml:lang="id">China</text>
				<text xml:lang="zh-TW">中國</text>
				<text xml:lang="zh-CN">中国大区</text>
				<text xml:lang="vi">Trung Quốc</text>
				<text xml:lang="th">จีน</text>
				<text xml:lang="no">Kina</text>
				<text xml:lang="es-AR">China</text>
				<text xml:lang="el">Κίνα</text>
				<text xml:lang="zh-SG">中国</text>
				<text xml:lang="es-MX">China</text>
				<text xml:lang="be">Кітай</text>
				<text xml:lang="uk">Китай</text>
				<text xml:lang="kk">Қытай</text>
			</item>
			<item id="ENVIRONMENT_NAME__CNGA">
				<text xml:lang="en-ZW">GA</text>
				<text xml:lang="ru">ОП</text>
				<text xml:lang="en">GA</text>
				<text xml:lang="de">Genehmigung durch die Regierung</text>
				<text xml:lang="pl">Zatwierdzone przez rząd</text>
				<text xml:lang="cs">Vládní souhlas</text>
				<text xml:lang="fr">Approbation du gouvernement</text>
				<text xml:lang="es">Aprobación del Gobierno</text>
				<text xml:lang="it">Approvazione governativa</text>
				<text xml:lang="lv">GA</text>
				<text xml:lang="pt">AG</text>
				<text xml:lang="sr">GA</text>
				<text xml:lang="pt-BR">Aprovação Governamental</text>
				<text xml:lang="hu">KJ</text>
				<text xml:lang="hr">Dopuštenje vlade</text>
				<text xml:lang="fi">Hallituksen lupa</text>
				<text xml:lang="da">GA</text>
				<text xml:lang="nl">Overheidsgoedkeuring</text>
				<text xml:lang="ro">AG</text>
				<text xml:lang="tr">DO</text>
				<text xml:lang="sv">Tillstånd</text>
				<text xml:lang="ja">政府認可</text>
				<text xml:lang="ko">정부 승인</text>
				<text xml:lang="lt">GA</text>
				<text xml:lang="et">GA</text>
				<text xml:lang="bg">ОП</text>
				<text xml:lang="id">GA</text>
				<text xml:lang="zh-TW">政府許可</text>
				<text xml:lang="zh-CN">测试服</text>
				<text xml:lang="vi">Chính quyền Cho phép</text>
				<text xml:lang="th">การอนุมัติจากรัฐบาล</text>
				<text xml:lang="no">MG</text>
				<text xml:lang="es-AR">AG</text>
				<text xml:lang="el">GA</text>
				<text xml:lang="zh-SG">GA</text>
				<text xml:lang="es-MX">GA</text>
				<text xml:lang="be">АУ</text>
				<text xml:lang="uk">СУ</text>
				<text xml:lang="kk">Үкімет қолдауы</text>
			</item>
			<item id="ENVIRONMENT_NAME__CT">
				<text xml:lang="en-ZW">Common Test</text>
				<text xml:lang="ru">Общий тест</text>
				<text xml:lang="en">Common Test</text>
				<text xml:lang="de">Öffentlicher Test</text>
				<text xml:lang="pl">Test publiczny</text>
				<text xml:lang="cs">Společný test</text>
				<text xml:lang="fr">Test public</text>
				<text xml:lang="es">Prueba pública</text>
				<text xml:lang="it">Common Test</text>
				<text xml:lang="lv">Parasts tests</text>
				<text xml:lang="pt">Teste Comum</text>
				<text xml:lang="sr">Zajednički Test</text>
				<text xml:lang="pt-BR">Teste Comum</text>
				<text xml:lang="hu">Nyílt teszt</text>
				<text xml:lang="hr">Zajednički test</text>
				<text xml:lang="fi">Julkinen testi</text>
				<text xml:lang="da">Common Test</text>
				<text xml:lang="nl">Gewone test</text>
				<text xml:lang="ro">Test Public</text>
				<text xml:lang="tr">Ortak Test</text>
				<text xml:lang="sv">Allmänt test</text>
				<text xml:lang="ja">公開テスト</text>
				<text xml:lang="ko">공개 테스트</text>
				<text xml:lang="lt">Bendras testas</text>
				<text xml:lang="et">Common Test</text>
				<text xml:lang="bg">Общ тест</text>
				<text xml:lang="id">Common Test</text>
				<text xml:lang="zh-TW">公開測試</text>
				<text xml:lang="zh-CN">CT测试</text>
				<text xml:lang="vi">Common Test</text>
				<text xml:lang="th">การทดสอบทั่วไป</text>
				<text xml:lang="no">Fellestest</text>
				<text xml:lang="es-AR">Prueba común</text>
				<text xml:lang="el">Common Test</text>
				<text xml:lang="zh-SG">公开测试</text>
				<text xml:lang="es-MX">Prueba Común</text>
				<text xml:lang="be">Агульнае тэставанне</text>
				<text xml:lang="uk">Загальне тестування</text>
				<text xml:lang="kk">Ортақ тест</text>
			</item>
			<item id="ENVIRONMENT_NAME__SB">
				<text xml:lang="en-ZW">Sandbox</text>
				<text xml:lang="ru">Песочница</text>
				<text xml:lang="en">Sandbox</text>
				<text xml:lang="de">Sandbox</text>
				<text xml:lang="pl">Piaskownica</text>
				<text xml:lang="cs">Sandbox</text>
				<text xml:lang="fr">Sandbox</text>
				<text xml:lang="es">Sandbox</text>
				<text xml:lang="it">Sandbox</text>
				<text xml:lang="lv">Smilškaste</text>
				<text xml:lang="pt">Sandbox</text>
				<text xml:lang="sr">Sendboks</text>
				<text xml:lang="pt-BR">Sandbox</text>
				<text xml:lang="hu">Homokozó</text>
				<text xml:lang="hr">Pješčanik</text>
				<text xml:lang="fi">Hiekkalaatikko</text>
				<text xml:lang="da">Sandbox</text>
				<text xml:lang="nl">Sandbox</text>
				<text xml:lang="ro">Sandbox</text>
				<text xml:lang="tr">Sandbox</text>
				<text xml:lang="sv">Sandlåda</text>
				<text xml:lang="ja">サンドボックス</text>
				<text xml:lang="ko">샌드박스</text>
				<text xml:lang="lt">Smėlio dėžė</text>
				<text xml:lang="et">Sandbox</text>
				<text xml:lang="bg">Пясъчник</text>
				<text xml:lang="id">Sandbox</text>
				<text xml:lang="zh-TW">沙盒</text>
				<text xml:lang="zh-CN">沙盒</text>
				<text xml:lang="vi">Sandbox</text>
				<text xml:lang="th">สภาวะทดสอบ</text>
				<text xml:lang="no">Sandkasse</text>
				<text xml:lang="es-AR">Sandbox</text>
				<text xml:lang="el">Sandbox</text>
				<text xml:lang="zh-SG">沙盒</text>
				<text xml:lang="es-MX">Entorno de Pruebas</text>
				<text xml:lang="be">Пясочніца</text>
				<text xml:lang="uk">Пісочниця</text>
				<text xml:lang="kk">Құмсағат</text>
			</item>
			<item id="ENVIRONMENT_NAME__SB_CUSTOM">
				<text xml:lang="en-ZW">New Balance Test</text>
				<text xml:lang="ru">Тест нового баланса</text>
				<text xml:lang="en">New Balance Test</text>
				<text xml:lang="de">Neuer Test der Balance</text>
				<text xml:lang="pl">Test nowego balansu</text>
				<text xml:lang="cs">Test nového vyvážení</text>
				<text xml:lang="fr">Nouveau test d'équilibrage</text>
				<text xml:lang="es">Pruebas del Nuevo equilibrio</text>
				<text xml:lang="it">Nuovo test di bilanciamento</text>
				<text xml:lang="lv">Jauns Balansa Tests</text>
				<text xml:lang="pt">Teste Novo Balanceamento</text>
				<text xml:lang="sr">Novi test balansa</text>
				<text xml:lang="pt-BR">Novo Teste de Balanceamento</text>
				<text xml:lang="hu">Új játékegyensúly teszt</text>
				<text xml:lang="hr">Novi balans test</text>
				<text xml:lang="fi">Uusi tasapainotesti</text>
				<text xml:lang="da">Ny balance-test</text>
				<text xml:lang="nl">Nieuwe balanstest</text>
				<text xml:lang="ro">Noul test de echilibrare</text>
				<text xml:lang="tr">Yeni Denge Testi</text>
				<text xml:lang="sv">Nytt balanstest</text>
				<text xml:lang="ja">新バランステスト</text>
				<text xml:lang="ko">새로운 균형 테스트</text>
				<text xml:lang="lt">Naujo balanso testas</text>
				<text xml:lang="et">Uue tasakaalu test</text>
				<text xml:lang="bg">Нов тест за баланс</text>
				<text xml:lang="id">Tes Keseimbangan Baru</text>
				<text xml:lang="zh-TW">全新平衡測試</text>
				<text xml:lang="zh-CN">新平衡测试</text>
				<text xml:lang="vi">Thử nghiệm Cân bằng Mới</text>
				<text xml:lang="th">การทดสอบสมดุลใหม่</text>
				<text xml:lang="no">Ny balansetest</text>
				<text xml:lang="es-AR">Nueva prueba de equilibrio</text>
				<text xml:lang="el">Νέο Τεστ Εξισορρόπησης</text>
				<text xml:lang="zh-SG">新平衡测试</text>
				<text xml:lang="es-MX">New Balance Test</text>
				<text xml:lang="be">Тэст новага балансу</text>
				<text xml:lang="uk">Тестування нового балансу</text>
				<text xml:lang="kk">Жаңа теңгерім тесті</text>
			</item>
			<item id="ENVIRONMENT_NAME__SB2">
				<text xml:lang="en-ZW">Sandbox 2</text>
				<text xml:lang="ru">Песочница 2</text>
				<text xml:lang="en">Sandbox 2</text>
				<text xml:lang="de">Sandbox 2</text>
				<text xml:lang="pl">Piaskownica 2</text>
				<text xml:lang="cs">Sandbox 2</text>
				<text xml:lang="fr">Sandbox 2</text>
				<text xml:lang="es">Sandbox 2</text>
				<text xml:lang="it">Sandbox 2</text>
				<text xml:lang="lv">Smilšukaste 2</text>
				<text xml:lang="pt">Sandbox 2</text>
				<text xml:lang="sr">Peščanik 2</text>
				<text xml:lang="pt-BR">Sandbox 2</text>
				<text xml:lang="hu">Homokozó 2</text>
				<text xml:lang="hr">Pješčanik 2</text>
				<text xml:lang="fi">Hiekkalaatikko 2</text>
				<text xml:lang="da">Sandbox 2</text>
				<text xml:lang="nl">Sandbox 2</text>
				<text xml:lang="ro">Sandbox 2</text>
				<text xml:lang="tr">Sandbox 2</text>
				<text xml:lang="sv">Sandlåda 2</text>
				<text xml:lang="ja">サンドボックス2</text>
				<text xml:lang="ko">샌드박스 2</text>
				<text xml:lang="lt">Smėlio dėžė 2</text>
				<text xml:lang="et">Liivakast 2</text>
				<text xml:lang="bg">Пясъчник 2</text>
				<text xml:lang="id">Sandbox 2</text>
				<text xml:lang="zh-TW">沙盒2</text>
				<text xml:lang="zh-CN">沙盒2</text>
				<text xml:lang="vi">Sandbox 2</text>
				<text xml:lang="th">สภาวะทดสอบ 2</text>
				<text xml:lang="no">Sandkasse 2</text>
				<text xml:lang="es-AR">Sandbox 2</text>
				<text xml:lang="el">Sandbox 2</text>
				<text xml:lang="zh-SG">沙盒2</text>
				<text xml:lang="es-MX">Sandbox 2</text>
				<text xml:lang="be">Пясочніца 2</text>
				<text xml:lang="uk">Пісочниця 2</text>
				<text xml:lang="kk">Құмсалғыш 2</text>
			</item>
			<item id="ENVIRONMENT_NAME__ST">
				<text xml:lang="en-ZW">Supertest</text>
				<text xml:lang="ru">Супертест</text>
				<text xml:lang="en">Supertest</text>
				<text xml:lang="de">Supertest</text>
				<text xml:lang="pl">Supertest</text>
				<text xml:lang="cs">Supertest</text>
				<text xml:lang="fr">Supertest</text>
				<text xml:lang="es">Supertest</text>
				<text xml:lang="it">Supertest</text>
				<text xml:lang="lv">Supertests</text>
				<text xml:lang="pt">Super Teste</text>
				<text xml:lang="sr">Supertest</text>
				<text xml:lang="pt-BR">Superteste</text>
				<text xml:lang="hu">Szuperteszt</text>
				<text xml:lang="hr">Supertest</text>
				<text xml:lang="fi">Supertesti</text>
				<text xml:lang="da">Supertest</text>
				<text xml:lang="nl">Supertest</text>
				<text xml:lang="ro">Supertest</text>
				<text xml:lang="tr">Süpertest</text>
				<text xml:lang="sv">Supertest</text>
				<text xml:lang="ja">スーパーテスト</text>
				<text xml:lang="ko">슈퍼 테스트</text>
				<text xml:lang="lt">Supertestas</text>
				<text xml:lang="et">Supertest</text>
				<text xml:lang="bg">Супертест</text>
				<text xml:lang="id">Supertest</text>
				<text xml:lang="zh-TW">超級測試</text>
				<text xml:lang="zh-CN">超测</text>
				<text xml:lang="vi">Supertest</text>
				<text xml:lang="th">การทดสอบยิ่งยวด</text>
				<text xml:lang="no">Supertest</text>
				<text xml:lang="es-AR">Súper prueba</text>
				<text xml:lang="el">Supertest</text>
				<text xml:lang="zh-SG">超级测试</text>
				<text xml:lang="es-MX">Supertest</text>
				<text xml:lang="be">Супертэставанне</text>
				<text xml:lang="uk">Супертестування</text>
				<text xml:lang="kk">Супертест</text>
			</item>
			<item id="SD__NAME">
				<text xml:lang="en-ZW">Standard (SD) Client.</text>
				<text xml:lang="ru">Стандартный клиент (SD)</text>
				<text xml:lang="en">Standard (SD) Client</text>
				<text xml:lang="de">Standard-Client (SD)</text>
				<text xml:lang="pl">Klient standardowy (SD)</text>
				<text xml:lang="cs">Standardní (SD) klient</text>
				<text xml:lang="fr">Client standard (SD)</text>
				<text xml:lang="es">Cliente estándar (SD)</text>
				<text xml:lang="it">Client Standard (SD)</text>
				<text xml:lang="lv">Standarta (SD) klients</text>
				<text xml:lang="pt">Cliente Standard (SD)</text>
				<text xml:lang="sr">Standardan (SD) klijent</text>
				<text xml:lang="pt-BR">Cliente Padrão (SD)</text>
				<text xml:lang="hu">Normál (SD) kliens</text>
				<text xml:lang="hr">Standardni (SD) klijent</text>
				<text xml:lang="fi">Normaali (SD) asiakasohjelma</text>
				<text xml:lang="da">Standard (SD) klient</text>
				<text xml:lang="nl">Standaard (SD) client</text>
				<text xml:lang="ro">Client standard (SD)</text>
				<text xml:lang="tr">Standart (SD) İstemci</text>
				<text xml:lang="sv">Standardklient (SD)</text>
				<text xml:lang="ja">標準 (SD) クライアント</text>
				<text xml:lang="ko">일반 (SD) 클라이언트</text>
				<text xml:lang="lt">Standartinis (SD) klientas</text>
				<text xml:lang="et">Standard (SD) klient</text>
				<text xml:lang="bg">Стандартен (SD) клиент</text>
				<text xml:lang="id">Client Standard (SD)</text>
				<text xml:lang="zh-TW">一般 (SD) 客戶端</text>
				<text xml:lang="zh-CN">标准(SD)客户端</text>
				<text xml:lang="vi">Phiên bản Client Chuẩn (SD)</text>
				<text xml:lang="th">โปรแกรมลูกข่ายมาตรฐาน (SD)</text>
				<text xml:lang="no">Standardklient (SD)</text>
				<text xml:lang="es-AR">Cliente estándar (SD)</text>
				<text xml:lang="el">Βασικός (SD) Client</text>
				<text xml:lang="zh-SG">标准（SD）客户端。</text>
				<text xml:lang="es-MX">Cliente Estándar (SD)</text>
				<text xml:lang="be">Звычайны кліент (SD)</text>
				<text xml:lang="uk">Стандартний клієнт гри (SD)</text>
				<text xml:lang="kk">Стандартты клиент (SD)</text>
			</item>
			<item id="SD__SHORT_NAME">
				<text xml:lang="en-ZW">SD</text>
				<text xml:lang="ru">SD</text>
				<text xml:lang="en">SD</text>
				<text xml:lang="de">SD</text>
				<text xml:lang="pl">SD</text>
				<text xml:lang="cs">SD</text>
				<text xml:lang="fr">SD</text>
				<text xml:lang="es">SD</text>
				<text xml:lang="it">SD</text>
				<text xml:lang="lv">SD</text>
				<text xml:lang="pt">SD</text>
				<text xml:lang="sr">SD</text>
				<text xml:lang="pt-BR">SD</text>
				<text xml:lang="hu">SD</text>
				<text xml:lang="hr">SD</text>
				<text xml:lang="fi">SD</text>
				<text xml:lang="da">SD</text>
				<text xml:lang="nl">SD</text>
				<text xml:lang="ro">SD</text>
				<text xml:lang="tr">SD</text>
				<text xml:lang="sv">SD</text>
				<text xml:lang="ja">SD</text>
				<text xml:lang="ko">SD</text>
				<text xml:lang="lt">SD</text>
				<text xml:lang="et">SD</text>
				<text xml:lang="bg">SD</text>
				<text xml:lang="id">SD</text>
				<text xml:lang="zh-TW">SD</text>
				<text xml:lang="zh-CN">SD</text>
				<text xml:lang="vi">SD</text>
				<text xml:lang="th">SD</text>
				<text xml:lang="no">SD</text>
				<text xml:lang="es-AR">SD</text>
				<text xml:lang="el">SD</text>
				<text xml:lang="zh-SG">SD</text>
				<text xml:lang="es-MX">SD</text>
				<text xml:lang="be">SD</text>
				<text xml:lang="uk">SD</text>
				<text xml:lang="kk">SD</text>
			</item>
			<item id="SD__DESCRIPTION">
				<text xml:lang="en-ZW">Full game without maximum-quality textures.</text>
				<text xml:lang="ru">Полная версия игры, за исключением текстур максимального разрешения.</text>
				<text xml:lang="en">Full game without maximum-quality textures.</text>
				<text xml:lang="de">Spiel ohne Texturen höchster Qualität.</text>
				<text xml:lang="pl">Pełna gra bez tekstur najwyższej jakości.</text>
				<text xml:lang="cs">Plná hra bez textur v maximální kvalitě.</text>
				<text xml:lang="fr">Jeu complet sans les textures de qualité maximale.</text>
				<text xml:lang="es">Juego completo sin texturas de máxima calidad.</text>
				<text xml:lang="it">Gioco completo senza texture in qualità massima.</text>
				<text xml:lang="lv">Pilna spēles versija bez maksimālas kvalitātes tekstūrām.</text>
				<text xml:lang="pt">Jogo completo sem texturas de qualidade máxima.</text>
				<text xml:lang="sr">Puna igra bez tekstura maksimalnog kvaliteta.</text>
				<text xml:lang="pt-BR">Jogo completo sem as texturas de qualidade máxima.</text>
				<text xml:lang="hu">Teljes játék a legjobb minőségű textúrák nélkül.</text>
				<text xml:lang="hr">Puna igra s teksturama najveće kvalitete.</text>
				<text xml:lang="fi">Täysi peli ilman maksimilaadun tekstuureja.</text>
				<text xml:lang="da">Fuldt spil uden teksturer af maksimal kvalitet.</text>
				<text xml:lang="nl">Volledige game zonder maximum kwaliteit textures.</text>
				<text xml:lang="ro">Joc complet, fără texturile de calitate maximă</text>
				<text xml:lang="tr">Maksimum kalitede kaplamalar olmadan tam oyun.</text>
				<text xml:lang="sv">Hela spelet utan högupplösta texturer.</text>
				<text xml:lang="ja">最高品質のテクスチャを除いたフル構成</text>
				<text xml:lang="ko">고품질 텍스쳐를 제외한 일반 클라이언트입니다.</text>
				<text xml:lang="lt">Pilna žaidimo versija be maksimalios kokybės tekstūrų.</text>
				<text xml:lang="et">Taielik mäng ilma maksimaalse kvaliteediga tekstuurideta.</text>
				<text xml:lang="bg">Цяла игра без текстури с максимално качество.</text>
				<text xml:lang="id">Full game tanpa tekstur kualitas maksimum.</text>
				<text xml:lang="zh-TW">沒有最高畫質貼圖的完整遊戲。</text>
				<text xml:lang="zh-CN">游戏完整但画面表现效果未开放到最大</text>
				<text xml:lang="vi">Đầy đủ mọi thứ của game, ngoại trừ hình ảnh bề mặt chất lượng cao nhất.</text>
				<text xml:lang="th">เกมเต็มโดยไม่มีพื้นผิวคุณภาพสูงสุด</text>
				<text xml:lang="no">Hele spillet uten toppkvalitet på grafikk.</text>
				<text xml:lang="es-AR">Juego completo sin texturas de máxima calidad.</text>
				<text xml:lang="el">Ολόκληρο το παιχνίδι χωρίς τα γραφικά μέγιστης ποιότητας.</text>
				<text xml:lang="zh-SG">标准画质和容量的客户端。</text>
				<text xml:lang="es-MX">Juego completo sin texturas de máxima calidad.</text>
				<text xml:lang="be">Поўная версія гульні, толькі без тэкстур высокай разрознасці.</text>
				<text xml:lang="uk">Повна версія гри, за винятком текстур максимальної роздільної здатності.</text>
				<text xml:lang="kk">Ойынның толық нұсқасы. Максималды анықтық текстураларын қоспағанда.</text>
			</item>
			<item id="SD__CLIENT__TITLE">
				<text xml:lang="en-ZW">Mini Client</text>
				<text xml:lang="ru">Мини-клиент</text>
				<text xml:lang="en">Mini Client</text>
				<text xml:lang="de">Mini-Client</text>
				<text xml:lang="pl">Mini klient</text>
				<text xml:lang="cs">Mini klient</text>
				<text xml:lang="fr">Mini-client</text>
				<text xml:lang="es">Minicliente</text>
				<text xml:lang="it">Client Mini</text>
				<text xml:lang="lv">Mini klients</text>
				<text xml:lang="pt">Mini Cliente</text>
				<text xml:lang="sr">Mini klijent</text>
				<text xml:lang="pt-BR">Cliente Principal</text>
				<text xml:lang="hu">Mini kliens</text>
				<text xml:lang="hr">Mini klijent</text>
				<text xml:lang="fi">Minimaalinen asiakasohjelma</text>
				<text xml:lang="da">Mini klient</text>
				<text xml:lang="nl">Mini client</text>
				<text xml:lang="ro">Client Mini</text>
				<text xml:lang="tr">Mini İstemci</text>
				<text xml:lang="sv">Miniklient</text>
				<text xml:lang="ja">ミニクライアント</text>
				<text xml:lang="ko">미니 클라이언트</text>
				<text xml:lang="lt">Mini klientas</text>
				<text xml:lang="et">Miniklient</text>
				<text xml:lang="bg">Мини клиент</text>
				<text xml:lang="id">Mini Client</text>
				<text xml:lang="zh-TW">迷你客戶端</text>
				<text xml:lang="zh-CN">迷你客户端</text>
				<text xml:lang="vi">Phiên bản Client Nhỏ</text>
				<text xml:lang="th">โปรแกรมลูกข่ายแบบย่อ</text>
				<text xml:lang="no">Miniklient</text>
				<text xml:lang="es-AR">Mini Cliente</text>
				<text xml:lang="el">Mini Client</text>
				<text xml:lang="zh-SG">迷你客户端</text>
				<text xml:lang="es-MX">Minicliente</text>
				<text xml:lang="be">Міні-кліент</text>
				<text xml:lang="uk">Міні-клієнт гри</text>
				<text xml:lang="kk">Мини-клиент</text>
			</item>
			<item id="SD__CLIENT__INFO_BEFORE_INSTALL_TEXT">
				<text xml:lang="en-ZW">You will receive access to Battle Training and vehicles of starting tiers</text>
				<text xml:lang="ru">Вы получите доступ к боевому обучению и технике начальных уровней</text>
				<text xml:lang="en">You will receive access to Battle Training and vehicles of starting tiers</text>
				<text xml:lang="de">Sie erhalten Zugang zur Gefechtsausbildung und den Fahrzeugen der Einstiegsstufen</text>
				<text xml:lang="pl">Otrzymasz dostęp do bitwy treningowej i pojazdów niższych poziomów.</text>
				<text xml:lang="cs">Získáte přístup k bojovému výcviku a vozidlům počátečních úrovní</text>
				<text xml:lang="fr">Vous pourrez accéder aux batailles d'entraînement et véhicules de premiers rangs</text>
				<text xml:lang="es">Obtendrás acceso al entrenamiento de batalla y vehículos de niveles iniciales</text>
				<text xml:lang="it">Avrai accesso all'Addestramento di Battaglia e ai veicoli di livello iniziale</text>
				<text xml:lang="lv">Jūs iegūsiet pieeju kaujas apmācībai un sākuma līmeņu bruņutehnikai</text>
				<text xml:lang="pt">Irá ter acesso ao Treino de Batalha e aos veículos dos níveis iniciais</text>
				<text xml:lang="sr">Dobićeš pristup borbenom treningu i vozilima početnog nivoa</text>
				<text xml:lang="pt-BR">Você receberá acesso às Batalhas de Treinamento e aos veículos de níveis iniciais</text>
				<text xml:lang="hu">Hozzáférsz a Gyakorló csatákhoz és a kezdő szintű járművekhez</text>
				<text xml:lang="hr">Dobit ćete pristup borbenoj obuci i vozilima početnih razina</text>
				<text xml:lang="fi">Saat pääsyn Taistelukoulutukseen ja pelaamaan aloitustason vaunuilla</text>
				<text xml:lang="da">Du vil modtage adgang til kamptræning og køretøjer på begynderniveau</text>
				<text xml:lang="nl">Je zult toegang krijgen tot Gevechtstraining en voertuigen van startniveaus</text>
				<text xml:lang="ro">Vei avea acces la Cursul de luptă şi vehiculele din generaţia de start</text>
				<text xml:lang="tr">Savaş Eğitimi ve başlangıç seviyeleri araçlarına erişiminiz olacak</text>
				<text xml:lang="sv">Du får tillgång till stridsträning och vagnar av startklass</text>
				<text xml:lang="ja">戦闘訓練および初期 Tier 車輌を利用可能になります</text>
				<text xml:lang="ko">전투 훈련 및 시작 단계 전차를 이용할 수 있는 클라이언트입니다.</text>
				<text xml:lang="lt">Jums bus pasiekiami koviniai mokymai ir pradinių lygių mašinos</text>
				<text xml:lang="et">Sa pääsed ligi lahingtreeningule ja esimeste järkude masinatele</text>
				<text xml:lang="bg">Ще получите достъп до бойното обучение и машините от началните нива</text>
				<text xml:lang="id">Anda akan menerima akses ke Battle Training dan tank-tank tier awal</text>
				<text xml:lang="zh-TW">您將可以使用戰鬥訓練及入門階級的車輛</text>
				<text xml:lang="zh-CN">您将会进入新手教学并获得初始坦克</text>
				<text xml:lang="vi">Bạn sẽ có thể chơi phần Huấn luyện Chiến đấu và các xe cấp khởi đầu.</text>
				<text xml:lang="th">คุณจะได้เลือกให้เข้าการฝึกรบและใช้พาหนะระดับเริ่มต้นได้</text>
				<text xml:lang="no">Du får tilgang til kamptrening og kjøretøy på startnivå</text>
				<text xml:lang="es-AR">Recibirás acceso al Entrenamiento de Combate y a los vehículos de nivel inicial</text>
				<text xml:lang="el">Θα αποκτήσετε πρόσβαση στην Εκπαίδευση Μάχης και στα οχήματα των αρχικών βαθμίδων</text>
				<text xml:lang="zh-SG">您将获得训练战场和初级战车的使用权限。</text>
				<text xml:lang="es-MX">Recibirás acceso al Entrenamiento de Batalla y a vehículos de los niveles iniciales</text>
				<text xml:lang="be">Вы атрымаеце доступ да баявога навучання і тэхнікі пачатковых узроўняў</text>
				<text xml:lang="uk">Ви матимете доступ до бойового навчання і техніки початкових рівнів</text>
				<text xml:lang="kk">Сізге жауынгерлік оқыту мен бастапқы деңгейдегі техника қолжетімді болады</text>
			</item>
			<item id="SD__CLIENT__INFO_AFTER_INSTALL_TITLE">
				<text xml:lang="en-ZW">Start Playing!</text>
				<text xml:lang="ru">Начинайте играть!</text>
				<text xml:lang="en">Start Playing!</text>
				<text xml:lang="de">Spielen!</text>
				<text xml:lang="pl">Rozpocznij grę!</text>
				<text xml:lang="cs">Začněte hrát!</text>
				<text xml:lang="fr">Commencer à jouer !</text>
				<text xml:lang="es">¡Comienza a jugar!</text>
				<text xml:lang="it">Inizia a giocare!</text>
				<text xml:lang="lv">Sāciet spēlēt!</text>
				<text xml:lang="pt">Comece a Jogar!</text>
				<text xml:lang="sr">Počni sa igrom!</text>
				<text xml:lang="pt-BR">Comece a Jogar!</text>
				<text xml:lang="hu">Kezdj játszani!</text>
				<text xml:lang="hr">Počnite igrati!</text>
				<text xml:lang="fi">Aloita pelaaminen!</text>
				<text xml:lang="da">Start med at spille!</text>
				<text xml:lang="nl">Start met spelen!</text>
				<text xml:lang="ro">Începe să joci!</text>
				<text xml:lang="tr">Oynamaya Başlayın!</text>
				<text xml:lang="sv">Börja spela!</text>
				<text xml:lang="ja">プレイ開始!</text>
				<text xml:lang="ko">게임 플레이!</text>
				<text xml:lang="lt">Pradėkite žaisti!</text>
				<text xml:lang="et">Alusta mängimist!</text>
				<text xml:lang="bg">Започнете да играете!</text>
				<text xml:lang="id">Mulai Bermain!</text>
				<text xml:lang="zh-TW">開始暢玩！</text>
				<text xml:lang="zh-CN">开始游戏！</text>
				<text xml:lang="vi">Bắt đầu Chơi!</text>
				<text xml:lang="th">เริ่มเล่น!</text>
				<text xml:lang="no">Start spillet!</text>
				<text xml:lang="es-AR">¡Comenzar a Jugar!</text>
				<text xml:lang="el">ΜΠΟΡΕΙΤΕ ΝΑ ΑΡΧΙΣΕΤΕ ΤΟ ΠΑΙΧΝΙΔΙ!</text>
				<text xml:lang="zh-SG">开始游戏！</text>
				<text xml:lang="es-MX">¡Comienza a Jugar!</text>
				<text xml:lang="be">Пачынайце гуляць!</text>
				<text xml:lang="uk">Починайте грати!</text>
				<text xml:lang="kk">Ойынды бастаңыз!</text>
			</item>
			<item id="SD__CLIENT__INFO_AFTER_INSTALL_TEXT">
				<text xml:lang="en-ZW">You now have access to Battle Training and vehicles of starting tiers</text>
				<text xml:lang="ru">У вас уже есть доступ к боевому обучению и технике начальных уровней</text>
				<text xml:lang="en">You now have access to Battle Training and vehicles of starting tiers</text>
				<text xml:lang="de">Sie haben Zugang zur Gefechtsausbildung und den Fahrzeugen der Einstiegsstufen</text>
				<text xml:lang="pl">Masz teraz dostęp do bitwy treningowej i pojazdów niższych poziomów.</text>
				<text xml:lang="cs">Nyní máte přístup k bojovému výcviku a vozidlům počátečních úrovní</text>
				<text xml:lang="fr">Vous avez maintenant accès aux batailles d'entraînement et véhicules de premiers rangs</text>
				<text xml:lang="es">Ahora tienes acceso al entrenamiento de batalla y vehículos de niveles iniciales</text>
				<text xml:lang="it">Hai ora accesso all'Addestramento di Battaglia e ai veicoli di livello iniziale</text>
				<text xml:lang="lv">Tagad jums ir pieeja kaujas apmācībai un sākuma līmeņu bruņutehnikai</text>
				<text xml:lang="pt">Já tem acesso ao Treino de Batalha e aos veículos dos níveis iniciais</text>
				<text xml:lang="sr">Sada imaš pristup borbenom treningu i vozilima početnog nivoa</text>
				<text xml:lang="pt-BR">Agora você tem acesso às Batalhas de Treinamento e aos veículos de níveis iniciais</text>
				<text xml:lang="hu">Hozzáférsz a Gyakorló csatákhoz és a kezdő szintű járművekhez</text>
				<text xml:lang="hr">Sada imate pristup borbenoj obuci i vozilima početnih razina</text>
				<text xml:lang="fi">Pääset nyt Taistelukoulutukseen ja aloitustason vaunuihin</text>
				<text xml:lang="da">Du har nu adgang til kamptræning og køretøjer på begynderniveau</text>
				<text xml:lang="nl">Je hebt nu toegang tot Gevechtstraining en voertuigen van startniveaus</text>
				<text xml:lang="ro">Acum ai acces la Cursul de luptă şi vehiculele din generaţia de start</text>
				<text xml:lang="tr">Artık Savaş Eğitimi ve başlangıç seviyeleri araçlarına erişiminiz var</text>
				<text xml:lang="sv">Du har nu tillgång till stridsträning och vagnar av startklass</text>
				<text xml:lang="ja">戦闘訓練および初期 Tier 車輌を利用可能になりました</text>
				<text xml:lang="ko">이제 전투 훈련 및 시작 단계 전차를 이용할 수 있습니다.</text>
				<text xml:lang="lt">Jums jau pasiekiami koviniai mokymai ir pradinių lygių mašinos</text>
				<text xml:lang="et">Sa pääsed nüüd ligi lahingtreeningule ja esimeste järkude masinatele</text>
				<text xml:lang="bg">Вече имате достъп до бойното обучение и машините от началните нива</text>
				<text xml:lang="id">Anda sekarang memiliki akses ke Battle Training dan tank-tank tier awal</text>
				<text xml:lang="zh-TW">您現在已可以使用戰鬥訓練及入門階級的車輛</text>
				<text xml:lang="zh-CN">您可以进入新手教学并获得初始坦克</text>
				<text xml:lang="vi">Giờ bạn đã có thể chơi phần Huấn luyện Chiến đấu và các xe cấp khởi đầu</text>
				<text xml:lang="th">ตอนนี้คุณสามารถเข้าการฝึกรบและใช้พาหนะระดับเริ่มต้นได้</text>
				<text xml:lang="no">Du har nå tilgang til kamptrening og kjøretøy på startnivå</text>
				<text xml:lang="es-AR">Ahora tienes acceso al Entrenamiento de Combate y a los vehículos de nivel inicial</text>
				<text xml:lang="el">Τώρα έχετε πρόσβαση στην Εκπαίδευση Μάχης και στα οχήματα των αρχικών βαθμίδων</text>
				<text xml:lang="zh-SG">您现在已获得训练战场和初级战车的使用权限。</text>
				<text xml:lang="es-MX">Recibirás acceso al Entrenamiento de Batalla y a vehículos de los niveles iniciales</text>
				<text xml:lang="be">Вы ўжо маеце доступ да баявога навучання і тэхнікі пачатковых узроўняў</text>
				<text xml:lang="uk">Ви вже маєте доступ до бойового навчання і техніки початкових рівнів</text>
				<text xml:lang="kk">Жауынгерлік оқыту мен бастапқы деңгейдегі техника кәзір сізге қолжетімді</text>
			</item>
			<item id="HD__NAME">
				<text xml:lang="en-ZW">HD Client</text>
				<text xml:lang="ru">HD клиент</text>
				<text xml:lang="en">HD Client</text>
				<text xml:lang="de">HD-Client</text>
				<text xml:lang="pl">Klient HD</text>
				<text xml:lang="cs">HD klient</text>
				<text xml:lang="fr">Client HD</text>
				<text xml:lang="es">Cliente HD</text>
				<text xml:lang="it">Client HD</text>
				<text xml:lang="lv">HD klients</text>
				<text xml:lang="pt">Cliente HD</text>
				<text xml:lang="sr">HD klijent</text>
				<text xml:lang="pt-BR">Cliente HD</text>
				<text xml:lang="hu">HD kliens</text>
				<text xml:lang="hr">HD klijent</text>
				<text xml:lang="fi">HD-asiakasohjelma</text>
				<text xml:lang="da">HD klient</text>
				<text xml:lang="nl">HD client</text>
				<text xml:lang="ro">Client HD</text>
				<text xml:lang="tr">HD İstemci</text>
				<text xml:lang="sv">HD-klient</text>
				<text xml:lang="ja">HD クライアント</text>
				<text xml:lang="ko">HD 클라이언트</text>
				<text xml:lang="lt">HD klientas</text>
				<text xml:lang="et">HD klient</text>
				<text xml:lang="bg">HD клиент</text>
				<text xml:lang="id">Client HD</text>
				<text xml:lang="zh-TW">HD 客戶端</text>
				<text xml:lang="zh-CN">64位客户端</text>
				<text xml:lang="vi">Phiên bản Client HD</text>
				<text xml:lang="th">โปรแกรมลูกข่าย HD</text>
				<text xml:lang="no">HD klient</text>
				<text xml:lang="es-AR">Cliente HD</text>
				<text xml:lang="el">HD Client</text>
				<text xml:lang="zh-SG">HD客户端</text>
				<text xml:lang="es-MX">Cliente HD</text>
				<text xml:lang="be">HD-кліент</text>
				<text xml:lang="uk">HD клієнт гри</text>
				<text xml:lang="kk">HD клиент</text>
			</item>
			<item id="HD__SHORT_NAME">
				<text xml:lang="en-ZW">HD</text>
				<text xml:lang="ru">HD</text>
				<text xml:lang="en">HD</text>
				<text xml:lang="de">HD</text>
				<text xml:lang="pl">HD</text>
				<text xml:lang="cs">HD</text>
				<text xml:lang="fr">HD</text>
				<text xml:lang="es">HD</text>
				<text xml:lang="it">HD</text>
				<text xml:lang="lv">HD</text>
				<text xml:lang="pt">HD</text>
				<text xml:lang="sr">HD</text>
				<text xml:lang="pt-BR">HD</text>
				<text xml:lang="hu">HD</text>
				<text xml:lang="hr">HD</text>
				<text xml:lang="fi">HD</text>
				<text xml:lang="da">HD</text>
				<text xml:lang="nl">HD</text>
				<text xml:lang="ro">HD</text>
				<text xml:lang="tr">HD</text>
				<text xml:lang="sv">HD</text>
				<text xml:lang="ja">HD</text>
				<text xml:lang="ko">HD</text>
				<text xml:lang="lt">HD</text>
				<text xml:lang="et">HD</text>
				<text xml:lang="bg">HD</text>
				<text xml:lang="id">HD</text>
				<text xml:lang="zh-TW">HD</text>
				<text xml:lang="zh-CN">HD</text>
				<text xml:lang="vi">HD</text>
				<text xml:lang="th">HD</text>
				<text xml:lang="no">HD</text>
				<text xml:lang="es-AR">HD</text>
				<text xml:lang="el">HD</text>
				<text xml:lang="zh-SG">HD</text>
				<text xml:lang="es-MX">HD</text>
				<text xml:lang="be">HD</text>
				<text xml:lang="uk">HD</text>
				<text xml:lang="kk">HD</text>
			</item>
			<item id="HD__DESCRIPTION">
				<text xml:lang="en-ZW">Full game including maximum-quality textures. Requires more space on the hard drive than the Standard (SD) Client.</text>
				<text xml:lang="ru">Полная версия игры, включая текстуры максимального разрешения. Занимает больше места на жёстком диске, чем стандартный клиент (SD).</text>
				<text xml:lang="en">Full game including maximum-quality textures. Requires more space on the hard drive than the Standard (SD) Client.</text>
				<text xml:lang="de">Vollständiges Spiel mit Texturen höchster Qualität. Erfordert mehr Platz auf der Festplatte als der Standard-Client (SD).</text>
				<text xml:lang="pl">Pełna gra wraz z teksturami najwyższej jakości. Potrzebuje więcej miejsca na dysku twardym od klienta standardowego (SD).</text>
				<text xml:lang="cs">Plna hra včetně textur v maximální kvalitě. Vyžaduje na pevném disku více místa, než standardní (SD) klient.</text>
				<text xml:lang="fr">Jeu complet incluant les textures de qualité maximale. Cela nécessite plus de place sur le disque dur que le client standard (SD).</text>
				<text xml:lang="es">El juego completo incluye texturas de máxima calidad. Requiere más espacio en el disco duro que el cliente estándar (SD).</text>
				<text xml:lang="it">Gioco completo con texture in qualità massima. Richiede più spazio sul disco rigido rispetto al client standard (SD).</text>
				<text xml:lang="lv">Pilna spēles versija, iekļaujot maksimālas kvalitātes tekstūras. Aizņem vairāk vietas uz cietā diska, nekā standarta (SD) klients.</text>
				<text xml:lang="pt">Jogo completo, incluindo texturas de qualidade máxima. Requer mais espaço no disco rígido do que o Cliente Standard (SD).</text>
				<text xml:lang="sr">Puna igra, ukljucujuci teksture maksimalnog kvaliteta. Zahteva vise mesta na hard disku od standardnog (SD) klijenta.</text>
				<text xml:lang="pt-BR">Jogo completo incluindo as texturas de qualidade máxima. Requer mais espaço no disco rígido do que o Cliente Padrão (SD).</text>
				<text xml:lang="hu">Teljes játék, ami tartalmazza a legjobb minőségű textúrákat. Több helyre lesz szükség a meghajtón, mint a normál (SD) kliens esetén.</text>
				<text xml:lang="hr">Puna igra koja uključuje teksture najveće kvalitete. Zahtjeva više mjesta na hard disku od standardnog (SD) klijenta.</text>
				<text xml:lang="fi">Täysi peli sisältäen maksimilaadun tekstuurit. Vaatii enemmän tilaa kiintolevyltä kuin normaali (SD) asiakasohjelma.</text>
				<text xml:lang="da">Fuldt spil inklusive teksturer af maksimal kvalitet. Kræver mere plads på harddisken end standard (SD) klienten.</text>
				<text xml:lang="nl">Volledige game inclusief maximum kwaliteit textures. Heeft meer ruimte op de harde schijf nodig dan de standaard (SD) client.</text>
				<text xml:lang="ro">Joc complet, inclusiv texturi de calitate maximă. Necesită mai mult spațiu pe disc decât versiunea standard (SD).</text>
				<text xml:lang="tr">Maksimum kalitede kaplamalar dahil tam oyun. Sabit diskte Standart (SD) İstemciden daha çok yere ihtiyaç duyar.</text>
				<text xml:lang="sv">Hela spelet inklusive högupplösta texturer. Kräver mer utrymme på hårddisken än standardklienten (SD).</text>
				<text xml:lang="ja">最高品質のテクスチャを含めたフル構成。標準 (SD) クライアントに比べ、より多くの HDD 容量を必要とします。</text>
				<text xml:lang="ko">고품질 텍스쳐를 포함한 HD 클라이언트입니다. SD 클라이언트에 비해 하드 드라이브 용량이 더 필요합니다.</text>
				<text xml:lang="lt">Pilna žaidimo versija su maksimalios kokybės tekstūromis. Užima daugiau vietos diske nei standartinis (SD) klientas.</text>
				<text xml:lang="et">Taielik mäng ilma maksimaalse kvaliteediga tekstuurideta. Nõuab rohkem kõvakettamahtu, kui standard (SD) klient.</text>
				<text xml:lang="bg">Цяла игра с текстури с максимално качество. Изисква повече място на твърдия диск от Стандартния (SD) клиент.</text>
				<text xml:lang="id">Full game termasuk tekstur kualitas maksimum. Membutuhkan lebih banyak ruang di hard drive dibandingkan Client Standard (SD).</text>
				<text xml:lang="zh-TW">含有最高畫質貼圖的完整遊戲。需要比一般 (SD) 客戶端更多的硬碟空間。</text>
				<text xml:lang="zh-CN">游戏完整并画面表现效果可开放到最大。比标准客户端占用更多的硬盘空间。</text>
				<text xml:lang="vi">Đầy đủ mọi thứ của game, kể cả hình ảnh bề mặt chất lượng cao nhất. Cần nhiều chỗ trống trên ổ cứng hơn so với Phiên bản Chuẩn (SD).</text>
				<text xml:lang="th">เกมเต็มพร้อมด้วยคุณภาพพื้นผิวสูงสุด ต้องการพื้นที่ในฮาร์ดดิสก์มากกว่าโปรแกรมลูกข่ายมาตรฐาน (SD)</text>
				<text xml:lang="no">Hele spillet med den beste grafikken. Krever mer plass på harddisken enn Standardklienten (SD).</text>
				<text xml:lang="es-AR">Juego completo incluyendo texturas de máxima calidad. Requiere más espacio en el disco duro que el Cliente Estándar (SD).</text>
				<text xml:lang="el">Ολόκληρο το παιχνίδι περιλαμβάνοντας και τα γραφικά μέγιστης ποιότητας. Απαιτείται περισσότερος χώρος στον σκληρό δίσκο από ότι με τον Βασικό (SD) Client.</text>
				<text xml:lang="zh-SG">完整高清画质的客户端。需要占用比标准（SD）版更多的磁盘容量。</text>
				<text xml:lang="es-MX">Juego completo incluyendo texturas de máxima calidad. Requiere mayor espacio en el disco duro que el Cliente Estándar (SD).</text>
				<text xml:lang="be">Поўная версія гульні з тэкстурамі высокай разрознасці. Займае больш месца на цвёрдым дыску.</text>
				<text xml:lang="uk">Повна версія гри, що включає текстури максимальної роздільної здатності. Займає більше місця на жорсткому диску, ніж стандартний клієнт гри (SD).</text>
				<text xml:lang="kk">Максималды анықтық текстураларын қосқандағы ойынның толық нұсқасы. Стандартты клиентке (SD) қарағанда қатты дискіде көбірек орын алады.</text>
			</item>
			<item id="HD__CLIENT__TITLE">
				<text xml:lang="en-ZW">Mini Client</text>
				<text xml:lang="ru">Мини-клиент</text>
				<text xml:lang="en">Mini Client</text>
				<text xml:lang="de">Mini-Client</text>
				<text xml:lang="pl">Mini klient</text>
				<text xml:lang="cs">Mini klient</text>
				<text xml:lang="fr">Mini-client</text>
				<text xml:lang="es">Minicliente</text>
				<text xml:lang="it">Client Mini</text>
				<text xml:lang="lv">Mini klients</text>
				<text xml:lang="pt">Mini Cliente</text>
				<text xml:lang="sr">Mini klijent</text>
				<text xml:lang="pt-BR">Cliente Principal</text>
				<text xml:lang="hu">Mini kliens</text>
				<text xml:lang="hr">Mini klijent</text>
				<text xml:lang="fi">Minimaalinen asiakasohjelma</text>
				<text xml:lang="da">Mini klient</text>
				<text xml:lang="nl">Mini client</text>
				<text xml:lang="ro">Client Mini</text>
				<text xml:lang="tr">Mini İstemci</text>
				<text xml:lang="sv">Miniklient</text>
				<text xml:lang="ja">ミニクライアント</text>
				<text xml:lang="ko">미니 클라이언트</text>
				<text xml:lang="lt">Mini klientas</text>
				<text xml:lang="et">Miniklient</text>
				<text xml:lang="bg">Мини клиент</text>
				<text xml:lang="id">Mini Client</text>
				<text xml:lang="zh-TW">迷你客戶端</text>
				<text xml:lang="zh-CN">迷你客户端</text>
				<text xml:lang="vi">Phiên bản Client Nhỏ</text>
				<text xml:lang="th">โปรแกรมลูกข่ายแบบย่อ</text>
				<text xml:lang="no">Miniklient</text>
				<text xml:lang="es-AR">Mini Cliente</text>
				<text xml:lang="el">Mini Client</text>
				<text xml:lang="zh-SG">迷你客户端</text>
				<text xml:lang="es-MX">Minicliente</text>
				<text xml:lang="be">Міні-кліент</text>
				<text xml:lang="uk">Міні-клієнт гри</text>
				<text xml:lang="kk">Мини-клиент</text>
			</item>
			<item id="HD__CLIENT__INFO_BEFORE_INSTALL_TEXT">
				<text xml:lang="en-ZW">You will receive access to Battle Training and vehicles of starting tiers</text>
				<text xml:lang="ru">Вы получите доступ к боевому обучению и технике начальных уровней</text>
				<text xml:lang="en">You will receive access to Battle Training and vehicles of starting tiers</text>
				<text xml:lang="de">Sie erhalten Zugang zur Gefechtsausbildung und den Fahrzeugen der Einstiegsstufen</text>
				<text xml:lang="pl">Otrzymasz dostęp do bitwy treningowej i pojazdów niższych poziomów.</text>
				<text xml:lang="cs">Získáte přístup k bojovému výcviku a vozidlům počátečních úrovní</text>
				<text xml:lang="fr">Vous pourrez accéder aux batailles d'entraînement et véhicules de premiers rangs</text>
				<text xml:lang="es">Obtendrás acceso al entrenamiento de batalla y vehículos de niveles iniciales</text>
				<text xml:lang="it">Avrai accesso all'Addestramento di Battaglia e ai veicoli di livello iniziale</text>
				<text xml:lang="lv">Jūs iegūsiet pieeju kaujas apmācībai un sākuma līmeņu bruņutehnikai</text>
				<text xml:lang="pt">Irá ter acesso ao Treino de Batalha e aos veículos dos níveis iniciais</text>
				<text xml:lang="sr">Dobićeš pristup borbenom treningu i vozilima početnog nivoa</text>
				<text xml:lang="pt-BR">Você receberá acesso às Batalhas de Treinamento e aos veículos de níveis iniciais</text>
				<text xml:lang="hu">Hozzáférsz a Gyakorló csatákhoz és a kezdő szintű járművekhez</text>
				<text xml:lang="hr">Dobit ćete pristup borbenoj obuci i vozilima početnih razina</text>
				<text xml:lang="fi">Saat pääsyn Taistelukoulutukseen ja pelaamaan aloitustason vaunuilla</text>
				<text xml:lang="da">Du vil modtage adgang til kamptræning og køretøjer på begynderniveau</text>
				<text xml:lang="nl">Je zult toegang krijgen tot Gevechtstraining en voertuigen van startniveaus</text>
				<text xml:lang="ro">Vei avea acces la Cursul de luptă şi vehiculele din generaţia de start</text>
				<text xml:lang="tr">Savaş Eğitimi ve başlangıç seviyeleri araçlarına erişiminiz olacak</text>
				<text xml:lang="sv">Du får tillgång till stridsträning och vagnar av startklass</text>
				<text xml:lang="ja">戦闘訓練および初期 Tier 車輌を利用可能になります</text>
				<text xml:lang="ko">전투 훈련 및 시작 단계 전차를 이용할 수 있는 클라이언트입니다.</text>
				<text xml:lang="lt">Jums bus pasiekiami koviniai mokymai ir pradinių lygių mašinos</text>
				<text xml:lang="et">Sa pääsed ligi lahingtreeningule ja esimeste järkude masinatele</text>
				<text xml:lang="bg">Ще получите достъп до бойното обучение и машините от началните нива</text>
				<text xml:lang="id">Anda akan menerima akses ke Battle Training dan tank-tank tier awal</text>
				<text xml:lang="zh-TW">您將可以使用戰鬥訓練及入門階級的車輛</text>
				<text xml:lang="zh-CN">您将会进入新手教学并获得初始坦克</text>
				<text xml:lang="vi">Bạn sẽ có thể chơi phần Huấn luyện Chiến đấu và các xe cấp khởi đầu.</text>
				<text xml:lang="th">คุณจะได้เลือกให้เข้าการฝึกรบและใช้พาหนะระดับเริ่มต้นได้</text>
				<text xml:lang="no">Du får tilgang til kamptrening og kjøretøy på startnivå</text>
				<text xml:lang="es-AR">Recibirás acceso al Entrenamiento de Combate y a los vehículos de nivel inicial</text>
				<text xml:lang="el">Θα αποκτήσετε πρόσβαση στην Εκπαίδευση Μάχης και στα οχήματα των αρχικών βαθμίδων</text>
				<text xml:lang="zh-SG">您将获得训练战场和初级战车的使用权限。</text>
				<text xml:lang="es-MX">Recibirás acceso al Entrenamiento de Batalla y a vehículos de los niveles iniciales</text>
				<text xml:lang="be">Вы атрымаеце доступ да баявога навучання і тэхнікі пачатковых узроўняў</text>
				<text xml:lang="uk">Ви матимете доступ до бойового навчання і техніки початкових рівнів</text>
				<text xml:lang="kk">Сізге жауынгерлік оқыту мен бастапқы деңгейдегі техника қолжетімді болады</text>
			</item>
			<item id="HD__CLIENT__INFO_AFTER_INSTALL_TITLE">
				<text xml:lang="en-ZW">Start Playing!</text>
				<text xml:lang="ru">Начинайте играть!</text>
				<text xml:lang="en">Start Playing!</text>
				<text xml:lang="de">Spielen!</text>
				<text xml:lang="pl">Rozpocznij grę!</text>
				<text xml:lang="cs">Začněte hrát!</text>
				<text xml:lang="fr">Commencer à jouer !</text>
				<text xml:lang="es">¡Comienza a jugar!</text>
				<text xml:lang="it">Inizia a giocare!</text>
				<text xml:lang="lv">Sāciet spēlēt!</text>
				<text xml:lang="pt">Comece a Jogar!</text>
				<text xml:lang="sr">Počni sa igrom!</text>
				<text xml:lang="pt-BR">Comece a Jogar!</text>
				<text xml:lang="hu">Kezdj játszani!</text>
				<text xml:lang="hr">Počnite igrati!</text>
				<text xml:lang="fi">Aloita pelaaminen!</text>
				<text xml:lang="da">Start med at spille!</text>
				<text xml:lang="nl">Start met spelen!</text>
				<text xml:lang="ro">Începe să joci!</text>
				<text xml:lang="tr">Oynamaya Başlayın!</text>
				<text xml:lang="sv">Börja spela!</text>
				<text xml:lang="ja">プレイ開始!</text>
				<text xml:lang="ko">게임 플레이!</text>
				<text xml:lang="lt">Pradėkite žaisti!</text>
				<text xml:lang="et">Alusta mängimist!</text>
				<text xml:lang="bg">Започнете да играете!</text>
				<text xml:lang="id">Mulai Bermain!</text>
				<text xml:lang="zh-TW">開始暢玩！</text>
				<text xml:lang="zh-CN">开始游戏！</text>
				<text xml:lang="vi">Bắt đầu Chơi!</text>
				<text xml:lang="th">เริ่มเล่น!</text>
				<text xml:lang="no">Start spillet!</text>
				<text xml:lang="es-AR">¡Comenzar a Jugar!</text>
				<text xml:lang="el">ΜΠΟΡΕΙΤΕ ΝΑ ΑΡΧΙΣΕΤΕ ΤΟ ΠΑΙΧΝΙΔΙ!</text>
				<text xml:lang="zh-SG">开始游戏！</text>
				<text xml:lang="es-MX">¡Comienza a Jugar!</text>
				<text xml:lang="be">Пачынайце гуляць!</text>
				<text xml:lang="uk">Починайте грати!</text>
				<text xml:lang="kk">Ойынды бастаңыз!</text>
			</item>
			<item id="HD__CLIENT__INFO_AFTER_INSTALL_TEXT">
				<text xml:lang="en-ZW">You now have access to Battle Training and vehicles of starting tiers</text>
				<text xml:lang="ru">У вас уже есть доступ к боевому обучению и технике начальных уровней</text>
				<text xml:lang="en">You now have access to Battle Training and vehicles of starting tiers</text>
				<text xml:lang="de">Sie haben Zugang zur Gefechtsausbildung und den Fahrzeugen der Einstiegsstufen</text>
				<text xml:lang="pl">Masz teraz dostęp do bitwy treningowej i pojazdów niższych poziomów.</text>
				<text xml:lang="cs">Nyní máte přístup k bojovému výcviku a vozidlům počátečních úrovní</text>
				<text xml:lang="fr">Vous avez maintenant accès aux batailles d'entraînement et véhicules de premiers rangs</text>
				<text xml:lang="es">Ahora tienes acceso al entrenamiento de batalla y vehículos de niveles iniciales</text>
				<text xml:lang="it">Hai ora accesso all'Addestramento di Battaglia e ai veicoli di livello iniziale</text>
				<text xml:lang="lv">Tagad jums ir pieeja kaujas apmācībai un sākuma līmeņu bruņutehnikai</text>
				<text xml:lang="pt">Já tem acesso ao Treino de Batalha e aos veículos dos níveis iniciais</text>
				<text xml:lang="sr">Sada imaš pristup borbenom treningu i vozilima početnog nivoa</text>
				<text xml:lang="pt-BR">Agora você tem acesso às Batalhas de Treinamento e aos veículos de níveis iniciais</text>
				<text xml:lang="hu">Hozzáférsz a Gyakorló csatákhoz és a kezdő szintű járművekhez</text>
				<text xml:lang="hr">Sada imate pristup borbenoj obuci i vozilima početnih razina</text>
				<text xml:lang="fi">Pääset nyt Taistelukoulutukseen ja aloitustason vaunuihin</text>
				<text xml:lang="da">Du har nu adgang til kamptræning og køretøjer på begynderniveau</text>
				<text xml:lang="nl">Je hebt nu toegang tot Gevechtstraining en voertuigen van startniveaus</text>
				<text xml:lang="ro">Acum ai acces la Cursul de luptă şi vehiculele din generaţia de start</text>
				<text xml:lang="tr">Artık Savaş Eğitimi ve başlangıç seviyeleri araçlarına erişiminiz var</text>
				<text xml:lang="sv">Du har nu tillgång till stridsträning och vagnar av startklass</text>
				<text xml:lang="ja">戦闘訓練および初期 Tier 車輌を利用可能になりました</text>
				<text xml:lang="ko">이제 전투 훈련 및 시작 단계 전차를 이용할 수 있습니다.</text>
				<text xml:lang="lt">Jums jau pasiekiami koviniai mokymai ir pradinių lygių mašinos</text>
				<text xml:lang="et">Sa pääsed nüüd ligi lahingtreeningule ja esimeste järkude masinatele</text>
				<text xml:lang="bg">Вече имате достъп до бойното обучение и машините от началните нива</text>
				<text xml:lang="id">Anda sekarang memiliki akses ke Battle Training dan tank-tank tier awal</text>
				<text xml:lang="zh-TW">您現在已可以使用戰鬥訓練及入門階級的車輛</text>
				<text xml:lang="zh-CN">您可以进入新手教学并获得初始坦克</text>
				<text xml:lang="vi">Giờ bạn đã có thể chơi phần Huấn luyện Chiến đấu và các xe cấp khởi đầu</text>
				<text xml:lang="th">ตอนนี้คุณสามารถเข้าการฝึกรบและใช้พาหนะระดับเริ่มต้นได้</text>
				<text xml:lang="no">Du har nå tilgang til kamptrening og kjøretøy på startnivå</text>
				<text xml:lang="es-AR">Ahora tienes acceso al Entrenamiento de Combate y a los vehículos de nivel inicial</text>
				<text xml:lang="el">Τώρα έχετε πρόσβαση στην Εκπαίδευση Μάχης και στα οχήματα των αρχικών βαθμίδων</text>
				<text xml:lang="zh-SG">您现在已获得训练战场和初级战车的使用权限。</text>
				<text xml:lang="es-MX">Recibirás acceso al Entrenamiento de Batalla y a vehículos de los niveles iniciales</text>
				<text xml:lang="be">Вы ўжо маеце доступ да баявога навучання і тэхнікі пачатковых узроўняў</text>
				<text xml:lang="uk">Ви вже маєте доступ до бойового навчання і техніки початкових рівнів</text>
				<text xml:lang="kk">Жауынгерлік оқыту мен бастапқы деңгейдегі техника кәзір сізге қолжетімді</text>
			</item>
			<item id="HD__SDCONTENT__TITLE">
				<text xml:lang="en-ZW">Standard Client</text>
				<text xml:lang="ru">Стандартный клиент</text>
				<text xml:lang="en">Standard Client</text>
				<text xml:lang="de">Standard-Client</text>
				<text xml:lang="pl">Klient standardowy</text>
				<text xml:lang="cs">Standardní klient</text>
				<text xml:lang="fr">Client standard</text>
				<text xml:lang="es">Cliente estándar</text>
				<text xml:lang="it">Client Standard</text>
				<text xml:lang="lv">Standarta klients</text>
				<text xml:lang="pt">Cliente Normal</text>
				<text xml:lang="sr">Standardni klijent</text>
				<text xml:lang="pt-BR">Cliente Padrão</text>
				<text xml:lang="hu">Normál kliens</text>
				<text xml:lang="hr">Standardni klijent</text>
				<text xml:lang="fi">Normaali asiakasohjelma</text>
				<text xml:lang="da">Standard klient</text>
				<text xml:lang="nl">Standaard client</text>
				<text xml:lang="ro">Client standard</text>
				<text xml:lang="tr">Standart İstemci</text>
				<text xml:lang="sv">Standardklient</text>
				<text xml:lang="ja">標準クライアント</text>
				<text xml:lang="ko">일반 클라이언트</text>
				<text xml:lang="lt">Standartinis klientas</text>
				<text xml:lang="et">Tavaklient</text>
				<text xml:lang="bg">Стандартен клиент</text>
				<text xml:lang="id">Standard Client</text>
				<text xml:lang="zh-TW">一般客戶端</text>
				<text xml:lang="zh-CN">标准客户端</text>
				<text xml:lang="vi">Phiên bản Client Chuẩn</text>
				<text xml:lang="th">โปรแกรมลูกข่ายมาตรฐาน</text>
				<text xml:lang="no">Standardklient</text>
				<text xml:lang="es-AR">Cliente Estándar</text>
				<text xml:lang="el">Βασικός Client</text>
				<text xml:lang="zh-SG">标准客户端</text>
				<text xml:lang="es-MX">Cliente Estándar</text>
				<text xml:lang="be">Звычайны кліент</text>
				<text xml:lang="uk">Стандартний клієнт гри</text>
				<text xml:lang="kk">Стандарт клиент</text>
			</item>
			<item id="HD__SDCONTENT__INFO_BEFORE_INSTALL_TEXT">
				<text xml:lang="en-ZW">You will receive access to the full game without maximum-quality textures</text>
				<text xml:lang="ru">Вы получите доступ к полной версии игры, за исключением текстур максимального разрешения</text>
				<text xml:lang="en">You will receive access to the full game without maximum-quality textures</text>
				<text xml:lang="de">Sie erhalten Zugang zum vollen Spiel ohne hochauflösende Texturen</text>
				<text xml:lang="pl">Otrzymasz dostęp do pełnej gry bez tekstur maksymalnej jakości</text>
				<text xml:lang="cs">Získáte přístup k plné verzi hry bez textur v maximální kvalitě</text>
				<text xml:lang="fr">Vous pourrez accéder au jeu complet avec les textures de qualité maximale</text>
				<text xml:lang="es">Obtendrás acceso al juego completo sin texturas de máxima calidad</text>
				<text xml:lang="it">Avrai accesso al gioco completo senza texture di qualità massima</text>
				<text xml:lang="lv">Jūs iegūsiet pieeju pilnai spēles versijai bez maksimālas kvalitātes tekstūrām</text>
				<text xml:lang="pt">Irá ter acesso ao jogo completo sem as texturas de qualidade máxima</text>
				<text xml:lang="sr">Dobićeš pristup punoj igri bez tekstura maksimalnog kvaliteta</text>
				<text xml:lang="pt-BR">Você receberá acesso ao jogo completo sem as texturas de qualidade máxima</text>
				<text xml:lang="hu">Hozzáférsz a teljes játékhoz a maximális-minőségű textúrákat kivéve</text>
				<text xml:lang="hr">Dobit ćete pristup punoj igri bez tekstura najveće kvalitete</text>
				<text xml:lang="fi">Saat pääsyn täyteen peliin ilman korkeimman mahdollisen laadun tekstuureita</text>
				<text xml:lang="da">Du vil modtage adgang til det fulde spil uden teksturer på maksimal kvalitet</text>
				<text xml:lang="nl">Je zult toegang krijgen tot het volledige spel zonder maximale-kwaliteit texturen</text>
				<text xml:lang="ro">Vei avea acces la jocul complet dar fără texturi de calitate maximă.</text>
				<text xml:lang="tr">Tam oyuna maksimum kalite kaplamalar olmadan erişiminiz olacak</text>
				<text xml:lang="sv">Du får tillgång till hela spelet, men utan högupplösta texturer</text>
				<text xml:lang="ja">最高品質テクスチャを除き、ゲームの全機能をご利用可能になります</text>
				<text xml:lang="ko">고품질 텍스쳐를 제외한 일반 클라이언트입니다.</text>
				<text xml:lang="lt">Jums bus pasiekiama pilna žaidimo versija be maksimalios kokybės tekstūrų</text>
				<text xml:lang="et">Sa pääsed ligi täismängule maksimaalse kvaliteediga tekstuurideta</text>
				<text xml:lang="bg">Ще получите достъп до пълната игра без текстурите с максимално качество</text>
				<text xml:lang="id">Anda akan menerima akses ke full game tanpa tekstur kualitas maksimum</text>
				<text xml:lang="zh-TW">您將可以使用無最大貼圖畫質的完整遊戲</text>
				<text xml:lang="zh-CN">您将获得无纹理质量限制的完整游戏</text>
				<text xml:lang="vi">Bạn sẽ có thể truy cập toàn bộ nội dung game, ngoại trừ hình ảnh bề mặt chất lượng cao nhất</text>
				<text xml:lang="th">คุณจะได้เลือกให้เข้าเกมเต็มได้โดยไม่มีพื้นผิวคุณภาพสูงสุด</text>
				<text xml:lang="no">Du vil få tilgang til hele spillet uten maksimal kvalitet på grafikk.</text>
				<text xml:lang="es-AR">Recibirás acceso al juego completo sin texturas de máxima calidad</text>
				<text xml:lang="el">Θα αποκτήσετε πρόσβαση στο πλήρες παιχνίδι χωρίς τα γραφικά της μέγιστης ποιότητας</text>
				<text xml:lang="zh-SG">您将获得除最高画质之外的完整游戏功能</text>
				<text xml:lang="es-MX">Recibirás acceso a todo el juego sin las texturas de máxima calidad</text>
				<text xml:lang="be">Вы атрымаеце доступ да поўнай версіі гульні, толькі без тэкстур высокай разрознасці</text>
				<text xml:lang="uk">Ви матимете доступ до повної версії гри, за винятком текстур максимальної роздільної здатності</text>
				<text xml:lang="kk">Ең жоғары анықтықтағы текстураларды санамағандағы ойынның толық нұсқасы қолжетімді болады</text>
			</item>
			<item id="HD__SDCONTENT__INFO_AFTER_INSTALL_TITLE">
				<text xml:lang="en-ZW">Start Playing!</text>
				<text xml:lang="ru">Начинайте играть!</text>
				<text xml:lang="en">Start Playing!</text>
				<text xml:lang="de">Spielen!</text>
				<text xml:lang="pl">Rozpocznij grę!</text>
				<text xml:lang="cs">Začněte hrát!</text>
				<text xml:lang="fr">Commencer à jouer !</text>
				<text xml:lang="es">¡Comienza a jugar!</text>
				<text xml:lang="it">Inizia a giocare!</text>
				<text xml:lang="lv">Sāciet spēlēt!</text>
				<text xml:lang="pt">Comece a Jogar!</text>
				<text xml:lang="sr">Počni sa igrom!</text>
				<text xml:lang="pt-BR">Comece a Jogar!</text>
				<text xml:lang="hu">Kezdj játszani!</text>
				<text xml:lang="hr">Počnite igrati!</text>
				<text xml:lang="fi">Aloita pelaaminen!</text>
				<text xml:lang="da">Start med at spille!</text>
				<text xml:lang="nl">Start met spelen!</text>
				<text xml:lang="ro">Începe să joci!</text>
				<text xml:lang="tr">Oynamaya Başlayın!</text>
				<text xml:lang="sv">Börja spela!</text>
				<text xml:lang="ja">プレイ開始!</text>
				<text xml:lang="ko">게임 플레이!</text>
				<text xml:lang="lt">Pradėkite žaisti!</text>
				<text xml:lang="et">Alusta mängimist!</text>
				<text xml:lang="bg">Започнете да играете!</text>
				<text xml:lang="id">Mulai Bermain!</text>
				<text xml:lang="zh-TW">開始暢玩！</text>
				<text xml:lang="zh-CN">开始游戏！</text>
				<text xml:lang="vi">Bắt đầu Chơi!</text>
				<text xml:lang="th">เริ่มเล่น!</text>
				<text xml:lang="no">Start spillet!</text>
				<text xml:lang="es-AR">¡Comenzar a Jugar!</text>
				<text xml:lang="el">ΜΠΟΡΕΙΤΕ ΝΑ ΑΡΧΙΣΕΤΕ ΤΟ ΠΑΙΧΝΙΔΙ!</text>
				<text xml:lang="zh-SG">开始游戏！</text>
				<text xml:lang="es-MX">¡Comienza a Jugar!</text>
				<text xml:lang="be">Пачынайце гуляць!</text>
				<text xml:lang="uk">Починайте грати!</text>
				<text xml:lang="kk">Ойынды бастаңыз!</text>
			</item>
			<item id="HD__SDCONTENT__INFO_AFTER_INSTALL_TEXT">
				<text xml:lang="en-ZW">You now have access to the full game without maximum-quality textures</text>
				<text xml:lang="ru">У вас уже есть доступ к полной версии игры, за исключением текстур максимального разрешения</text>
				<text xml:lang="en">You now have access to the full game without maximum-quality textures</text>
				<text xml:lang="de">Sie haben Zugang zum vollen Spiel ohne hochauflösende Texturen</text>
				<text xml:lang="pl">Masz teraz dostęp do pełnej gry bez tekstur maksymalnej jakości</text>
				<text xml:lang="cs">Nyní máte přístup k plné verzi hry bez textur v maximální kvalitě</text>
				<text xml:lang="fr">Vous avez maintenant accès au jeu complet avec les textures de qualité maximale</text>
				<text xml:lang="es">Ahora tienes acceso al juego completo sin texturas de máxima calidad</text>
				<text xml:lang="it">Hai ora accesso al gioco completo senza texture di qualità massima</text>
				<text xml:lang="lv">Tagad jums ir pieeja pilnai spēles versijai bez maksimālas kvalitātes tekstūrām</text>
				<text xml:lang="pt">Já tem acesso ao jogo completo sem as texturas de qualidade máxima</text>
				<text xml:lang="sr">Sada imaš pristup punoj igri bez tekstura maksimalnog kvaliteta</text>
				<text xml:lang="pt-BR">Agora você tem acesso ao jogo completo sem as texturas de qualidade máxima</text>
				<text xml:lang="hu">Hozzáférsz a teljes játékhoz a maximális-minőségű textúrákat kivéve</text>
				<text xml:lang="hr">Sada imate pristup punoj igri bez tekstura najveće kvalitete</text>
				<text xml:lang="fi">Pääset nyt täyteen peliin ilman korkeimman mahdollisen laadun tekstuureita</text>
				<text xml:lang="da">Du har nu adgang til det fulde spil uden teksturer på maksimal kvalitet</text>
				<text xml:lang="nl">Je hebt nu toegang tot het volledige spel zonder maximale-kwaliteit texturen</text>
				<text xml:lang="ro">Acum ai acces la jocum complet dar fără texturi de calitate maximă.</text>
				<text xml:lang="tr">Artık tam oyuna maksimum kalite kaplamalar olmadan erişiminiz var</text>
				<text xml:lang="sv">Du har nu tillgång till hela spelet, men utan högupplösta texturer</text>
				<text xml:lang="ja">最高品質テクスチャを除き、ゲームの全機能をご利用可能になりました</text>
				<text xml:lang="ko">이제 고품질 텍스쳐를 제외한 게임 설정을 모두 이용할 수 있습니다.</text>
				<text xml:lang="lt">Jums jau pasiekiama pilna žaidimo versija be maksimalios kokybės tekstūrų</text>
				<text xml:lang="et">Sa pääsed nüüd ligi täismängule maksimaalse kvaliteediga tekstuurideta</text>
				<text xml:lang="bg">Вече имате достъп до пълната игра без текстурите с максимално качество</text>
				<text xml:lang="id">Anda sekarang memiliki akses ke full game tanpa tekstur kualitas maksimum</text>
				<text xml:lang="zh-TW">您現在已可以使用無最大貼圖畫質的完整遊戲</text>
				<text xml:lang="zh-CN">您可以享受无纹理质量限制的完整游戏</text>
				<text xml:lang="vi">Giờ bạn đã có thể truy cập toàn bộ nội dung game, ngoại trừ hình ảnh bề mặt chất lượng cao nhất</text>
				<text xml:lang="th">ตอนนี้คุณสามารถเข้าเกมเต็มในแบบไม่มีพื้นผิวคุณภาพสูงสุด</text>
				<text xml:lang="no">Du har nå tilgang til hele spillet uten maksimal kvalitet på grafikk.</text>
				<text xml:lang="es-AR">Ahora tienes acceso al juego completo sin texturas de máxima calidad</text>
				<text xml:lang="el">Τώρα έχετε πρόσβαση στο πλήρες παιχνίδι χωρίς τα γραφικά της μέγιστης ποιότητας</text>
				<text xml:lang="zh-SG">您已获得除最高画质之外的完整游戏功能</text>
				<text xml:lang="es-MX">Recibirás acceso a todo el juego sin las texturas de máxima calidad</text>
				<text xml:lang="be">Вы ўжо маеце доступ да поўнай версіі гульні, толькі без тэкстур высокай разрознасці</text>
				<text xml:lang="uk">Ви вже маєте доступ до повної версії гри, за винятком текстур максимальної роздільної здатності</text>
				<text xml:lang="kk">Ең жоғары анықтықтағы текстураларды санамағандағы ойынның толық нұсқасы кәзір сізге қолжетімді</text>
			</item>
			<item id="LAUNCH_OPTION_TITLE__SAFE_MODE">
				<text xml:lang="en-ZW">Launch the game in safe mode</text>
				<text xml:lang="ru">Запуск игры без модификаций</text>
				<text xml:lang="en">Launch the game in safe mode</text>
				<text xml:lang="de">Spiel im abgesicherten Modus starten</text>
				<text xml:lang="pl">Uruchom grę w trybie bezpiecznym</text>
				<text xml:lang="cs">Spustit hru v bezpečném režimu</text>
				<text xml:lang="fr">Lancer le jeu en mode sans échec</text>
				<text xml:lang="es">Ejecuta el juego en modo seguro</text>
				<text xml:lang="it">Avvia il gioco in modalità sicura</text>
				<text xml:lang="lv">Palaist spēli drošajā režīmā</text>
				<text xml:lang="pt">Iniciar o jogo em modo seguro</text>
				<text xml:lang="sr">Pokreni igru u sejf modu</text>
				<text xml:lang="pt-BR">Execute o jogo em modo de segurança</text>
				<text xml:lang="hu">A játék futtatása csökkentett módban</text>
				<text xml:lang="hr">Pokreni igru u sigurnom režimu</text>
				<text xml:lang="fi">Käynnistä peli vikasietotilassa</text>
				<text xml:lang="da">Kør spillet i safe mode</text>
				<text xml:lang="nl">Het spel in veilige modus starten</text>
				<text xml:lang="ro">Lansează jocul în modul sigur</text>
				<text xml:lang="tr">Oyunu güvenli kipte başlatın</text>
				<text xml:lang="sv">Starta spelet i felsäkert läge</text>
				<text xml:lang="ja">セーフモードでゲームを起動</text>
				<text xml:lang="ko">안전 모드로 게임 실행</text>
				<text xml:lang="lt">Paleisti žaidimą saugiu režimu</text>
				<text xml:lang="et">Käivita mäng ilma modifikatsioonideta</text>
				<text xml:lang="bg">Пусни играта в безопасен режим</text>
				<text xml:lang="id">Jalankan game dalam safe mode</text>
				<text xml:lang="zh-TW">在安全模式下啟動遊戲</text>
				<text xml:lang="zh-CN">在安全模式下运行游戏</text>
				<text xml:lang="vi">Khởi chạy game trong chế độ an toàn</text>
				<text xml:lang="th">เริ่มเกมในแบบปลอดภัย</text>
				<text xml:lang="no">Start spillet i sikkermodus</text>
				<text xml:lang="es-AR">Ejecutar el juego en modo seguro</text>
				<text xml:lang="el">Έναρξη του παιχνιδιού σε ασφαλή λειτουργία</text>
				<text xml:lang="zh-SG">安全模式下启动游戏</text>
				<text xml:lang="es-MX">Abrir el juego en modo seguro</text>
				<text xml:lang="be">Запуск гульні без мадыфікацый</text>
				<text xml:lang="uk">Запуск гри без модифікацій</text>
				<text xml:lang="kk">Ойынды модификациясыз қосу</text>
			</item>
			<item id="LAUNCH_OPTION_DESCRIPTION__SAFE_MODE">
				<text xml:lang="en-ZW">Any installed game client modifications will be ignored.</text>
				<text xml:lang="ru">Игра запустится без установленных модификаций клиента.</text>
				<text xml:lang="en">Any installed game client modifications will be ignored.</text>
				<text xml:lang="de">Sämtliche installierten Modifikationen des Spielclients werden ignoriert.</text>
				<text xml:lang="pl">Wszystkie modyfikacje klienta gry zostaną zignorowane.</text>
				<text xml:lang="cs">Jakékoliv nainstalované modifikace herního klienta budou ignorovány.</text>
				<text xml:lang="fr">Toutes les modifications du client du jeu seront ignorées.</text>
				<text xml:lang="es">El juego se ejecutará sin modificaciones instaladas.</text>
				<text xml:lang="it">Tutte le modifiche del client di gioco installate saranno ignorate.</text>
				<text xml:lang="lv">Spēle tiks palaista bez klienta modifikācijām.</text>
				<text xml:lang="pt">Todas as modificações do cliente do jogo serão ignoradas.</text>
				<text xml:lang="sr">Bilo kakve modifikacije instaliranog klijenta igre će biti ignorisane.</text>
				<text xml:lang="pt-BR">Qualquer modificação instalada no jogo será ignorada.</text>
				<text xml:lang="hu">Minden telepített játékkliens módosítást figyelmen kívül hagyunk.</text>
				<text xml:lang="hr">Bilo koja instalirana preinaka klijenta igre će biti ignorirana.</text>
				<text xml:lang="fi">Kaikki asennetut pelimuokkaukset sivuutetaan.</text>
				<text xml:lang="da">Alle installerede modifikationer til spilklienten vil blive ignoreret.</text>
				<text xml:lang="nl">Elke geïnstalleerde aanpassing van de spelclient zal worden genegeerd.</text>
				<text xml:lang="ro">Orice modificări ale jocului instalat vor fi ignorate.</text>
				<text xml:lang="tr">Tüm kurulu oyun modifikasyonları göz ardı edilecektir.</text>
				<text xml:lang="sv">Alla installerade modifikationer till spelklienten ignoreras.</text>
				<text xml:lang="ja">インストールされているゲームクライアント Mod を全て無視します。</text>
				<text xml:lang="ko">설치된 제삼자 게임 모드를 무시합니다.</text>
				<text xml:lang="lt">Įdiegtos žaidimo modifikacijos bus ignoruojamos.</text>
				<text xml:lang="et">Kõiki mängule paigaldatud modifikatsioone ignoreeritakse.</text>
				<text xml:lang="bg">Всички инсталирани модификации на игровия клиент ще бъдат игнорирани.</text>
				<text xml:lang="id">Modifikasi game client yang diinstall akan dihiraukan.</text>
				<text xml:lang="zh-TW">任何已安裝的遊戲客戶端模組將會被忽略。</text>
				<text xml:lang="zh-CN">所有已安装的游戏客户端修改将会被屏蔽。</text>
				<text xml:lang="vi">Mọi bản chỉnh sửa client game đã cài sẽ bị bỏ qua.</text>
				<text xml:lang="th">การปรับเปลี่ยนโปรแกรมลูกข่ายที่ติดตั้งไว้ใดๆก็ตามจะถูกเพิกเฉย</text>
				<text xml:lang="no">Installerte spillklientmodifikasjoner vil bli ignorert.</text>
				<text xml:lang="es-AR">Cualquier modificación instalada del cliente del juego será ignorada.</text>
				<text xml:lang="el">Όλα τα εγκατεστημένα mods του παιχνιδιού θα απενεργοποιηθούν.</text>
				<text xml:lang="zh-SG">将忽略任何对客户端文件的改动。</text>
				<text xml:lang="es-MX">Cualquier modificación del juego instalada será ignorada.</text>
				<text xml:lang="be">Гульня запусціцца без усталяваных мадыфікацый кліента.</text>
				<text xml:lang="uk">Гра запуститься без встановлених модифікацій клієнта гри.</text>
				<text xml:lang="kk">Ойын клиенттік модификациясыз қосылады.</text>
			</item>
			<item id="LAUNCH_OPTION_TITLE__RESET_GRAPHICS">
				<text xml:lang="en-ZW">Launch the game with default graphics settings</text>
				<text xml:lang="ru">Запуск игры с графическими настройками по умолчанию</text>
				<text xml:lang="en">Launch the game with default graphics settings</text>
				<text xml:lang="de">Spiel mit Standard-Grafikeinstellungen starten</text>
				<text xml:lang="pl">Uruchom grę z domyślnymi ustawieniami grafiki</text>
				<text xml:lang="cs">Spustit hru s výchozím grafickým nastavením</text>
				<text xml:lang="fr">Lancer le jeu avec les paramètres vidéo par défaut</text>
				<text xml:lang="es">Ejecuta el juego con los ajustes gráficos por defecto</text>
				<text xml:lang="it">Avvia il gioco con le impostazioni grafiche predefinite</text>
				<text xml:lang="lv">Palaist spēli ar noklusētajiem grafikas iestatījumiem</text>
				<text xml:lang="pt">Iniciar o jogo com as configurações gráficas por defeito</text>
				<text xml:lang="sr">Pokreni igu sa podrazumevanim grafičkim podešavanjima</text>
				<text xml:lang="pt-BR">Execute o jogo com as configurações gráficas padrão</text>
				<text xml:lang="hu">Játék indítása az alapértelmezett grafikai beállításokkal</text>
				<text xml:lang="hr">Pokreni igru sa zadanim grafičkim postavkama</text>
				<text xml:lang="fi">Käynnistä peli grafiikka-asetusten oletusarvoilla</text>
				<text xml:lang="da">Kør spillet med standard grafikindstillinger</text>
				<text xml:lang="nl">Het spel met standaard grafische instellingen starten</text>
				<text xml:lang="ro">Lansează jocul cu setările grafice implicite</text>
				<text xml:lang="tr">Oyunu varsayılan grafik ayarları ile başlatın</text>
				<text xml:lang="sv">Starta spelet med grundinställd grafik</text>
				<text xml:lang="ja">標準グラフィック設定でゲームを起動</text>
				<text xml:lang="ko">기본 설정으로 게임 실행</text>
				<text xml:lang="lt">Paleisti žaidimą su numatytaisiais grafikos nustatymais</text>
				<text xml:lang="et">Käivita mäng algsete graafikasätetega</text>
				<text xml:lang="bg">Пусни играта с графични настройки по подразбиране</text>
				<text xml:lang="id">Jalankan game dengan pengaturan grafik default</text>
				<text xml:lang="zh-TW">以預設的畫質設定來啟動遊戲</text>
				<text xml:lang="zh-CN">使用默认图像设置打开游戏</text>
				<text xml:lang="vi">Khởi chạy game với thiết lập đồ họa mặc định</text>
				<text xml:lang="th">เปิดเกมด้วยการตั้งค่ากราฟฟิคมาตรฐาน</text>
				<text xml:lang="no">Start spillet med standard grafikkinstillinger</text>
				<text xml:lang="es-AR">Ejecutar el juego con la configuración de gráficos por defecto</text>
				<text xml:lang="el">Έναρξη του παιχνιδιού με τα προεπιλεγμένα γραφικά</text>
				<text xml:lang="zh-SG">用默认图像设置启动游戏</text>
				<text xml:lang="es-MX">Abrir el juego con opciones gráficas predeterminadas</text>
				<text xml:lang="be">Запуск гульні з перадвызначанымі графічнымі наладамі</text>
				<text xml:lang="uk">Запуск гри зі стандартними графічними налаштуваннями</text>
				<text xml:lang="kk">Ойынды үнсіз келісіммен тұрған графикалық баптамалармен қосу</text>
			</item>
			<item id="LAUNCH_OPTION_DESCRIPTION__RESET_GRAPHICS">
				<text xml:lang="en-ZW">All graphics settings will be reset to default.</text>
				<text xml:lang="ru">При запуске игры будут использованы графические настройки по умолчанию.</text>
				<text xml:lang="en">All graphics settings will be reset to default.</text>
				<text xml:lang="de">Alle Grafikeinstellungen werden auf den Standard zurückgesetzt.</text>
				<text xml:lang="pl">Ustawienia grafiki zostaną przywrócone do wartości domyślnych.</text>
				<text xml:lang="cs">Všechna grafická nastavení budou obnovena do výchozího stavu.</text>
				<text xml:lang="fr">Tous les paramètres vidéo seront remis par défaut.</text>
				<text xml:lang="es">Todos los ajustes gráficos volverán a la configuración por defecto.</text>
				<text xml:lang="it">Tutte le impostazioni grafiche verranno ripristinate ai valori predefiniti.</text>
				<text xml:lang="lv">Tiks izmantoti noklusētie grafikas iestatījumi.</text>
				<text xml:lang="pt">Todas as configurações gráficas serão redefinidas para as iniciais.</text>
				<text xml:lang="sr">Sva grafička podešavanja će biti vraćena na podrazumevane vrednosti.</text>
				<text xml:lang="pt-BR">Todas as configurações gráficas serão reiniciadas para a padrão.</text>
				<text xml:lang="hu">Minden grafikai beállítás visszaállítódik alapértelmezettre.</text>
				<text xml:lang="hr">Sve grafičke postavke će biti resetirane na zadane.</text>
				<text xml:lang="fi">Kaikki grafiikka-asetukset palautetaan oletusasetuksiin.</text>
				<text xml:lang="da">Alle grafikindstillinger vil blive nulstillet til standard.</text>
				<text xml:lang="nl">Alle grafische instellingen zullen worden teruggezet op standaard.</text>
				<text xml:lang="ro">Toate setările grafice vor fi resetate la valorile implicite.</text>
				<text xml:lang="tr">Tüm grafik ayarları varsayılan değerlere sıfırlanacak.</text>
				<text xml:lang="sv">Alla grafikinställningar återställs till grundinställningen.</text>
				<text xml:lang="ja">全てのグラフィック設定が標準にリセットされます。</text>
				<text xml:lang="ko">전체 그래픽 설정을 기본값으로 초기화합니다.</text>
				<text xml:lang="lt">Visi grafikos nustatymai bus atstatyti į numatytuosius.</text>
				<text xml:lang="et">Kõik graafikasätted taastatakse algupäraseks.</text>
				<text xml:lang="bg">Всички графични настройки ще бъдат нулирани по подразбиране.</text>
				<text xml:lang="id">Semua pengaturan grafik akan direset ke default.</text>
				<text xml:lang="zh-TW">所有畫質設定將被重置為預設。</text>
				<text xml:lang="zh-CN">所有图像设置将会变为预设。</text>
				<text xml:lang="vi">Mọi thiết lập đồ họa sẽ bị đặt lại về mặc định.</text>
				<text xml:lang="th">การตั้งค่ากราฟฟิคจะถูกตั้งเป็นค่ามาตรฐาน</text>
				<text xml:lang="no">Alle grafikkinstillingene vil bli satt tilbake til standard.</text>
				<text xml:lang="es-AR">Todas las configuraciones gráficas serán reiniciadas.</text>
				<text xml:lang="el">Θα γίνει επαναφορά όλων των ρυθμίσεων των γραφικών στις προκαθορισμένες τιμές.</text>
				<text xml:lang="zh-SG">所有图像设置重置为默认。</text>
				<text xml:lang="es-MX">Todas las opciones gráficas serán reiniciadas.</text>
				<text xml:lang="be">Пры запуску гульні будуць выкарыстаны перадвызначаныя графічныя налады.</text>
				<text xml:lang="uk">Під час запуску гри використають стандартні графічні налаштування.</text>
				<text xml:lang="kk">Ойынды қосу кезінде үнсіз келісіммен тұрған графикалық баптамалар қолданылады.</text>
			</item>
		</localization>
	</predefined_section>
	<generated_section>
		<launch_forbidden>False</launch_forbidden>
		<stop_supporting>False</stop_supporting>
	</generated_section>
</protocol>
```

## Configuring Wargaming Game Center for Downloading World Of Tanks

In the folder Program Files (x86)/Wargaming.net/GameCenter, delete **preferences.xml.bak**.

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/20.jpg">

In the same folder, open the **preferences.xml** file.

You need to modify the **games_manager** section. Here is its original version:
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

Replace it with the following:
```text
        <games_manager>
            <games>
                <game>
                    <working_dir>C:\Games\World_of_Tanks_EU</working_dir>
                    <auto_update>true</auto_update>
                </game>
            </games>
            <default_install_path>C:\Games</default_install_path>
            <game_update_interval>7200000</game_update_interval>
            <content_update_interval>1800000</content_update_interval>
            <start_auto_import>false</start_auto_import>
            <current_game>C:\Games\World_of_Tanks_EU</current_game>
            <active_game>C:\Games\World_of_Tanks_EU</active_game>
            <selectedGames>
                <WOT>C:\Games\World_of_Tanks_EU</WOT>
            </selectedGames>
            <update_check_threshold>600000</update_check_threshold>
            <background_installation>true</background_installation>
            <schedule>
                <slots period="9">[0;24]</slots>
            </schedule>
        </games_manager>
```

Return to the **Contents** folder and open **Wineskin**.

In the window that opens, click on **Advanced**.

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/7.jpg">

In the **Windows app** field, enter the following (with quotes):
```text
"C:\Games\World_of_Tanks_EU\WorldOfTanks.exe" 
```
<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/11.jpg">

Click the lower **Browse** and select the World of Tanks icon.
<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/12.jpg">

Go to the **Tools** tab and click the **Custom EXE Creator** button.

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/8.jpg">

In the **Name to use** field, enter **WGC**.

In the **Windows EXE** field, paste the following (with quotes):
```text
"C:\Program Files (x86)/Wargaming.net/GameCenter/wgc.exe" 
```

Click **Save**.

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/9.jpg">

A file named WGC will appear – this is the executable for installation and updating via Wargaming Game Center.

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/10.jpg">

To ensure WGC has the correct icon, right-click on WGC and select **Show Package Contents**.

Copy **WGC.icns** and rename it to **Wineskin.icns**, then replace the file in the **Resources** folder as shown in the screenshot.

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/21.jpg">

To make it executable outside the wrapper, create a symlink using the following command in the **Terminal**:

```text
ln -s /Applications/WorldOfTanks.app/Contents/WGC.app /Applications/WGC.app
```

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/13.jpg">

Now, WGC appears in your Applications.

To start the process of downloading World Of Tanks, launch WGC and wait for it to finish.

<img src="https://raw.github.com/gmaxus/Mir-tankov-macOS/main/img/0.jpg">

In both the launcher and Applications, the icons may not display correctly, but this will be fixed after a restart.

After downloading, close Wargaming Game Center and launch World Of Tanks.
