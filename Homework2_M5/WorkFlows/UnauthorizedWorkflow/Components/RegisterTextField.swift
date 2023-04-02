//
//  RegisterTextField.swift
//  Homework2_M5
//
//  Created by Aziza A on 24/3/23.
//

import UIKit

final class RegisterTextField: UITextField {
    private let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 40)
    
    init(placeholder: String) {
        super.init(frame: .zero)
        setupTextField(placeholder: placeholder)
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    private func setupTextField(placeholder: String) {
        textColor = .white
        
        layer.cornerRadius = 10
        layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.7505173841)
        layer.borderWidth = 2
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 10, height: 10)
        
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray ])
        font = .systemFont(ofSize: 15, weight: .regular)
        
        heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}
