#include "jsontool.h"
#include "nlohmann/json.hpp"
using json = nlohmann::json;
namespace CppUtil {
JsonTool::JsonTool()
{

}

void JsonTool::Json2CssMap(const std::string& data, std::map<std::string, std::string>& m)
{
    json j = json::parse(data.c_str());
    m = j.get<std::map <std::string, std::string>>();
}

std::string  JsonTool::CssMap2Json(const std::map<std::string, std::string>& m)
{
    json j_map(m);
    return j_map.dump();
}
}// cpputil
