//
//  ViewController.swift
//  VistaCodigoTarea
//
//  Created by Merge on 1/07/22.
//

import UIKit

class ViewController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        UITabBar.appearance().tintColor = UIColor(hex: 0x9223E0)

        let nav1 = UINavigationController(rootViewController: UIViewController())
        let nav2 = UINavigationController(rootViewController: UIViewController())
        let nav3 = UINavigationController(rootViewController: ServiciosViewController())
        let nav4 = UINavigationController(rootViewController: UIViewController())
        
        nav1.title = "Inicio"
        nav2.title = "Bienestar"
        nav3.title = "Servicios"
        nav4.title = "Mi perfil"

        viewControllers = [nav1, nav2, nav3, nav4]
        
        guard let items = self.tabBar.items else {
            return
        }
        
        let images = ["house", "heart", "rectangle.stack.fill","person"]
        
        for x in 0..<items.count{
            items[x].image = UIImage(systemName: images[x])
        }
    }
}

