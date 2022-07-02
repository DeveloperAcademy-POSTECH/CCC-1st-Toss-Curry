//
//  SceneDelegate.swift
//  Toss
//
//  Created by 이재웅 on 2022/07/02.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        self.window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .systemBackground
        
        self.window?.rootViewController = ViewController()
        self.window?.makeKeyAndVisible()
    }
}

