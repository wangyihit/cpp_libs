#-------------------------------------------------
#
# Project created by QtCreator 2019-12-28T23:16:58
#
#-------------------------------------------------

QT       -= core gui

TARGET = cpputil
TEMPLATE = lib
CONFIG += staticlib

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

include($$PWD/../thrift/thrift.pri)
include($$PWD/../spdlog/spdlog.pri)

SOURCES += cpputil.cpp \
    timer.cpp \
    filehelper.cpp \
    jsontool.cpp

HEADERS += cpputil.h \
    thrift_tool.h \
    timer.h \
    algorithm.h \
    logger.h \
    filehelper.h \
    nlohmann/json.hpp \
    jsontool.h

unix {
    target.path = $$PWD/../output/cpputil/lib
    INSTALLS += target
    headers.files = $$HEADERS
    headers.path = $$PWD/../output/cpputil/include
    INSTALLS += headers
}
