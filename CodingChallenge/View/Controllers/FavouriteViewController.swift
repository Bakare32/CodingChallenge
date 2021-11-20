//
//  FavouriteViewController.swift
//  CodingChallenge
//
//  Created by  Decagon on 19/11/2021.
//

import UIKit
import RealmSwift

class FavouriteViewController: UIViewController {
    
    private var data = [catMod]()
    let realm = try! Realm()
    var viewModel = CollectionViewModel()
    
    lazy var favouriteCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FavouriteCollectionViewCell.self, forCellWithReuseIdentifier: FavouriteCollectionViewCell.identifier)
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .systemBackground
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isUserInteractionEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favourites"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.titleTextAttributes =
        [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 37)!,
         NSAttributedString.Key.foregroundColor: UIColor.black]
        
        view.addSubview(favouriteCollectionView)
        favouriteCollectionView.dataSource = self
        favouriteCollectionView.delegate = self
        view.backgroundColor = .systemBackground
        
        
        favouriteCollectionView.anchorWithConstantsToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 50, leftConstant: 0, bottomConstant:  20, rightConstant:  0)
        UIColor { traitCollection -> UIColor in //1
            switch traitCollection.userInterfaceStyle { //2
            case .dark:
                return UIColor(white: 0.3, alpha: 1.0) //3
            default:
                return UIColor(white: 0.7, alpha: 1.0) //4
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.favouriteCollectionView.reloadData()
        }
    }
    
    
}


extension FavouriteViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavouriteCollectionViewCell.identifier, for: indexPath) as? FavouriteCollectionViewCell else { return UICollectionViewCell() }
        cell.setup(with: viewModel.data[indexPath.row])
        cell.delegate = self
        cell.tag = indexPath.row
        cell.layer.cornerRadius = 20
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: view.frame.height / 4)
    }
}

extension FavouriteViewController: collectionViewCellDelegate {
    func didTapRemoveBtn(with index: Int) {
        self.viewModel.delete(index: index)
        self.favouriteCollectionView.reloadData()
        viewModel.completion = {
            self.favouriteCollectionView.reloadData()
        }
    }
}
