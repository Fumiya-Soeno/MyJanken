//
//  UIImageExtension.swift
//  MyJanken
//
//  Created by 添野文哉 on 2020/07/21.
//  Copyright © 2020 fumiya.soeno. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
  func resize() -> UIImage? {
    let rate = 1024.0 / self.size.width
    let rect = CGRect(x: 0, y: 0, width: self.size.width * rate, height: self.size.height * rate)
    UIGraphicsBeginImageContext(rect.size)
    self.draw(in: rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
  }
}
