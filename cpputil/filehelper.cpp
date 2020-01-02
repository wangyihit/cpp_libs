#include "filehelper.h"
#include <cstdio> // for remove
// for stat
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
// for stat end
#include <fstream>
namespace CppUtil {

FileHelper::FileHelper()
{

}

bool FileHelper::fileRemove(const std::string &file_path)
{
    return remove(file_path.c_str()) == 0;
}

bool FileHelper::fileExist(const std::string &file_path)
{
    struct stat sb;
    if (stat(file_path.c_str(), &sb) == -1) {
        return -1;
    }
    return S_ISREG(sb.st_mode);
}

int FileHelper::writeBinary(const std::string &file_name, const std::string& data)
{
    std::ofstream ofile;
    ofile.open(file_name);
    if(!ofile.is_open()){
        return 1;
    }
    ofile << data;
    ofile.close();
    return 0;
}

}
