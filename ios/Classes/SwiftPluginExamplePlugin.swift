import Flutter
import UIKit

public class SwiftPluginExamplePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "PluginDemo", binaryMessenger: registrar.messenger())
    let instance = SwiftPluginExamplePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method == "getPlatformVersion") {
        result("iOS " + UIDevice.current.systemVersion)
    }
    else if (call.method == "showAlert") {
        // create the alert
        let alert = UIAlertController(title: "My Title", message: "This is my native message.", preferredStyle: UIAlertController.Style.alert)
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
        print ("lollllllllll ---- log native");
        result("lolll showExampleView")
    }
  }
}
