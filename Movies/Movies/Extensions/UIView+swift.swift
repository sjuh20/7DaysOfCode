//
//  UIColor+swift.swift
//  Movies
//
//  Created by Ana Julia Brito de Souza on 10/01/23.
//

import Foundation
import UIKit

extension UIView {
    
    func gradientView() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [UIColor(named: "Gradient1")?.cgColor, UIColor(named: "Gradient2")?.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        self.layer.addSublayer(gradientLayer)
    }
}


