//
//  CollectionViewCellGenerator.swift
//  MVP_Sample
//
//  Created by Rin on 2022/02/23.
//

import UIKit

// 実装としてあんまり良くなさそう
// 等間隔でセルを配置したいときに使う。
class CollectionViewCellGenerator {
    
    private let holizontalMargin: CGFloat
    private let verticalMargin: CGFloat
    private let itemsInRow: CGFloat
    private let spacing: CGFloat
    private let collectionView: UICollectionView


    /// - Parameters:
    ///   - holizontalMargin: sectionの上下の余白
    ///   - verticalMargin: sectionの左右の余白
    ///   - itemsInRow: １列に並べるセルの個数
    ///   - spacing: セルの間のスペース
    ///   - collectionView: ターゲットのcollectionView
    init(holizontalMargin: CGFloat, verticalMargin: CGFloat, itemsInRow: Int, spacing: CGFloat, collectionView: UICollectionView) {
        self.holizontalMargin = holizontalMargin
        self.verticalMargin = verticalMargin
        self.itemsInRow = CGFloat(itemsInRow)
        self.spacing = spacing
        self.collectionView = collectionView
        setupCollectionViewLayout()
    }

    func getItemSizeWithEqualSpacing() -> CGSize {
        let availableWidth = (collectionView.frame.width - holizontalMargin * 2) - spacing * (itemsInRow - 1)
        let width = availableWidth / itemsInRow
        return CGSize(width: width, height: width)
    }

    func getCornerRadiusToMakeItemCircle() -> CGFloat {
        let availableWidth = (collectionView.frame.width - holizontalMargin * 2) - spacing * (itemsInRow - 1)
        let width = availableWidth / itemsInRow
        return width / 2
    }

}

extension CollectionViewCellGenerator {

    private func setupCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: verticalMargin, left: holizontalMargin, bottom: verticalMargin, right: holizontalMargin)
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
    }
}
