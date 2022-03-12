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


    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!

    func configure(pokemon: Pokemon) {
        numberLabel.text = "No. \(pokemon.id)"
        nameLabel.text = pokemon.name
        let url = URL(string: pokemon.sprites.frontImage)
        ImageManager.setImage(target: pokemonImageView, url: url)
    }

}
