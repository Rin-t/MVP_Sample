//
//  PokemonListTableViewCell.swift
//  MVP_Sample
//
//  Created by Rin on 2022/02/13.
//

import UIKit


final class PokemonListCollectionViewCell: UICollectionViewCell {

    // Statics
    static let identifire = "PokemonListCollectionViewCell"
    static func nib() -> UINib {
        UINib(nibName: identifire, bundle: nil)
    }

    // Outlets
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var pokemonImageView: UIImageView!

    // Methods
    func configure(pokemon: Pokemon) {
        numberLabel.text = "No. \(pokemon.id)"
        nameLabel.text = pokemon.name
        let url = URL(string: pokemon.sprites.frontImage)
        ImageManager.setImage(target: pokemonImageView, url: url)
    }
}
