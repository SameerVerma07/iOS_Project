//
//  ViewController.swift
//  App_Event_Count
//
//  Created by Sameer Verma on 19/04/24.
//

import UIKit
 

class ViewController: UIViewController {
    var appdelgent = (UIApplication.shared.delegate as! AppDelegate)
    
    
    @IBOutlet var didFinishLaunchingWithOptions: UILabel!
    @IBOutlet var configurationForConnecting: UILabel!
    @IBOutlet var willConnectTo: UILabel!
    @IBOutlet var sceneDidBecomeActive: UILabel!
    @IBOutlet var sceneWillResignActive: UILabel!
    @IBOutlet var sceneWillEnterForeground: UILabel!
    @IBOutlet var sceneDidEnterBackground: UILabel!
    var didFinishLaunchingWithOptionsCount = 0
    var configurationForConnectingCount=0
    var willConnectToCount = 0
    var sceneDidBecomeActiveCount = 0
    var sceneWillResignActiveCount = 0
    var sceneWillEnterForegroundCount = 0
    var sceneDidEnterBackgroundCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateView(){
        didFinishLaunchingWithOptions.text = "App has Launch  ===  \(didFinishLaunchingWithOptionsCount + 1)"
        
        configurationForConnecting.text = "Configuration For Connecting Count  === \(configurationForConnectingCount + 1)"
        
        willConnectTo.text = "Will Connect To Count === \(willConnectToCount)"
    
        
        sceneDidBecomeActive.text = "Scene Did Become Active Count === \(sceneDidBecomeActiveCount)"
        
        sceneWillResignActive.text = "Scene Will Resign Active Count === \(sceneWillResignActiveCount)"
        
        sceneWillEnterForeground.text = " Scene Will Enter Foreground Count === \(sceneWillEnterForegroundCount)"
        
        sceneDidEnterBackground.text = "Scene Did Enter Background Count === \(sceneDidEnterBackgroundCount)"
        
    }


}

