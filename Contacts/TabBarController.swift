//
//  TabBarController.swift
//  Contacts
//
//  Created by Dmitry Maslennikov on 30/04/2022.
//  Copyright © 2022 Dmitry Maslennikov. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupViewControllers()
    }

    private func setupViewControllers() {
        
        viewControllers = [
            createNavigationController(for: ContactsViewController(), title: "Contacts", image: UIImage(systemName: "person.crop.circle.fill")!),
            createNavigationController(for: RecentViewController(), title: "Recent", image: UIImage(systemName: "clock.fill")!)
        ]
    }
    
    private func createNavigationController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        navigationController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navigationController
    }
}
