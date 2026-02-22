#include "space_age.h"

namespace space_age {

static const double earth_year_in_seconds = 31557600.0;

static const double orbital_periods[] = {
    1.0,        // Earth
    0.2408467,  // Mercury
    0.61519726, // Venus
    1.8808158,  // Mars
    11.862615,  // Jupiter
    29.447498,  // Saturn
    84.016846,  // Uranus
    164.79132   // Neptune
};

space_age::space_age(double seconds)
    : seconds_(seconds) {}

double space_age::seconds() const {
    return seconds_;
}

double space_age::on_earth() const {
    return seconds_ / (earth_year_in_seconds * orbital_periods[0]);
}

double space_age::on_mercury() const {
    return seconds_ / (earth_year_in_seconds * orbital_periods[1]);
}

double space_age::on_venus() const {
    return seconds_ / (earth_year_in_seconds * orbital_periods[2]);
}

double space_age::on_mars() const {
    return seconds_ / (earth_year_in_seconds * orbital_periods[3]);
}

double space_age::on_jupiter() const {
    return seconds_ / (earth_year_in_seconds * orbital_periods[4]);
}

double space_age::on_saturn() const {
    return seconds_ / (earth_year_in_seconds * orbital_periods[5]);
}

double space_age::on_uranus() const {
    return seconds_ / (earth_year_in_seconds * orbital_periods[6]);
}

double space_age::on_neptune() const {
    return seconds_ / (earth_year_in_seconds * orbital_periods[7]);
}

} // namespace space_age
