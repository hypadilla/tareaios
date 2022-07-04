//
//  ServiciosFinancierosView.swift
//  VistaCodigoTarea
//
//  Created by Sergio Ivan Vélez Valdés on 3/07/22.
//

import Foundation
import UIKit


class ServiciosFinancierosView: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let tituloVista: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont(name: "Geomanist-medium", size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        let attrs1 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 22), NSAttributedString.Key.foregroundColor : UIColor(hex: 0x4A4A4A)]
        let attrs2 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 22), NSAttributedString.Key.foregroundColor : UIColor(hex: 0x9223E0)]
        let attributedString1 = NSMutableAttributedString(string:"Soluciones ", attributes:attrs1)
        let attributedString2 = NSMutableAttributedString(string:"Financieras", attributes:attrs2)
        attributedString1.append(attributedString2)
        label.attributedText = attributedString1
        return label
    }()
    
    lazy var btnComentarioTabBar: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(btnComentarioTabBarOnClicked), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "bubble.right"), for: .normal)
        button.tintColor = UIColor(hex: 0x9223E0)
        return button
    }()
    
    private lazy var vLineSeparator: UIView = {
        let mView = UIView()
        mView.backgroundColor = UIColor(hex: 0x4A4A4A)
        mView.translatesAutoresizingMaskIntoConstraints = false
        return mView
    }()
    
    private let subtituloLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Encuentra los productos que necesitas para tu bienestar financiero."
        label.font = UIFont(name: "Geomanist", size: 14)
        return label
    }()
    
    let tablaServicios: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(CeldaTablaBienestar1xTableViewCell.self, forCellWithReuseIdentifier: "CeldaTablaBienestar1xTableViewCell")
        collectionView.backgroundColor = UIColor(named: "FondoGris")
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    required init(){
        super.init(frame: CGRect.zero)
        setupView()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder) has not been implemented")
    }
    
    private func setupView(){
        backgroundColor = UIColor(named: "FondoGris")
        agregarSubviewsLista([vLineSeparator, subtituloLabel, tablaServicios])
        tablaServicios.dataSource = self
        tablaServicios.delegate = self
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            vLineSeparator.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            vLineSeparator.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            vLineSeparator.widthAnchor.constraint(equalToConstant: 29),
            vLineSeparator.heightAnchor.constraint(equalToConstant: 2),
            
            subtituloLabel.topAnchor.constraint(equalTo: vLineSeparator.bottomAnchor, constant: 24),
            subtituloLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 26),
            subtituloLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            tablaServicios.topAnchor.constraint(equalTo: subtituloLabel.bottomAnchor, constant: 16),
            tablaServicios.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 26),
            tablaServicios.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            tablaServicios.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc func btnComentarioTabBarOnClicked(_ sender: Any){
        print("He realizado click")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return servicios.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 148.0, height: 168.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.contentInset = UIEdgeInsets(top: 5, left: 16, bottom: 5, right: 16)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CeldaTablaBienestar1xTableViewCell", for: indexPath) as? CeldaTablaBienestar1xTableViewCell
        let model = servicios[indexPath.row]
        cell!.configuracion(modelo: model)
        cell?.layoutIfNeeded()
        return cell!
    }
    
}
