#ifndef JSONTOOL_H
#define JSONTOOL_H
#include <string>
#include <map>
namespace CppUtil {
class JsonTool
{
public:
    JsonTool();
    static void Json2CssMap(const std::string& data, std::map<std::string, std::string>& m);
    static std::string  CssMap2Json(const std::map<std::string, std::string>& m);
};
} // cpputil
#endif // JSONTOOL_H
