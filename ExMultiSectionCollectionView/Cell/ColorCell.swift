//
//  ColorCell.swift
//  ExMultiSectionCollectionView
//
//  Created by Jake.K on 2022/03/07.
//

import UIKit
import Then
import SnapKit

final class ColorCell: UICollectionViewCell {
  static let id = "MyCell"
  private let colorView = UIView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.contentView.addSubview(self.colorView)
    self.colorView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  required init?(coder: NSCoder) {
    fatalError()
  }
  override func prepareForReuse() {
    super.prepareForReuse()
    self.prepare(color: nil)
  }
  
  func prepare(color: UIColor?) {
    self.colorView.backgroundColor = color ?? .clear
  }
}
