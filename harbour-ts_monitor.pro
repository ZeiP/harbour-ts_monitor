# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-ts_monitor

CONFIG += sailfishapp

SOURCES += src/harbour-ts_monitor.cpp \
    src/ts3.cpp

OTHER_FILES += qml/harbour-ts_monitor.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    qml/pages/SecondPage.qml \
    rpm/harbour-ts_monitor.changes.in \
    rpm/harbour-ts_monitor.spec \
    rpm/harbour-ts_monitor.yaml \
    translations/*.ts \
    harbour-ts_monitor.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 256x256

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/harbour-ts_monitor-de.ts

HEADERS += \
    src/TS3/src/ts3.h \
    src/TS3/src/ts3.h \
    src/ts3.h

include(src/TS3/TS3.pri)
