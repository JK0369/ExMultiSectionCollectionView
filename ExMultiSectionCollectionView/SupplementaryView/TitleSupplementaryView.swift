//
//  TitleSupplmentaryView.swift
//  ExMultiSectionCollectionView
//
//  Created by Jake.K on 2022/03/07.
//

import UIKit
import SnapKit
import Then

final class TitleSupplementaryView: UICollectionReusableView {
  static let id = "TitleSupplementaryView"
  
  private let titleLabel = UILabel().then {
    $0.textColor = .label
    $0.textAlignment = .center
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .systemGray4
    self.addSubview(self.titleLabel)
    self.titleLabel.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  override func prepareForReuse() {
    super.prepareForReuse()
    self.prepare(title: nil)
  }
  
  func prepare(title: String?) {
    self.titleLabel.text = title
  }
}
