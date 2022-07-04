//
//  ServiciosViewController.swift
//  VistaCodigoTarea
//
//  Created by Merge on 2/07/22.
//

import UIKit

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





