//
//  MySectionModel.swift
//  ExMultiSectionCollectionView
//
//  Created by Jake.K on 2022/03/07.
//

import Foundation
import UIKit

enum MySectionModel {
  case color([ColorItem])
  case title([TitleItem])
}

struct ColorItem {
  let color: UIColor
}

struct TitleItem {
  let titleText: String
}
