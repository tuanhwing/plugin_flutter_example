//
//  RootViewController.swift
//  plugin_example
//
//  Created by Tuan Hwing on 9/17/20.
//

import UIKit

class RootViewController: UIViewController {

    @IBOutlet weak var lbParams: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let params:Dictionary = Native.shared.params as? Dictionary<String, String> else {
            lbParams.text = "NO PARAMS"
            return
        }
        var value = ""
        for element in params {
            value += "\(element.key)=\(element.value) "
        }
        lbParams.text = value
    }
    
    @IBAction func btnDismiss_TouchUpInside(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnCallBackFlutter_TouchUpInside(_ sender: Any) {
        Native.shared.callbackFlutter()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
