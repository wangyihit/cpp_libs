
include($$PWD/../boost/boost.pri)

INCLUDEPATH += $$PWD/../output/thrift/include

LIBS += -L$$PWD/../output/thrift/lib -lthrift -lpthread

