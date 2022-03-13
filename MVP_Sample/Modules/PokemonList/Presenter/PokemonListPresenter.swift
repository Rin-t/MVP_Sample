//
//  PokemonListPresenter.swift
//  MVP_Sample
//
//  Created by Rin on 2022/02/13.
//

import Foundation

protocol PokemonListPresenterInput: AnyObject {
    func viewDidLoad()
    func didSelectItem(pokemon: Pokemon)
}

protocol PokemonListPresenterOutput: AnyObject {
    func showError()
    func showPokemon(_ pokemons: [Pokemon])
    func presentPokemonDetailVC(pokemon: Pokemon)
}

final class PokemonListPresenter {

    // Properties
    private weak var view: PokemonListPresenterOutput?
    private let useCase: PokemonListUseCaseInput

    // LifeCycles
    init(view: PokemonListPresenterOutput, useCase: PokemonListUseCaseInput) {
        self.view = view
        self.useCase = useCase
    }
}

//MARK: - PokemonListPresenterInput
extension PokemonListPresenter: PokemonListPresenterInput {

    func viewDidLoad() {
        Task {
            do {
                let pokemons = try await PokemonApiClient.fetchPokemonList()
                DispatchQueue.main.async {
                    self.view?.showPokemon(pokemons)
                }
            } catch {
                DispatchQueue.main.async {
                    self.view?.showError()
                }
            }
        }
    }

    func didSelectItem(pokemon: Pokemon) {
        view?.presentPokemonDetailVC(pokemon: pokemon)
    }
}
