//
//  PokemonListViewController.swift
//  MVP_Sample
//
//  Created by Rin on 2022/02/12.
//

import UIKit

final class PokemonListViewController: UIViewController {

    // outlets
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(PokemonListCollectionViewCell.nib(), forCellWithReuseIdentifier: PokemonListCollectionViewCell.identifire)
        }
    }


    // propaties
    private var presenter: PokemonListPresenterInput?
    private var pokemons = [Pokemon]()

    // life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = PokemonListPresenter(view: self)
        presenter?.didLoad()
        setupCollectionViewLayout()
    }

    func setupCollectionViewLayout() {
        let width = view.frame.width
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: width * 0.4, height: width * 0.4)
        layout.sectionInset = UIEdgeInsets(top: 30, left: width * 0.2 / 3, bottom: 30, right: width * 0.2 / 3)
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = width * 0.2 / 3
        collectionView.collectionViewLayout = layout
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension PokemonListViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pokemons.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonListCollectionViewCell.identifire, for: indexPath) as! PokemonListCollectionViewCell
        cell.configure(pokemon: pokemons[indexPath.row])
        cell.layer.cornerRadius = view.frame.width * 0.4 / 2
        cell.layer.borderWidth = 2
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }


}

//MARK: - PokemonListPresenterOutput
extension PokemonListViewController: PokemonListPresenterOutput {
    func showError() {
        showAlert()
    }

    func showPokemon(_ pokemons: [Pokemon]) {
        self.pokemons = pokemons
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

    private func showAlert() {
        let alert = UIAlertController(title: "エラー", message: "データの取得に失敗しました。", preferredStyle: .alert)
        let ok = UIAlertAction(title: "はい", style: .default, handler: nil)

        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }

}
