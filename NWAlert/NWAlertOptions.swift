//
//  NWAlertOptions.swift
//  TestDrawPan
//
//  Created by oneweek02 on 7/4/23.
//

import Foundation
import UIKit

public class NWAlertOptions {
    public var fontTitle : UIFont = UIFont.boldSystemFont(ofSize: 18)
    public var colorTitle : UIColor = .black
    public var fontMessage : UIFont = UIFont.systemFont(ofSize: 12)
    public var colorMessage : UIColor = .black
    public var fontButton : UIFont = UIFont.boldSystemFont(ofSize: 15)
    
    public var colorButtonDefault : UIColor = UIColor(red: 87/255, green: 93/255, blue: 255/255, alpha: 1)
    public var colorButtonDestructive : UIColor = UIColor(red: 245/255, green: 87/255, blue: 87/255, alpha: 1.0)
    public var colorButtonTitleActive : UIColor = .white
    public var backgroundContentColor : UIColor = .white
    
    public var spacing : CGFloat = 16
    public var heightOfPhoto : CGFloat = 150
    public var heightOfButton : CGFloat = 50
    public var heightOfTextField : CGFloat = 50
    public var widthOfAlert : CGFloat = 300
    public var cornerViewContent : CGFloat = 12
    public var cornerButton : CGFloat = 8
    public var isAllowTapBackground : Bool = true
    public var buttonsVertical : Bool = false
    
    public var isShowTextField : Bool = false
    
    
    public init(fontTitle: UIFont = UIFont.boldSystemFont(ofSize: 18),
                colorTitle: UIColor = .black,
                fontMessage: UIFont = UIFont.systemFont(ofSize: 12),
                colorMessage: UIColor = .black,
                fontButton: UIFont = UIFont.boldSystemFont(ofSize: 15),
                colorButtonDefault: UIColor = UIColor(red: 87/255, green: 93/255, blue: 255/255, alpha: 1),
                colorButtonDestructive: UIColor = UIColor(red: 245/255, green: 87/255, blue: 87/255, alpha: 1.0),
                colorButtonTitleActive: UIColor = .white,
                backgroundContentColor: UIColor = .white,
                spacing: CGFloat = 16,
                heightOfButton: CGFloat = 50,
                widthOfAlert: CGFloat = 300,
                cornerViewContent: CGFloat = 12,
                cornerButton: CGFloat = 8){
        self.fontTitle = fontTitle
        self.colorTitle = colorTitle
        self.fontMessage = fontMessage
        self.colorMessage = colorMessage
        self.fontButton = fontButton
        self.colorButtonDefault = colorButtonDefault
        self.colorButtonDestructive = colorButtonDestructive
        self.colorButtonTitleActive = colorButtonTitleActive
        self.backgroundContentColor = backgroundContentColor
        self.spacing = spacing
        self.heightOfButton = heightOfButton
        self.widthOfAlert = widthOfAlert
        self.cornerViewContent = cornerViewContent
        self.cornerButton = cornerButton
    }
}
