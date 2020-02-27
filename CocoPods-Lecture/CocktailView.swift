//
//  CocktailView.swift
//  CocoPods-Lecture
//
//  Created by casandra grullon on 2/27/20.
//  Copyright © 2020 casandra grullon. All rights reserved.
//

import UIKit
import SnapKit

class CocktailView: UIView {
    
    public lazy var cocktailNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.numberOfLines = 0
        label.text = "Cocktail Name"
        return label
    }()
    public lazy var cocktailImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    public lazy var ingredients: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        label.text = "Cocktail ingredients"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    private func commonInit() {
        labelConstraints()
        imageConstraints()
        ingredientsConstraints()
    }
    private func imageConstraints() {
        addSubview(cocktailImage)
        cocktailImage.snp.makeConstraints { (make) in
            make.top.leading.bottom.trailing.equalTo(self)
        }
    }
    private func labelConstraints() {
        addSubview(cocktailNameLabel)
        cocktailNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.safeAreaLayoutGuide).inset(20)
            make.centerX.equalToSuperview()
            //inset - bring into the interior of the device
        }
    }
    private func ingredientsConstraints() {
        addSubview(ingredients)
        ingredients.snp.makeConstraints { (make) in
            //make.top.equalTo(cocktailNameLabel).inset(460)
            make.leading.bottom.trailing.equalTo(self.safeAreaLayoutGuide).inset(20)
        }
    }
}
