//
//  ViewController.swift
//  ExMultiSectionCollectionView
//
//  Created by Jake.K on 2022/03/07.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
  private let collectionView = UICollectionView(
    frame: .zero,
    collectionViewLayout: UICollectionViewFlowLayout().then {
      $0.scrollDirection = .vertical
      $0.minimumLineSpacing = 8.0
      $0.minimumInteritemSpacing = 8.0
      $0.itemSize = CGSize(width: 50, height: 50)
    }
  ).then {
    $0.showsVerticalScrollIndicator = false
    $0.register(ColorCell.self, forCellWithReuseIdentifier: ColorCell.id)
    $0.register(TitleCell.self, forCellWithReuseIdentifier: TitleCell.id)
  }
  
  private var dataSource = [MySectionModel]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.addSubview(self.collectionView)
    self.collectionView.dataSource = self
    self.collectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    self.refresh()
  }
  
  private func refresh() {
    let imageItems = (1...20)
      .map { _ in ColorItem(color: .randomColor) }
    let titleItems = (21...30)
      .map { TitleItem(titleText: String($0)) }
    self.dataSource.append(contentsOf: [MySectionModel.color(imageItems)] +  [MySectionModel.title(titleItems)])
  }
}

extension ViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    self.dataSource.count
  }
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    switch self.dataSource[section] {
    case let .color(colors):
      return colors.count
    case let .title(titles):
      return titles.count
    }
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch self.dataSource[indexPath.section] {
    case let .color(colors):
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorCell.id, for: indexPath) as! ColorCell
      cell.prepare(color: colors[indexPath.item].color)
      return cell
    case let .title(titles):
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCell.id, for: indexPath) as! TitleCell
      cell.prepare(titleText: titles[indexPath.item].titleText)
      return cell
    }
  }
}
