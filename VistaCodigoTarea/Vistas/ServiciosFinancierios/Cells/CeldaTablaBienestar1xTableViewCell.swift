//
//  CeldaTablaBienestar1xTableViewCell.swift
//  VistaCodigoTarea
//
//  Created by Merge on 2/07/22.
//

import UIKit

class CeldaTablaBienestar1xTableViewCell: UICollectionViewCell {
    
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 12)
        return label
    }()
    
    private lazy var serviciosStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews:[image, label])
        stack.axis = .vertical
        stack.spacing = 2
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    private func setupView(){
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.2
        layer.masksToBounds = false
        agregarSubViews(serviciosStack)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configuracion (modelo: Servicio){
        label.text = modelo.titulo
        image.image = UIImage(named: "ic_prestamos")
    }
    
    private func setupConstraints() {
        serviciosStack.constraintCuadradoCompletoView(self, 30)
    }
    
}
