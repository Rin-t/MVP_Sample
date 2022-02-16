//
//  PokemonListTableViewCell.swift
//  MVP_Sample
//
//  Created by Rin on 2022/02/13.
//

import UIKit


final class PokemonListCollectionViewCell: UICollectionViewCell {

    // statics
    static let identifire = "PokemonListCollectionViewCell"
    static func nib() -> UINib {
        UINib(nibName: identifire, bundle: nil)
    }

    func configure(pokemon: Pokemon) {

    }

}
