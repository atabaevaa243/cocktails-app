//
//  IngredientsLabel.swift
//  Homework2_M5
//
//  Created by Aziza A on 25/3/23.
//

import UIKit

final class IngredientsLabel: UILabel {
    init(text: String) {
        super.init(frame: .zero)
        setupIngredientsLabel(text: text)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupIngredientsLabel(text: String) {
        textColor = UIColor(ciColor: .black)
        font = UIFont.systemFont(ofSize: 15, weight: .regular)
    }
}
