#ifndef CPPUTIL_H
#define CPPUTIL_H
#include <string>
#include "algorithm.h"
#include "logger.h"
#include "thrift_tool.h"
#include "timer.h"
#include "jsontool.h"
#define UNUSED(x) (void)x;
namespace CppUtil {
inline std::string version(){return "1.0";}
}

#endif // CPPUTIL_H
