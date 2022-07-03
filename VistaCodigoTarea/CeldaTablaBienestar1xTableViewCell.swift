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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
     let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont(name: "Geomanist-medium", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configuracion (modelo: Servicio){
        label.text = modelo.titulo
        image.image = UIImage(systemName: modelo.imagenServicio)
//        image.load(url: URL(string:modelo.imagenServicio)!)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            image.topAnchor.constraint(equalTo: self.topAnchor, constant: 25),
            image.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            image.widthAnchor.constraint(equalToConstant: 108),
            image.heightAnchor.constraint(equalToConstant: 95),
            
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 4),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
    
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
