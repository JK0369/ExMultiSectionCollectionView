//
//  UIColor+Extension.swift
//  ExMultiSectionCollectionView
//
//  Created by Jake.K on 2022/03/07.
//

import UIKit

extension UIColor {
  static var randomColor: UIColor {
    UIColor(
      red: CGFloat(drand48()),
      green: CGFloat(drand48()),
      blue: CGFloat(drand48()),
      alpha: 1.0
    )
  }
}
