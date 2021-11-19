//
//  MainCollectionViewCell.swift
//  CodingChallenge
//
//  Created by Decagon on 19/11/2021.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    static var identifier = "MainCollectionViewCellID"
    
    func setup(with viewModel: CodingViewModel) {
        userImageView.image = viewModel.image
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.describe
    }
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        cellConstraints()
    }
    
    func setupViews() {
        addSubview(userImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
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
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
