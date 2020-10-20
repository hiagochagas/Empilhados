//
//  TabBarVC.swift
//  Empilhados
//
//  Created by Hiago Chagas on 20/10/20.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
           super.viewDidLoad()
           setupTabBar()
       }
       
       func setupTabBar(){
           let storageNavController = setupVc(rootViewController: StorageVC(), image: UIImage(systemName: "shippingbox.fill")!, title: "Estoque")
           let deliveryNavController = setupVc(rootViewController: DeliveryVC(), image: UIImage(named: "deliveryTruck")!, title: "Entregas")
        viewControllers = [storageNavController, deliveryNavController]
       }
       func setupVc(rootViewController: UIViewController, image: UIImage, title: String) -> UINavigationController{
            rootViewController.title = title
        let viewController = UINavigationController(rootViewController: rootViewController)
               viewController.tabBarItem.image = image
               viewController.tabBarItem.selectedImage = image
                viewController.tabBarItem.image?.withRenderingMode(.alwaysOriginal)
                viewController.tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)
               viewController.title = title
           return viewController
       }
    
}
