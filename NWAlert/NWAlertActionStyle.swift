//
//  NWAlertActionStyle.swift
//  TestDrawPan
//
//  Created by oneweek02 on 7/4/23.
//

import Foundation
import UIKit

public enum NWAlertActionStyle : Int {
    case `default` = 0
    case destructive = 1
}

public class CTTextField: UITextField {

   let inset: CGFloat = 8

   // placeholder position
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
       return bounds.insetBy(dx: inset, dy: inset)
   }

   // text position
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
       return bounds.insetBy(dx: inset, dy: inset)
   }
}
