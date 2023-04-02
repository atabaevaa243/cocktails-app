//
//  CocktailsCollectionViewCell.swift
//  Homework2_M5
//
//  Created by Aziza A on 25/3/23.
//

import SnapKit
import UIKit

class CocktailsCollectionCell: UICollectionViewCell {
    
    static var reuseId = String(describing: CocktailsCollectionCell.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        inititialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func display(item: CocktailModel) {
        let imgUrl = item.strDrinkThumb
        imageView.downloaded(from: imgUrl)
        drinkNameLabel.text = item.strDrink
    }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let drinkNameLabel: UILabel = {
        let drinkNameLabel = UILabel()
        drinkNameLabel.textColor = .white
        drinkNameLabel.font = UIFont.systemFont(ofSize: 20)
        drinkNameLabel.numberOfLines = 2
        drinkNameLabel.textAlignment = .center
        
        return drinkNameLabel
    }()
}

private extension CocktailsCollectionCell {
    func inititialize() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.size.equalTo(120)
        }
        
        addSubview(drinkNameLabel)
        drinkNameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(110)
        }
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
