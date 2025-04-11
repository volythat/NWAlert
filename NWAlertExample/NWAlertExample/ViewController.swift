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
        let alert = NWAlertController(title: "Are you sure? This action can't be undo! This action can't be undo!",
                                      message: "This action can't be undo! This action can't be undo! This action can't be undo!",
                                      image:UIImage(named: "img_multi_devices"),
                                      closeImage:UIImage(named: "icon_close"),
                                      buttons: [NWAlertButton("Login",style: .destructive,highlight: true)])
        let options = NWAlertOptions()
        options.buttonsVertical = false
        options.heightOfPhoto = 193
        options.cornerButton = 25
        options.isShowTextField = true
        options.heightOfTextField = 80
        alert.textField.placeholder = "Write here"
        alert.textField.backgroundColor = .lightGray
        
        options.colorButtonDestructive = UIColor(red: 80/255, green: 215/255, blue: 175/255, alpha: 1)
        alert.options = options
        

        alert.alertButtonWithTextFieldAction = { action , textField in
            print("text = \(textField.text)")
        }
        self.present(alert , animated: true)
    }

}

