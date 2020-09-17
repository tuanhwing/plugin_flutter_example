//
//  Native.swift
//  plugin_example
//
//  Created by Tuan Hwing on 9/17/20.
//

import UIKit

class Native: NSObject {
    
    static let shared = Native();
    
    internal var params:Any?
    internal let eventHandler:EventHandler = EventHandler()
    
    override init() {
        super.init()
    }

    func getPlatformVersion(callback: @escaping FlutterResult) {
        callback(("iOS " + UIDevice.current.systemVersion));
    }
    
    func showViewController() {
        let tempController = TempViewController(nibName: "TempViewController", bundle: Bundle(for: self.classForCoder))
        UIApplication.shared.windows.first?.rootViewController?.present(tempController, animated: true, completion: nil)
    }
    
    func showStoryboard() {
        let storyboard = UIStoryboard(name: "TempStoryboard", bundle: Bundle(for: self.classForCoder))
        let vc = storyboard.instantiateViewController(withIdentifier: "myVCID")
        UIApplication.shared.windows.first?.rootViewController?.present(vc, animated: true)
    }
    
    func callbackFlutter() {
        Native.shared.eventHandler.sink?(["native_param1" : "value1"])
    }
    
}
