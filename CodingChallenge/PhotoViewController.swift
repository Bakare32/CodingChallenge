//
//  ViewController.swift
//  CodingChallenge
//
//  Created by Decagon on 19/11/2021.
//

import UIKit
import Kingfisher

class PhotoViewController: UIViewController {
  
  var list: CodingViewModel?
  var items: [Photo] = []
  
  lazy var mainCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 20
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
    collectionView.isPagingEnabled = true
      collectionView.backgroundColor = .systemBackground  //UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
      
//      collectionView.backgroundColor = .systemBackground
    collectionView.showsVerticalScrollIndicator = false
    collectionView.isUserInteractionEnabled = true
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(mainCollectionView)
    mainCollectionView.dataSource = self
    mainCollectionView.delegate = self
    view.backgroundColor = .systemBackground
    mainCollectionView.anchorWithConstantsToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 20, leftConstant: 0, bottomConstant:  20, rightConstant:  0)
      UIColor { traitCollection -> UIColor in //1
        switch traitCollection.userInterfaceStyle { //2
        case .dark:
          return UIColor(white: 0.3, alpha: 1.0) //3
        default:
          return UIColor(white: 0.7, alpha: 1.0) //4
        }
      }
      
      NetworkService.shared.likePost {  [weak self ] result in
          switch result {
          case .success(let data):
              print("The decode data is \(data)")
              self?.items = data.photos.photo ?? []
              self?.mainCollectionView.reloadData()
          case .failure(let error):
              print("The error is \(error.localizedDescription)")
          }
      }
  }
}

extension PhotoViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as? MainCollectionViewCell else { return UICollectionViewCell() }
    let item = items[indexPath.row]
    cell.setup(with: CodingViewModel(with: item))
//    cell.backgroundColor = UIColor(red: 0.91, green: 0.92, blue: 0.90, alpha: 1.00)
    cell.layer.cornerRadius = 20
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: view.frame.height / 4)
  }
}
