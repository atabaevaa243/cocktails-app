//
//  SignupViewController.swift
//  Homework2_M5
//
//  Created by Aziza A on 24/3/23.
//

import UIKit

class SignupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        makeConstraints()
        initialize()
    }
    
    private let signinLabel = UILabel()
    private let nameTextField = RegisterTextField(placeholder: "Enter your name")
    private let phoneTextField = RegisterTextField(placeholder: "Enter your phone")
    private let passwordTextField = RegisterTextField(placeholder: "Enter your password")
    private let signupButton = LoginButton(title: "Sign Up")

    
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
        view.addSubview(signinLabel)
        signinLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(200)
            maker.left.equalToSuperview().inset(30)
        }

        view.addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(signinLabel).inset(90)
            make.trailing.leading.equalToSuperview().inset(30)
        }
        
        view.addSubview(phoneTextField)
        phoneTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField).inset(80)
            make.trailing.leading.equalToSuperview().inset(30)
        }
        
        view.addSubview(passwordTextField)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(phoneTextField).inset(80)
            make.trailing.leading.equalToSuperview().inset(30)
        }
        
        view.addSubview(signupButton)
        signupButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(passwordTextField).inset(100)
            make.trailing.leading.equalToSuperview().inset(30)
        }
    }
    
    private func initialize() {
        signinLabel.text = "Welcome!"
        signinLabel.textColor = UIColor(ciColor: .white)
        signinLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        
        signupButton.backgroundColor = .black
        signupButton.setTitleColor(.white, for: .normal)
        signupButton.addTarget(self, action: #selector(onClickOpenSignupVC), for: .touchUpInside)
    }
    
    @objc
    func onClickOpenSignupVC() {
        navigationController?.pushViewController(MainTabBarController(), animated: true)
    }
}
