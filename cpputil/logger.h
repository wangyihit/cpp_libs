#ifndef LOG_H
#define LOG_H
#include <memory>
#include <string>
#include <spdlog/spdlog.h>
#include "spdlog/sinks/stdout_color_sinks.h"
#include <spdlog/sinks/daily_file_sink.h>

#define LOG_DEBUG SPDLOG_DEBUG
#define LOG_INFO SPDLOG_INFO
#define LOG_WARN SPDLOG_WARN
#define LOG_ERROR SPDLOG_ERROR

namespace CppUtil {
inline void initLogger(std::string logger_name="root", std::string log_file="output.log", bool console_log = true)
{
     spdlog::set_level(spdlog::level::info);
     spdlog::set_pattern("%Y-%m-%d %H:%M:%S; %l; %v; %@");

     if(console_log == false) {
         std::shared_ptr<spdlog::logger> file_logger = spdlog::daily_logger_mt(logger_name, log_file);
         spdlog::set_default_logger(file_logger);
     }else{
        return;
     }

}
inline void shutdown()
{
    spdlog::shutdown();
}
}
#endif // LOG_H
