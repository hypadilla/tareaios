//
//  CeldaTablaBienestar2xCollectionViewCell.swift
//  VistaCodigoTarea
//
//  Created by Merge on 4/07/22.
//

import UIKit

class CeldaTablaBienestar2xCollectionViewCell: UICollectionViewCell {
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
    
    //    private lazy var serviciosStack: UIStackView = {
    //        let stack = UIStackView(arrangedSubviews:[image, label])
    //        stack.axis = .vertical
    //        stack.spacing = 2
    //        stack.alignment = .leading
    //        stack.distribution = .fillProportionally
    //        return stack
    //    }()
    
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
        //        agregarSubViews(serviciosStack)
        
        
        agregarSubviewsLista([image,label])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configuracion (modelo: Servicio){
        label.text = modelo.titulo
        image.image = UIImage(named: modelo.imagenServicio)
    }
    
    private func setupConstraints() {
        //        serviciosStack.constraintCuadradoCompletoView(self, 30)
        NSLayoutConstraint.activate([
            
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            image.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            image.widthAnchor.constraint(equalToConstant: 54),
            image.heightAnchor.constraint(equalToConstant: 54),
            
            label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 8),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
        ])
    }
    
}
