#include "triangle.h"

namespace triangle {

flavor kind(double a, double b, double c) {
    // Check for valid lengths (must be > 0)
    if (a <= 0 || b <= 0 || c <= 0) {
        throw std::domain_error("Sides must be positive");
    }

    // Triangle inequality check
    if (a + b <= c || a + c <= b || b + c <= a) {
        throw std::domain_error("Triangle inequality violated");
    }

    // All sides equal
    if (a == b && b == c) {
        return flavor::equilateral;
    }

    // Any two sides equal
    if (a == b || b == c || a == c) {
        return flavor::isosceles;
    }

    // Otherwise, scalene
    return flavor::scalene;
}

}  // namespace triangle
