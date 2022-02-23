//
//  CollectionViewCellGenerator.swift
//  MVP_Sample
//
//  Created by Rin on 2022/02/23.
//

import UIKit

class CollectionViewCellGenerator {
    let holizontalMargin: CGFloat
    let verticalMargin: CGFloat
    let itemsInRow: CGFloat
    let spacing: CGFloat
    let collectionView: UICollectionView


    init(holizontalMargin: CGFloat, verticalMargin: CGFloat, itemsInRow: Int, spacing: CGFloat, collectionView: UICollectionView) {
        self.holizontalMargin = holizontalMargin
        self.verticalMargin = verticalMargin
        self.itemsInRow = CGFloat(itemsInRow)
        self.spacing = spacing
        self.collectionView = collectionView
    }

    func setupCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: verticalMargin, left: holizontalMargin, bottom: verticalMargin, right: holizontalMargin)
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
    }

    func getItemSizeWithEqualSpacing() -> CGSize {
        let availableWidth = (collectionView.frame.width - holizontalMargin * 2) - spacing * (itemsInRow - 1)
        let width = availableWidth / itemsInRow
        return CGSize(width: width, height: width)
    }

    func getCornerRadiusToMakeCircleItem() -> CGFloat {
        let availableWidth = (collectionView.frame.width - holizontalMargin * 2) - spacing * (itemsInRow - 1)
        let width = availableWidth / itemsInRow
        return width / 2
    }

}
