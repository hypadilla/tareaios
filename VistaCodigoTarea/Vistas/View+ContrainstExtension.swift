//
//  View+ContrainstExtension.swift
//  VistaCodigoTarea
//
//  Created by Sergio Ivan Vélez Valdés on 3/07/22.
//

import UIKit

extension UIView {
    
    func agregarSubviewsLista(_ subviews: [UIView]){
        subviews.forEach(self.agregarSubViews)
    }
    
    func agregarSubViews(_ subview: UIView){
        subview.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(subview)
    }
    
    func constraintCuadradoCompletoView(_ view: UIView,_ dimensionVertical: CGFloat = 0,_ dimensionHorizontal: CGFloat = 0){
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: dimensionHorizontal),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 - dimensionHorizontal),
            self.topAnchor.constraint(equalTo: view.topAnchor, constant: dimensionVertical),
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0 -  dimensionVertical)
        ])
    }
}
