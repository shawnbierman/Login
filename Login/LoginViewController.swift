//
//  LoginViewController.swift
//  Login
//
//  Created by Shawn Bierman on 4/14/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let button = UIButton()
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
        layoutUI()
        
    }
    

    // MARK: - Private methods
    
    private func layoutUI() {
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "logout", style: .done, target: self, action: nil)
        
        
        // just a simple button to trigger buttonAction()
        
        view.addSubview(button)
        
        button.setTitle("login", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        
    }
    
    @objc private func buttonAction() {
        dismiss(animated: true)
    }
}
