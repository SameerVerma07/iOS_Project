//
//  SceneDelegate.swift
//  App_Event_Count
//
//  Created by Sameer Verma on 19/04/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var viewController: ViewController?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        viewController  = window?.rootViewController as? ViewController
        viewController?.willConnectToCount += 1
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        viewController?.sceneDidBecomeActiveCount += 1
        viewController?.updateView()
    }

    func sceneWillResignActive(_ scene: UIScene) {
        viewController?.sceneWillResignActiveCount += 1
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        viewController?.sceneWillEnterForegroundCount += 1
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        viewController?.sceneDidEnterBackgroundCount += 1
    }


}

