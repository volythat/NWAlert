//
//  ViewController.swift
//  NWAlertExample
//
//  Created by oneweek02 on 7/4/23.
//

import UIKit
import NWAlert

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func testAlert(_ sender:UIButton){
        let alert = NWAlertController(title: "Are you sure?",
                                      message: "This action can't be undo!",
                                      buttons: [NWAlertButton("Cancel"),
                                                NWAlertButton("Discard",highlight: true)])
        
        alert.options = NWAlertOptions()
        alert.alertButtonAction = { action in
            print("action = \(action.title)")
        }
        self.present(alert , animated: true)
    }

}

