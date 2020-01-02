#ifndef ALGORITHM_H
#define ALGORITHM_H
namespace CppUtil {
class Algorithm {
public:
    static inline int hamdist(long long x, long long y){
        int dist = 0;
        long long val = x ^ y;
        while(val)
        {
            ++dist;
            val &= val - 1;
        }
        return dist;
    }
};
}
#endif // ALGORITHM_H
