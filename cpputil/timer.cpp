#include "timer.h"
#include <sys/time.h>


namespace CppUtil {

Timer::Timer():start_ms(0), end_ms(0), duration_ms(0)
{
    start_ms = currentMS();
}
long Timer::ends(){
    end_ms = currentMS();
    duration_ms = end_ms - start_ms;
    return duration_ms;
}

long Timer::duration(){
    return duration_ms;
}
long currentMS()
{
   struct timeval tv;
   gettimeofday(&tv, nullptr);
   return tv.tv_sec * 1000 + tv.tv_usec / 1000;
}
} // end CppUtil
