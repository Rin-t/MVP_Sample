//
//  PokemonListViewController.swift
//  MVP_Sample
//
//  Created by Rin on 2022/02/12.
//

import UIKit

final class PokemonListViewController: UIViewController {

    // Outlets
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(PokemonListCollectionViewCell.nib(), forCellWithReuseIdentifier: PokemonListCollectionViewCell.identifire)
        }
    }


    // Properties
    private var presenter: PokemonListPresenterInput?
    private var pokemons = [Pokemon]()
    private var cellGenerator: CollectionViewCellGenerator!


    // LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = PokemonListPresenter(view: self, useCase: PokemonLiseUseCase())
        presenter?.viewDidLoad()
        cellGenerator = CollectionViewCellGenerator(holizontalMargin: 12,
                                                    verticalMargin: 12,
                                                    itemsInRow: 2,
                                                    spacing: 12,
                                                    collectionView: collectionView)
        navigationItem.title = "一覧"
        navigationController?.navigationBar.tintColor = .white
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
        cell.layer.cornerRadius = cellGenerator.getCornerRadiusToMakeItemCircle()
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectItem(pokemon: pokemons[indexPath.row])
    }
}


//MARK: - UICollectionViewDelegateFlowLayout
extension PokemonListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellGenerator.getItemSizeWithEqualSpacing()
    }
}



//MARK: - PokemonListPresenterOutput
extension PokemonListViewController: PokemonListPresenterOutput {
    
    func presentPokemonDetailVC(pokemon: Pokemon) {
        let vc = PokemonDetailViewController(pokemon: pokemon)
        show(vc, sender: nil)
    }


    func showError() {
        DispatchQueue.main.async {
            self.showAlert()
        }
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
