#ifndef TIMER_H
#define TIMER_H

namespace CppUtil {
class Timer
{
public:
    Timer();
    long ends();
    long duration();
protected:
    long start_ms;
    long end_ms;
    long duration_ms;
};
extern long currentMS();
} // end of namespace cpputil
#endif // TIMER_H
