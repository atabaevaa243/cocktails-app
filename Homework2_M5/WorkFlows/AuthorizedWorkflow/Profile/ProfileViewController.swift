//
//  ProfileViewController.swift
//  Homework2_M5
//
//  Created by Aziza A on 24/3/23.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        makeConstraints()
        initialize()
    }
    
    private let profileLabel = UILabel()
    private let profileImageView = UIImageView()
    private let userNameLabel = UILabel()
    private let numberTextField = RegisterTextField(placeholder: "Your phone")
    private let codeTextField = RegisterTextField(placeholder: "Your code")
    
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
        view.addSubview(profileLabel)
        profileLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(120)
            maker.left.equalToSuperview().inset(30)
        }
        
        view.addSubview(profileImageView)
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(profileLabel).offset(80)
            make.centerX.equalToSuperview()
            make.height.equalTo(150)
            make.width.equalTo(150)
        }
        
        view.addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(numberTextField)
        numberTextField.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(50)
            make.trailing.leading.equalToSuperview().inset(30)
        }
        
        view.addSubview(codeTextField)
        codeTextField.snp.makeConstraints { make in
            make.top.equalTo(numberTextField.snp.bottom).offset(20)
            make.trailing.leading.equalToSuperview().inset(30)
        }
    }
    
    private func initialize() {
        profileLabel.text = "Profile"
        profileLabel.textColor = UIColor(ciColor: .white)
        profileLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        
        profileImageView.image = UIImage(systemName: "person")
        profileImageView.tintColor = UIColor.white
//        profileImageView.backgroundColor = UIColor(ciColor: .white)
        profileImageView.layer.cornerRadius = 150 / 2
        profileImageView.layer.borderWidth = 3
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderColor = UIColor.white.cgColor
        
        userNameLabel.text = "Sanita Queen"
        userNameLabel.textColor = UIColor(ciColor: .white)
        userNameLabel.font = UIFont.systemFont(ofSize: 25, weight: .regular)
    }
}
