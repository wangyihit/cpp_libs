#include "timer.h"
#include <QDateTime>
namespace CppUtil {
Timer::Timer():start_ms(0), end_ms(0), duration_ms(0)
{
    start_ms = QDateTime::currentDateTime().toMSecsSinceEpoch();
}
long Timer::ends(){
    end_ms = QDateTime::currentDateTime().toMSecsSinceEpoch();
    duration_ms = end_ms - start_ms;
    return duration_ms;
}

long Timer::duration(){
    return duration_ms;
}
} // end CppUtil
