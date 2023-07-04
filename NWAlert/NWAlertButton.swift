//
//  NWAlertButton.swift
//  TestDrawPan
//
//  Created by oneweek02 on 7/4/23.
//

import Foundation
import UIKit



public struct NWAlertButton {
    public var title : String = ""
    public var style : NWAlertActionStyle = .default
    public var isHighlight : Bool = false
    
    public init(_ title:String,style:NWAlertActionStyle = .default,highlight:Bool = false) {
        self.title = title
        self.style = style
        self.isHighlight = highlight
    }
}
