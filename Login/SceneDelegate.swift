//
//  SceneDelegate.swift
//  Login
//
//  Created by Shawn Bierman on 4/14/20.
//  Copyright © 2020 Shawn Bierman. All rights reserved.
//

import UIKit

// Yes userIsLoggedIn is global. It's just a demo.
// You should use a database or UserDefaults

var userIsLoggedIn = false

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        
        // MARK: build our window programatically - no storyboards
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        // the TabBarViewController will be the root and will
        // check authentication during viewWillAppear()
        // before it determines whether to show itself
        // or the LoginViewController
        
        window?.rootViewController = TabBarViewController()
        window?.makeKeyAndVisible()
        
    }
    
    
    // MARK: lifecycle methods saved for posterity
    
    func       sceneDidDisconnect (_ scene: UIScene) { }
    func     sceneDidBecomeActive (_ scene: UIScene) { }
    func    sceneWillResignActive (_ scene: UIScene) { }
    func sceneWillEnterForeground (_ scene: UIScene) { }
    func  sceneDidEnterBackground (_ scene: UIScene) { }

}
