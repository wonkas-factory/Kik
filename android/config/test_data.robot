# This should be the only file touched when changing environments
*** Variables ***
${APK_TARGET}    /full/path/to/apk/kik-messenger-15-5-0-19618.apk

&{Andi}     KEY=Andi
...         FIRST_NAME=Andi
...         LAST_NAME=Tester
...         PLATFORM=Android
...	        UDID=192.168.58.101:5555
...	        APPIUM_SERVER=http://127.0.0.1:7814/wd/hub
...	        PORT=7814
...	        BOOTSTAP_PORT=11874
...         KIK_USERNAME=Andi.tester
...         KIK_EMAIL=willy.auto.tester@gmail.com
...         KIK_PASSWORD=*****
...         AUTOMATION_NAME=Appium

&{Budi}     KEY=Budi
...         FIRST_NAME=Budi
...         LAST_NAME=Tester
...         PLATFORM=Android
...	        UDID=192.168.58.102:5555
...	        APPIUM_SERVER=http://127.0.0.1:25078/wd/hub
...	        PORT=25078
...	        BOOTSTAP_PORT=29621
...         KIK_USERNAME=Budi.tester
...         KIK_EMAIL=willy.auto.tester2@gmail.com
...         KIK_PASSWORD=*****
...         AUTOMATION_NAME=Appium

