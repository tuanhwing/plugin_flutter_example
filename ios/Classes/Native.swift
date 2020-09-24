//
//  Native.swift
//  plugin_example
//
//  Created by Tuan Hwing on 9/17/20.
//

import UIKit
import VNPTframework

class Native: NSObject, TextEditChangedObserver,CommunicationWithAnother {
    
    static let shared = Native();
    
    internal var params:Any?
    internal let eventHandler:EventHandler = EventHandler()
    
    override init() {
        super.init()
        VNPTNative.shared.addObserver(self)
        VNPTNative.shared.communication = self
    }

    func getPlatformVersion(callback: @escaping FlutterResult) {
        callback(("iOS " + VNPTNative.shared.getPlatformVersion()));
    }
    
    func showStoryboard(params:Dictionary<String, String>? = nil) {
        VNPTNative.shared.showStoryboard(params: params)
    }
    
    func textEditChanged(text: String?) {
        Native.shared.eventHandler.sink?(["native1" : text])
    }
    
    func openNative2(text: String) {
        Native.shared.eventHandler.sink?(["open_native2" : true, "param" : text])
    }
}
