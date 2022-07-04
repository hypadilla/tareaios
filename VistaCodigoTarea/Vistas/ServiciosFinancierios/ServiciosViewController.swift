//
//  ServiciosViewController.swift
//  VistaCodigoTarea
//
//  Created by Merge on 2/07/22.
//

import UIKit

let servicios2 = [
    Servicio(titulo: "Préstamo", imagenServicio: "s3://qiip-imagenes-app/moneda_onboarding.png", tamanioImagen: 2),
    Servicio(titulo: "AFORE", imagenServicio: "s3://qiip-imagenes-app/diagramabarras_onboarding.png", tamanioImagen: 2),
    Servicio(titulo: "Deudas", imagenServicio: "s3://qiip-imagenes-app/monedas_onboarding.png", tamanioImagen: 2),
    Servicio(titulo: "Ahorro e inversión", imagenServicio: "s3://qiip-imagenes-app/alcancia_onboarding.png", tamanioImagen: 2),
    Servicio(titulo: "Tarjetas de crédito", imagenServicio: "s3://qiip-imagenes-app/billeter_onboarding.png", tamanioImagen: 2),
    Servicio(titulo: "Seguro", imagenServicio: "s3://qiip-imagenes-app/escudoseguridad_onboarding.png", tamanioImagen: 2),
    Servicio(titulo: "Movilidad", imagenServicio: "s3://qiip-imagenes-app/verificar_onboarding.png", tamanioImagen: 2)
]

let servicios = [
    Servicio(titulo: "Préstamo", imagenServicio: "ic_prestamos", tamanioImagen: 2),
    Servicio(titulo: "AFORE", imagenServicio: "ic_afore", tamanioImagen: 1),
    Servicio(titulo: "Deudas", imagenServicio: "ic_deudas", tamanioImagen: 1),
    Servicio(titulo: "Ahorro e inversión", imagenServicio: "ic_ahorro", tamanioImagen: 2),
    Servicio(titulo: "Tarjetas de crédito", imagenServicio: "ic_tarjeta", tamanioImagen: 2),
    Servicio(titulo: "Seguro", imagenServicio: "ic_seguro", tamanioImagen: 1),
    Servicio(titulo: "Movilidad", imagenServicio: "ic_movilidad", tamanioImagen: 1)
]

class ServiciosViewController: UIViewController {
    
    unowned var serviciosFinancierosView: ServiciosFinancierosView { return self.view as! ServiciosFinancierosView }
    
    
    override func loadView() {
        view = ServiciosFinancierosView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: serviciosFinancierosView.tituloVista)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: serviciosFinancierosView.btnComentarioTabBar)
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





