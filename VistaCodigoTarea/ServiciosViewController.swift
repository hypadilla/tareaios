//
//  ServiciosViewController.swift
//  VistaCodigoTarea
//
//  Created by Merge on 2/07/22.
//

import UIKit

struct Servicio{
    let titulo: String
    let imagenServicio: String
}

let servicios2 = [
    Servicio(titulo: "Préstamo", imagenServicio: "s3://qiip-imagenes-app/moneda_onboarding.png"),
    Servicio(titulo: "AFORE", imagenServicio: "s3://qiip-imagenes-app/diagramabarras_onboarding.png"),
    Servicio(titulo: "Deudas", imagenServicio: "s3://qiip-imagenes-app/monedas_onboarding.png"),
    Servicio(titulo: "Ahorro e inversión", imagenServicio: "s3://qiip-imagenes-app/alcancia_onboarding.png"),
    Servicio(titulo: "Targetas de crédito", imagenServicio: "s3://qiip-imagenes-app/billeter_onboarding.png"),
    Servicio(titulo: "Seguro", imagenServicio: "s3://qiip-imagenes-app/escudoseguridad_onboarding.png"),
    Servicio(titulo: "Movilidad", imagenServicio: "s3://qiip-imagenes-app/verificar_onboarding.png")
]

let servicios = [
    Servicio(titulo: "Préstamo", imagenServicio: "house"),
    Servicio(titulo: "AFORE", imagenServicio: "pencil"),
    Servicio(titulo: "Deudas", imagenServicio: "lasso"),
    Servicio(titulo: "Ahorro e inversión", imagenServicio: "trash"),
    Servicio(titulo: "Targetas de crédito", imagenServicio: "folder"),
    Servicio(titulo: "Seguro", imagenServicio: "tray"),
    Servicio(titulo: "Movilidad", imagenServicio: "doc")
]

class ServiciosViewController: UIViewController, UICollectionViewDataSource {
    
    private let tituloVista: UILabel = {
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
    
    private lazy var btnComentarioTabBar: UIButton = {
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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tablaServicios: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(CeldaTablaBienestar1xTableViewCell.self, forCellWithReuseIdentifier: "CeldaTablaBienestar1xTableViewCell")
        collectionView.backgroundColor = .blue
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: tituloVista)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: btnComentarioTabBar)
        
        tablaServicios.dataSource = self
        
        [vLineSeparator, subtituloLabel, tablaServicios].forEach(view.addSubview)
        
        setupConstraints()
    }
    
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            vLineSeparator.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            vLineSeparator.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            vLineSeparator.widthAnchor.constraint(equalToConstant: 29),
            vLineSeparator.heightAnchor.constraint(equalToConstant: 2),
            
            subtituloLabel.topAnchor.constraint(equalTo: vLineSeparator.bottomAnchor, constant: 24),
            subtituloLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            subtituloLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tablaServicios.topAnchor.constraint(equalTo: subtituloLabel.bottomAnchor, constant: 16),
            tablaServicios.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            tablaServicios.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            tablaServicios.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    @objc func btnComentarioTabBarOnClicked(_ sender: Any){
        print("He realizado click")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return servicios.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CeldaTablaBienestar1xTableViewCell", for: indexPath) as? CeldaTablaBienestar1xTableViewCell
        let model = servicios[indexPath.row]
        cell!.configuracion(modelo: model)
//        cell!.label.text = model.titulo
        cell!.backgroundColor = .white
        return cell!
        
    }
}

extension UIColor {
    convenience init(hex: UInt, alpha: CGFloat = 1) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}





