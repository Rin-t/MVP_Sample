//
//  PokemonDetailViewController.swift
//  MVP_Sample
//
//  Created by Rin on 2022/02/13.
//

import UIKit

final class PokemonDetailViewController: UIViewController {

    @IBOutlet private weak var idLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var pokemonImage: UIImageView!

    private let pokemon: Pokemon

    init(pokemon: Pokemon) {
        self.pokemon = pokemon
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    func setupViews() {
        nameLabel.text = pokemon.name
        idLabel.text = "No.\(pokemon.id)"
    }
}
