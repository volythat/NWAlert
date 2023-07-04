//
//  NWAlertOptions.swift
//  TestDrawPan
//
//  Created by oneweek02 on 7/4/23.
//

import Foundation
import UIKit

public struct NWAlertOptions {
    public var fontTitle : UIFont = UIFont.boldSystemFont(ofSize: 18)
    public var fontMessage : UIFont = UIFont.systemFont(ofSize: 12)
    public var fontButton : UIFont = UIFont.boldSystemFont(ofSize: 15)
    
    public var colorButtonDefault : UIColor = UIColor(red: 87/255, green: 93/255, blue: 255/255, alpha: 1)
    public var colorButtonDestructive : UIColor = UIColor(red: 245/255, green: 87/255, blue: 87/255, alpha: 1.0)
    public var colorButtonTitleActive : UIColor = .white
    
    public var spacing : CGFloat = 16
    public var heightOfButton : CGFloat = 50
    public var widthOfAlert : CGFloat = 300
    public var cornerViewContent : CGFloat = 12
    public var cornerButton : CGFloat = 8
}
