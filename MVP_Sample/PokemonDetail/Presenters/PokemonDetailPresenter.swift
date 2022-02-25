//
//  PokemonDetailPresenter.swift
//  MVP_Sample
//
//  Created by Rin on 2022/02/13.
//

import Foundation

protocol PokemonDetailPresenterInput: AnyObject {

}

protocol PokemonDetailPresenterOutput: AnyObject {

}

final class PokemonDetailPresenter {

    weak var view: PokemonDetailPresenterOutput?

    init(view: PokemonDetailPresenterOutput) {
        self.view = view
    }

}

extension PokemonDetailPresenterInput {

}
