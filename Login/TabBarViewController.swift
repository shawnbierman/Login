//
//  TabBarViewController.swift
//  Login
//
//  Created by Shawn Bierman on 4/14/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemTeal
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        checkIfUserIsAuthenticated()
    }
    

    fileprivate func checkIfUserIsAuthenticated() {
        
        if userIsLoggedIn {
            
            // go right to the TabBarController
            // since the user is already authenticated
            
            createViewControllers()
            userIsLoggedIn.toggle()
            
        } else {
            
            // user does not appear to be authenticated
            // display the LoginViewController so they can login
            
            let loginController = LoginViewController()
            loginController.modalPresentationStyle = .fullScreen
            
            present(loginController, animated: true) {
                userIsLoggedIn.toggle()
            }
        }
    }
    
    
    private func createViewControllers() {
        
        let firstViewController = FirstViewController()
        let secondViewController = SecondViewController()
        
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        secondViewController.tabBarItem =  UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        let firstNav = UINavigationController(rootViewController: firstViewController)
        let secondNav = UINavigationController(rootViewController: secondViewController)
        
        self.viewControllers = [firstNav, secondNav]
        
    }
}

// MARK: - Sample ViewControllers for ease of demo

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemTeal
        title = "Favorites"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "logout", style: .done, target: self, action: #selector(logout))
    }
    
    
    @objc private func logout() {
        let loginController = LoginViewController()
        loginController.modalPresentationStyle = .fullScreen
        
        present(loginController, animated: true) {
            userIsLoggedIn.toggle()
        }
    }
    
}

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        title = "Bookmarks"
    }
}
