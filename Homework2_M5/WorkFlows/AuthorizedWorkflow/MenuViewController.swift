//
//  MenuViewController.swift
//  Homework2_M5
//
//  Created by Aziza A on 21/3/23.
//

import UIKit
import SnapKit

class MenuViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        initialize()
        makeConstraints()
        fetchCocktail()
    }
    
    private let menuLabel = UILabel()
    private let introText = UILabel()
    private let searchBarMenu = UISearchBar()
    private var collectionView: UICollectionView!
    private var cocktailsArray: [CocktailModel] = []
    private var isLoading = false
    
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

    private func showError(_ error: Error) {
        let alert = UIAlertController(
            title: "Error",
            message: "\(error.localizedDescription)",
            preferredStyle: .alert
        )
        let acceptAction = UIAlertAction(
            title: "OK",
            style: .destructive
        )
        alert.addAction(acceptAction)
        present(alert, animated: true)
    }
    
    private func fetchCocktail() {
        isLoading = true
        Task {
            do {
                let model = try await NetworkService.shared.fetchCocktails()
                isLoading = false
                cocktailsArray = model.drinks ?? []
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } catch {
                self.showError(error)
            }
        }
    }
    
    private func searchCocktail(by word: String) {
        isLoading = true
        Task {
            do {
                let model = try await NetworkService.shared.searchCocktails(word)
                isLoading = false
                cocktailsArray = model.drinks ?? []
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } catch {
                self.showError(error)
            }
        }
    }
    
    private func makeConstraints() {
        view.addSubview(menuLabel)
        menuLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(introText)
        introText.snp.makeConstraints { make in
            make.top.equalTo(menuLabel).inset(60)
            make.trailing.leading.equalToSuperview().inset(35)
        }
        
        searchBarMenu.delegate = self
        view.addSubview(searchBarMenu)
        searchBarMenu.snp.makeConstraints { make in
            make.top.equalTo(introText).inset(60)
            make.trailing.leading.equalToSuperview().inset(35)
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(30)
            make.top.equalTo(searchBarMenu).inset(70)
            make.height.equalTo(500)
        }
    }
    
    private func initialize() {
        menuLabel.text = "Enjoy"
        menuLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        menuLabel.textColor = UIColor(ciColor: .white)
        
        introText.text = "Discover cocktails in a way you never experienced before!"
        introText.font = UIFont.systemFont(ofSize: 19, weight: .regular)
        introText.numberOfLines = 0
        introText.textAlignment = .center
        introText.textColor = UIColor(ciColor: .white)
        
        let image = UIImage()
        searchBarMenu.backgroundImage = image
        searchBarMenu.placeholder = "Search Menu"
        searchBarMenu.searchTextField.textColor = .white
        
        let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.register(CocktailsCollectionCell.self, forCellWithReuseIdentifier: CocktailsCollectionCell.reuseId)
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.backgroundColor = .clear
            collectionView.showsVerticalScrollIndicator = false
    }
}

extension MenuViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)  {
        if !isLoading {
            searchCocktail(by: searchText)
        }
    }
}

extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cocktailsArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CocktailsCollectionCell.reuseId, for: indexPath) as! CocktailsCollectionCell
        let model = cocktailsArray[indexPath.row]
        cell.display(item: model)
        return cell
    }
}

extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CocktailDetailsViewController()
        vc.cocktailNameLabel.text = cocktailsArray[indexPath.row].strDrink
        vc.descriptionTextLabel.text = cocktailsArray[indexPath.row].strInstructions
        vc.ingredient1.text = cocktailsArray[indexPath.row].strIngredient1
        vc.ingredient2.text = cocktailsArray[indexPath.row].strIngredient2
        navigationController?.pushViewController(vc, animated: true)
    }
}

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .blue
    }
}

class ThirdViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Basket"
        view.backgroundColor = .lightGray
    }
}
