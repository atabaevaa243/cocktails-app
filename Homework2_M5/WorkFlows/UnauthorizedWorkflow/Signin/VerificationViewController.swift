//
//  VerificationViewController.swift
//  Homework2_M5
//
//  Created by Aziza A on 1/4/23.
//

import UIKit
import SnapKit

class VerificationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        initialize()
        makeConstraints()
    }
    private let authApi = AuthorizationManager()
    private let titleLabel = UILabel()
    private let confirmButton = LoginButton(title: "Confirm")
    
    private let verificationTextField = RegisterTextField(placeholder: "Verification Code")
    
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
    
    private func initialize() {
        titleLabel.text = "Please enter verification code"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.backgroundColor = .black
        confirmButton.addTarget(self, action: #selector(confirmButtonTap), for: .touchUpInside)
    }

    @objc func confirmButtonTap() {
        guard let vCode = verificationTextField.text, !vCode.isEmpty else {
            return
        }
        authApi.tryToSignIn(smsCode: vCode) { result in
            if case .success = result {
                self.present(SplashViewController(), animated: true)
            } else {
                fatalError()
            }
        }
    }
    
    private func makeConstraints() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(300)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        
        view.addSubview(verificationTextField)
        verificationTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(33)
            make.center.equalToSuperview()
        }
        
        view.addSubview(confirmButton)
        confirmButton.snp.makeConstraints { make in
            make.top.equalTo(verificationTextField.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(33)
            make.height.equalTo(47)
        }
    }
}
