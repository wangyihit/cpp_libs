#ifndef FILEHELPER_H
#define FILEHELPER_H
#include <string>
namespace CppUtil {

class FileHelper
{
public:
    FileHelper();
    static bool fileRemove(const std::string &file_path);
    static bool fileExist(const std::string &file_path);
    static int writeBinary(const std::string &file_name, const std::string& data);
};
}
#endif // FILEHELPER_H
