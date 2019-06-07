/// Copyright (c) 2018 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

extension UIColor {
  class func colorFromRGB(_ r: Int, g: Int, b: Int) -> UIColor {
    return UIColor(red: CGFloat(Float(r) / 255), green: CGFloat(Float(g) / 255), blue: CGFloat(Float(b) / 255), alpha: 1)
  }
  
  class func palette() -> [UIColor] {
    let palette = [
      UIColor.colorFromRGB(85, g: 0, b: 255),
      UIColor.colorFromRGB(170, g: 0, b: 170),
      UIColor.colorFromRGB(85, g: 170, b: 85),
      UIColor.colorFromRGB(0, g: 85, b: 0),
      UIColor.colorFromRGB(255, g: 170, b: 0),
      UIColor.colorFromRGB(255, g: 255, b: 0),
      UIColor.colorFromRGB(255, g: 85, b: 0),
      UIColor.colorFromRGB(0, g: 85, b: 85),
      UIColor.colorFromRGB(0, g: 85, b: 255),
      UIColor.colorFromRGB(170, g: 170, b: 255),
      UIColor.colorFromRGB(85, g: 0, b: 0),
      UIColor.colorFromRGB(170, g: 85, b: 85),
      UIColor.colorFromRGB(170, g: 255, b: 0),
      UIColor.colorFromRGB(85, g: 170, b: 255),
      UIColor.colorFromRGB(0, g: 170, b: 170)
    ]
    return palette
  }
}
