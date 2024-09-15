#include <iostream>
#include <cmath>
using namespace std;

int main() {
    double x = 0.0001; // Approaching zero
    double sine_limit = sin(x) / x;
    
    cout << "The value of sin(x)/x as x approaches 0 is approximately: " << sine_limit << endl;
    return 0;
}
