//
//  ButtonView.swift
//  Homework2_M5
//
//  Created by Aziza A on 25/3/23.
//


import SnapKit
import UIKit

class ButtonView: UIView {

    init() {
        super.init(frame: .zero)
        initialize()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var buttonView = UIView()
    private var priceLabel = UILabel()
    private var counterView = UIView()
    private var plusButton = UIButton()
    private var minusButton = UIButton()
    private var amountLabel = UILabel()
    private var basketButton = UIButton()
    
    private func initialize() {
        buttonView.backgroundColor = UIColor.black
        buttonView.layer.cornerRadius = 25
        
        priceLabel.text = "\(500)"
        priceLabel.textColor = .white
        priceLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        
        counterView.backgroundColor = .clear
        counterView.layer.borderWidth = 1
        counterView.layer.borderColor = UIColor.white.cgColor
        counterView.layer.cornerRadius = 20
        
        plusButton.setTitle("+", for: .normal)
        plusButton.setTitleColor(.white, for: .normal)
        
        minusButton.setTitle("-", for: .normal)
        minusButton.setTitleColor(.white, for: .normal)
        
        amountLabel.textColor = .white
        amountLabel.text = "1"
        amountLabel.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        
        basketButton.setImage(UIImage(systemName: "basket.fill"), for: .normal)
        basketButton.backgroundColor = UIColor(red: 4/255, green: 18/255, blue: 38/255, alpha: 0.8)
        basketButton.layer.cornerRadius = 20
        basketButton.addTarget(self, action: #selector(addCocktailToCart), for: .touchUpInside)
    }
    
    @objc func addCocktailToCart() {
        
    }
    
    func makeConstraints() {
        addSubview(buttonView)
        buttonView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(0)
            make.height.equalTo(67)
        }
        
        addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.centerY.equalTo(buttonView)
            make.leading.equalTo(buttonView).inset(20)
        }
        
        addSubview(counterView)
        counterView.snp.makeConstraints { make in
            make.center.equalTo(buttonView)
            make.height.equalTo(45)
            make.width.equalTo(150)
        }
        
        addSubview(plusButton)
        plusButton.snp.makeConstraints { make in
            make.centerY.equalTo(counterView)
            make.leading.equalTo(counterView).inset(5)
        }
        
        addSubview(minusButton)
        minusButton.snp.makeConstraints { make in
            make.centerY.equalTo(counterView)
            make.trailing.equalTo(counterView).inset(5)
        }
        
        addSubview(amountLabel)
        amountLabel.snp.makeConstraints { make in
            make.center.equalTo(counterView)
        }
        
        addSubview(basketButton)
        basketButton.snp.makeConstraints { make in
            make.centerY.equalTo(buttonView)
            make.trailing.equalTo(buttonView).inset(20)
            make.size.equalTo(40)
        }
    }
}
