//
//  MainTabBarController.swift
//  Homework2_M5
//
//  Created by Aziza A on 24/3/23.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
    
    private func generateTabBar() {
        viewControllers = [
        generateVC(
            viewController: MenuViewController(),
            title: "Menu",
            image: UIImage(systemName: "house.fill")
        ),
        generateVC(
            viewController: ProfileViewController(),
            title: "Profile",
            image: UIImage(systemName: "person.fill")
        ),
        generateVC(
            viewController: BasketViewController(),
            title: "Basket",
            image: UIImage(systemName: "basket.fill")
        )]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        let roundLayer = CAShapeLayer()
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width, height: height),
            cornerRadius: height / 2
        )
        roundLayer.path = bezierPath.cgPath
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        tabBar.tintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        tabBar.unselectedItemTintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
}
