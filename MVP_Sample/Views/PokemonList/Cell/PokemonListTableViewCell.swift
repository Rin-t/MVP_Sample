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

    func configure() {
        
    }

}
