//
//  BasketTableViewCell.swift
//  Homework2_M5
//
//  Created by Aziza A on 2/4/23.
//

import UIKit

class BasketTableViewCell: UITableViewCell {
    
    static var reuseId = String(describing: BasketTableViewCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let cocktailImageView: UIImageView = {
        let cocktailImageView = UIImageView()
        cocktailImageView.contentMode = .scaleToFill
        cocktailImageView.layer.cornerRadius = 20
        cocktailImageView.clipsToBounds = true
        cocktailImageView.image = UIImage(systemName: "")
        return cocktailImageView
    }()
    
    private let cocktailNameLabel: UILabel = {
        let cocktailNameLabel = UILabel()
        cocktailNameLabel.textColor = .white
        cocktailNameLabel.textAlignment = .left
        cocktailNameLabel.font = .systemFont(ofSize: 20, weight: .medium)
        cocktailNameLabel.text = ""
        return cocktailNameLabel
    }()
    
    private let cocktailPriceLabel: UILabel = {
        let cocktailPriceLabel = UILabel()
        cocktailPriceLabel.textColor = .lightGray
        cocktailPriceLabel.textAlignment = .left
        cocktailPriceLabel.font = .systemFont(ofSize: 16, weight: .regular)
        cocktailPriceLabel.text = ""
        return cocktailPriceLabel
    }()
    
    public func configure(image: UIImage, name: String, price: String) {
        self.cocktailImageView.image = image
        self.cocktailNameLabel.text = name
        self.cocktailPriceLabel.text = price
    }
    
    private func makeConstraints() {
        addSubview(cocktailImageView)
        cocktailImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.size.equalTo(80)
        }
        
        addSubview(cocktailNameLabel)
        cocktailNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalTo(cocktailImageView.snp.trailing).offset(20)
            make.width.equalTo(120)
        }
        
        addSubview(cocktailPriceLabel)
        cocktailPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(cocktailNameLabel.snp.bottom).offset(15)
            make.leading.equalTo(cocktailImageView.snp.trailing).offset(20)
            make.width.equalTo(120)
        }
    }
}
