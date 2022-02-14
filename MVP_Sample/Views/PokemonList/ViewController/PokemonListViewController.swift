//
//  PokemonListViewController.swift
//  MVP_Sample
//
//  Created by Rin on 2022/02/12.
//

import UIKit

final class PokemonListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(PokemonListTableViewCell.nib(), forCellReuseIdentifier: PokemonListTableViewCell.identifire)
        }
    }

    private var presenter: PokemonListPresenterInput?
    private var pokemons = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = PokemonListPresenter(view: self)
        presenter?.didLoad()
    }
}

extension PokemonListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pokemons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PokemonListTableViewCell.identifire, for: indexPath) as! PokemonListTableViewCell
        cell.configure(pokemon: pokemons[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        64
    }


}

extension PokemonListViewController: PokemonListPresenterOutput {
    func showError() {
        showAlert()
    }

    func showPokemon(_ pokemons: [Pokemon]) {
        self.pokemons = pokemons
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    private func showAlert() {
        let alert = UIAlertController(title: "エラー", message: "データの取得に失敗しました。", preferredStyle: .alert)
        let ok = UIAlertAction(title: "はい", style: .default, handler: nil)

        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }

}
