//
//  LoginButton.swift
//  Homework2_M5
//
//  Created by Aziza A on 24/3/23.
//

import UIKit

final class LoginButton: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        setupLoginButton(title: title)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLoginButton(title: String) {
        setTitleColor(.black, for: .normal)
        setTitle(title, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 23, weight: .bold)
        
        layer.backgroundColor = UIColor.white.cgColor
        layer.cornerRadius = 10
    }
}
