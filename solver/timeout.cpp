#include "timeout.hpp"
#include <chrono>

std::chrono::time_point<std::chrono::system_clock, std::chrono::system_clock::duration> time_limit;
bool limit_enabled = false;

void setTimeout(int seconds) {
    auto now = std::chrono::system_clock::now();
    auto duration = std::chrono::seconds(seconds);
    time_limit = now + duration;
    limit_enabled = true;
}

void disableTimeout() {
    limit_enabled = false;
}

bool timeout() {
    return limit_enabled && std::chrono::system_clock::now() > time_limit;
}
