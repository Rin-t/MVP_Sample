//
//  PokemonListTableViewCell.swift
//  MVP_Sample
//
//  Created by Rin on 2022/02/13.
//

import UIKit

final class PokemonListTableViewCell: UITableViewCell {

    // statics
    static let identifire = "PokemonListTableViewCell"
    static func nib() -> UINib {
        UINib(nibName: identifire, bundle: nil)
    }

    // outlets
    @IBOutlet private weak var idLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!

    // methods
    func configure(pokemon: Pokemon) {
        let id = String(pokemon.id)
        idLabel.text = "No. \(id)"
        nameLabel.text = pokemon.name
    }

}
