//
//  ViewController.swift
//  CodingChallenge
//
//  Created by Decagon on 19/11/2021.
//

import UIKit

class PhotoViewController: UIViewController {
  
  var list: CodingViewModel?
  var items: [CodingModel] = {
  
    let firstPage = CodingModel(title: "Document your experience", describe: "With the experience app, you are", image: "blacky")
      let secondPage = CodingModel(title: "Comes in handy.", describe: "Xperience makes documentation", image: "blacky")
      let thirdPage = CodingModel(title: "Bring your story to life", describe: "Writing and documenting your experience", image: "blacky")
      return[firstPage,secondPage,thirdPage]
    }()
  
  lazy var mainCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 20
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
    collectionView.isPagingEnabled = true
      collectionView.backgroundColor = .systemBackground  //UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
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
    mainCollectionView.anchorWithConstantsToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 20, leftConstant: 20, bottomConstant:  20, rightConstant:  20)
      UIColor { traitCollection -> UIColor in //1
        switch traitCollection.userInterfaceStyle { //2
        case .dark:
          return UIColor(white: 0.3, alpha: 1.0) //3
        default:
          return UIColor(white: 0.7, alpha: 1.0) //4
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
