//
//  FavouriteCollectionViewCell.swift
//  CodingChallenge
//
//  Created by  Decagon on 20/11/2021.
//

import UIKit

protocol collectionViewCellDelegate: AnyObject {
    func didTapRemoveBtn(with index: Int)
}


class FavouriteCollectionViewCell: UICollectionViewCell {
 
    static var identifier = "FavouriteCollectionViewCellID"
    
    weak var delegate: collectionViewCellDelegate?
    private var catModels: catMod?
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .red
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
    
    private let topBackArrowButton: UIButton = {
      let button = UIButton()
      button.addTarget(self, action: #selector(didTapTopBackArrowButton), for: .touchUpInside)
//        button.backgroundColor = .white
      button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "star.circle"), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 50
        button.tintColor = .gray
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
    
    @objc func didTapTopBackArrowButton() {
        
        guard catModels != nil  else  { return }
        delegate?.didTapRemoveBtn(with: tag)
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
        
        topBackArrowButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.10).isActive = true
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with cat: catMod) {
        let image = try? cat.image.asUrl
        userImageView.kf.setImage(with: image)
        titleLabel.text = cat.title
        descriptionLabel.text = cat.describe
        self.catModels = cat
    }
}
