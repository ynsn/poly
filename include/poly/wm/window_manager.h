/**
 * Copyright (c) 2021 Stack Design and Poly Contributors.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can obtain
 * one at https://mozilla.org/MPL/2.0/.
 **/

#ifndef POLY_INCLUDE_POLY_WM_WINDOW_MANAGER_H_
#define POLY_INCLUDE_POLY_WM_WINDOW_MANAGER_H_

namespace poly {
namespace wm {

class Window;

class WindowManager {
 public:
  Window *CreateWindow() noexcept;

  [[nodiscard]] static WindowManager *GetWindowManager()
  noexcept {
    static WindowManager window_manager;

    return &window_manager;
  }
 private:
  WindowManager() = default;
};

} //wm
} //poly

#endif //POLY_INCLUDE_POLY_WM_WINDOW_MANAGER_H_
