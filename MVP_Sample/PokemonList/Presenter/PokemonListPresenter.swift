//
//  PokemonListPresenter.swift
//  MVP_Sample
//
//  Created by Rin on 2022/02/13.
//

import Foundation

protocol PokemonListPresenterInput: AnyObject {
    func didLoad()
    func didSelectItem()
}

protocol PokemonListPresenterOutput: AnyObject {
    func showError()
    func showPokemon(_ pokemons: [Pokemon])
}

final class PokemonListPresenter {

    // Properties
    private weak var view: PokemonListPresenterOutput?

    // LifeCycles
    init(view: PokemonListPresenterOutput) {
        self.view = view
    }
}

//MARK: - PokemonListPresenterInput
extension PokemonListPresenter: PokemonListPresenterInput {

    func didLoad() {
        Task {
            do {
                let pokemons = try await PokemonApiClient.fetchPokemonList()
                view?.showPokemon(pokemons)
            } catch {
                view?.showError()
            }
        }
    }

    func didSelectItem() {
        print("tapped")
    }
}
