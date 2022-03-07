//
//  TitleCell.swift
//  ExMultiSectionCollectionView
//
//  Created by Jake.K on 2022/03/07.
//

import UIKit
import Then
import SnapKit

final class TitleCell: UICollectionViewCell {
  static let id = "TitleCell"
  
  private let titleLabel = UILabel().then {
    $0.textColor = .white
    $0.textAlignment = .center
    $0.textColor = .label
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.contentView.addSubview(self.titleLabel)
    self.titleLabel.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  override func prepareForReuse() {
    super.prepareForReuse()
    self.prepare(titleText: nil)
  }
  
  func prepare(titleText: String?) {
    self.titleLabel.text = titleText
  }
}
