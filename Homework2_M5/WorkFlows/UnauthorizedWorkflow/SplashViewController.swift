//
//  SplashViewController.swift
//  Homework2_M5
//
//  Created by Aziza A on 2/4/23.
//

import UIKit

class SplashViewController: UIViewController {

    private let keychain = KeyChainManager.shared
    private let encoder = JSONDecoder()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970

        if let data = keychain.read(with: Constants.Keychain.service, Constants.Keychain.account),
           let date = try? decoder.decode(Date.self, from: data),
           date > Date() {
            let vc = MainTabBarController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false)
        } else {
            let vc = SigninViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false)
        }
    }
}
