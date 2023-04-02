//
//  CocktailDetailsViewController.swift
//  Homework2_M5
//
//  Created by Aziza A on 25/3/23.
//

import UIKit

class CocktailDetailsViewController: UIViewController {
    
    var cocktail: CocktailModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configureUI()
        initialize()
        makeConstraints()
    }
    
    private func configureUI() {
        guard let cocktail = cocktail else {
            return
        }
        cocktailNameLabel.text = cocktail.strDrink
        descriptionTextLabel.text = cocktail.strInstructions
        ingredient1.text = cocktail.strIngredient1
        ingredient2.text = cocktail.strIngredient2
    }
    
    let backgroundView = UIView()
    var cocktailNameLabel = UILabel()
    var cocktailImageView = UIImageView()
    var cocktailDescriptionLabel = UILabel()
    var descriptionTextLabel = UILabel()
    var ingredientsLabel = UILabel()
    var ingredient1 = IngredientsLabel(text: "")
    var ingredient2 = IngredientsLabel(text: "")
    var buttonView = ButtonView()
    
    private func initialize() {
        backgroundView.backgroundColor = UIColor(red: 48/255, green: 25/255, blue: 52/255,alpha: 1)
        backgroundView.layer.cornerRadius = 35
        backgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        cocktailNameLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        cocktailNameLabel.textColor = UIColor(ciColor: .white)
        
        cocktailDescriptionLabel.text = "Description"
        cocktailDescriptionLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        cocktailDescriptionLabel.textColor = UIColor(ciColor: .white)
        
        descriptionTextLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        descriptionTextLabel.numberOfLines = 0
        descriptionTextLabel.textColor = UIColor(ciColor: .black)
        
        ingredientsLabel.text = "Ingredients"
        ingredientsLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        ingredientsLabel.textColor = UIColor(ciColor: .white)
    }
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [ingredient1, ingredient2])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 5
        
        return stack
    }()
    
    private func makeConstraints() {
        view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(0)
            make.trailing.leading.equalToSuperview().inset(0)
            make.size.equalTo(500)
        }
        
        view.addSubview(cocktailNameLabel)
        cocktailNameLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundView.snp.top).offset(30)
            make.left.equalToSuperview().inset(40)
        }
        
        view.addSubview(cocktailDescriptionLabel)
        cocktailDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(cocktailNameLabel.snp.bottom).offset(30)
            make.left.equalToSuperview().inset(40)
        }
        
        view.addSubview(descriptionTextLabel)
        descriptionTextLabel.snp.makeConstraints { make in
            make.top.equalTo(cocktailDescriptionLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().inset(40)
            make.right.equalToSuperview().inset(40)
        }
        
        view.addSubview(ingredientsLabel)
        ingredientsLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionTextLabel.snp.bottom).offset(30)
            make.left.equalToSuperview().inset(40)
        }
        
        view.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.top.equalTo(ingredientsLabel.snp.bottom).offset(20)
            make.height.equalTo(40)
            make.leading.equalToSuperview().inset(40)
        }
        
        view.addSubview(buttonView)
        buttonView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(50)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(67)
        }
    }
}
