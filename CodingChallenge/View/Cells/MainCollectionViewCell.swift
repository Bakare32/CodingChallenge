//
//  MainCollectionViewCell.swift
//  CodingChallenge
//
//  Created by Decagon on 19/11/2021.
//

import UIKit
import Kingfisher

protocol MainCollectionViewCellDelegate: AnyObject {
    func passData()
func didTapAddBtn(with item: DisplayModel)
    func didTapRemoveBtn(with item: DisplayModel)
}

class MainCollectionViewCell: UICollectionViewCell {
    
    static var identifier = "MainCollectionViewCellID"
    weak var delegate: MainCollectionViewCellDelegate?
    
//    var isLike: Bool = false
//
    var newPhoto: DisplayModel?
    
    private func configureLikedBtn(for selectedState: Bool) {
        topBackArrowButton.setImage(selectedState ? UIImage(systemName: "star.circle.fill") : UIImage(systemName: "star.circle"), for: .normal)
//        likeBtn.tintColor = selectedState ? .red : .none
    }
    
//    func configure(with model : CatModelF){
//        let image = try? model.image.asURL()
//        catImage.kf.setImage(with: image)
//        catName.text = model.name
//        configureLikedBtn(for: model.liked == true )
//        self.catModels = model
//    }
    
//    func setup(with viewModel: DisplayModel) {
//        let url = URL(string: viewModel.image ?? "")
//
////        userImageView.image = viewModel.image
//        userImageView.kf.setImage(with: url)
//        titleLabel.text = viewModel.photo.title
//        descriptionLabel.text = viewModel.photo.
//    }
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "blacky")
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let name = UILabel()
        name.textColor =  .label
        name.numberOfLines = 1
        name.font = UIFont(name: "Helvetica", size: 16)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Title here"
        return name
    }()
    
    private let descriptionLabel: UILabel = {
        let describe = UILabel()
        describe.textColor = .secondaryLabel
        describe.font = UIFont(name: "Helvetica", size: 16)
        describe.translatesAutoresizingMaskIntoConstraints = false
        return describe
    }()
    
    let topBackArrowButton: UIButton = {
      let button = UIButton()
      button.addTarget(self, action: #selector(didTapFavouriteButton), for: .touchUpInside)
//        button.backgroundColor = .white
      button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "star.circle"), for: .normal)
//        button.backgroundColor = .white
        button.layer.cornerRadius = 50
        button.tintColor = .white
      return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        cellConstraints()
    }
    
    func setupViews() {
        addSubview(userImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(topBackArrowButton)
    }
    
    @objc func didTapFavouriteButton() {
        guard let items = newPhoto  else  { return }
        if items.liked == false {
            items.liked = true
            delegate?.didTapAddBtn(with: items)
        } else {
            items.liked = false
            delegate?.didTapRemoveBtn(with: items)
        }
    }
    
    
    func cellConstraints() {
        setupViews()
        let stack = UIStackView(arrangedSubviews: [titleLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 1
        addSubview(stack)
        
        stack.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 150, leftConstant: 5, bottomConstant: 0, rightConstant: 0)
        
        descriptionLabel.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 160, leftConstant: 5, bottomConstant: 0, rightConstant: 0)
        
        userImageView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: stack.bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 5, bottomConstant: 0, rightConstant: 5)
        userImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.60).isActive = true
        
        topBackArrowButton.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 18, leftConstant: 320, bottomConstant: 150, rightConstant: 25)
        topBackArrowButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        topBackArrowButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    
    func configure(with model: DisplayModel) {
        let image = try? model.image?.asUrl
        userImageView.kf.setImage(with: image)
        titleLabel.text = model.title
        descriptionLabel.text = model.describe
        configureLikedBtn(for: model.liked == true)
        self.newPhoto = model
    }
    
}