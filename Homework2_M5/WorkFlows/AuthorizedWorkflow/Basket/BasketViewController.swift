//
//  BasketViewController.swift
//  Homework2_M5
//
//  Created by Aziza A on 24/3/23.
//

import UIKit

class BasketViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        initialize()
        makeConstraints()
//        initialize()
    }
    
    private var tableView: UITableView!
    private let cocktailImageArray: [UIImage] = [
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "3")!,
        UIImage(named: "4")!,
        UIImage(named: "5")!
    ]
    
    private let cocktailNamesArray: [String] = [
        "Casino",
        "Cafe Savoy",
        "Zipperhead",
        "Cream Soda",
        "Adam"
    ]
    
    private let cocktailPriceArray: [String] = [
        "250 сом",
        "400 сом",
        "450 сом",
        "380 сом",
        "520 сом"
    ]
    
    private func setBackground() {
        let color1 = UIColor(red: 27 / 255, green: 27 / 255, blue: 27 / 255, alpha: 1.0).cgColor
        let color2 = UIColor(red: 84 / 255, green: 22 / 255, blue: 120 / 255, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color1, color2]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }

    private func makeConstraints() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(20)
            make.height.equalTo(1000)
        }
    }

    private func initialize() {
        tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .clear
        tableView.allowsSelection = true
        tableView.register(BasketTableViewCell.self, forCellReuseIdentifier: BasketTableViewCell.reuseId)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension BasketViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktailImageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BasketTableViewCell.reuseId, for: indexPath) as? BasketTableViewCell else {
            fatalError()
        }
        
        let image = self.cocktailImageArray[indexPath.row]
        let name = self.cocktailNamesArray[indexPath.row]
        let price = self.cocktailPriceArray[indexPath.row]
        
        cell.configure(image: image, name: name, price: price)
        
        return cell
    }
}

extension BasketViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(ciColor: .clear)
    }
}
