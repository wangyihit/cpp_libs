

INCLUDEPATH += $$PWD/../output/opencv/include

LIBS += `PKG_CONFIG_PATH=$$PWD/../output/opencv/lib/pkgconfig  pkg-config --libs  --static   --cflags opencv`
