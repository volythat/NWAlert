//
//  HNAlertController.swift
//  TestDrawPan
//
//  Created by oneweek02 on 7/4/23.
//

import UIKit
import SnapKit

public class NWAlertController: UIViewController {
    
    lazy var viewContent : UIView = {
        let v = UIView(frame: CGRect(x: 0, y: 0, width: 270, height: 270))
        v.backgroundColor = .white
        return v
    }()
    lazy var btnCloseBg : UIButton = {
        let v = UIButton(frame: .zero)
        v.backgroundColor = .black.withAlphaComponent(0.5)
        return v
    }()
    lazy var btnClose : UIButton = {
        let v = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        return v
    }()
    lazy var lbTitle : UILabel = {
        let lb = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 34))
        lb.text = ""
        lb.font = UIFont.boldSystemFont(ofSize: 15)
        lb.textColor = .black
        lb.textAlignment = .center
        lb.alpha = 1
        return lb
    }()
    lazy var lbMessage : UILabel = {
        let lb = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 34))
        lb.text = ""
        lb.font = UIFont.systemFont(ofSize: 13)
        lb.textColor = .black
        lb.textAlignment = .center
        lb.alpha = 1
        return lb
    }()
    public lazy var textField : CTTextField = {
        let lb = CTTextField(frame: CGRect(x: 0, y: 0, width: 100, height: 34))
        lb.text = ""
        lb.font = UIFont.systemFont(ofSize: 13)
        lb.textColor = .black
        lb.alpha = 1
        return lb
    }()
    lazy var imvPhoto : UIImageView = {
        let lb = UIImageView(frame: CGRect(x: 0, y: 0, width: 240, height: 150))
        lb.alpha = 1
        lb.contentMode = .scaleAspectFit
        return lb
    }()
    lazy var stackButtons : UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.distribution = .fillEqually
        stack.spacing = 8
        return stack
    }()
    
    var titleAlert : String = ""
    var message : String? = nil
    var image : UIImage? = nil
    var imageClose : UIImage? = nil
    var buttons : [NWAlertButton] = []
    
    public var options = NWAlertOptions()
    public var alertButtonAction : ((_ action:NWAlertButton)->Void)?
    public var alertButtonWithTextFieldAction : ((_ action:NWAlertButton,_ textField:UITextField)->Void)?
    public var alertCloseAction : (()->Void)?
    
    //MARK: - Init
    public init(title:String,
                message:String? = nil,
                image:UIImage? = nil,
                closeImage:UIImage? = nil,
                buttons:[NWAlertButton]){
        super.init(nibName: nil, bundle: nil)
        self.modalTransitionStyle = .crossDissolve
        self.modalPresentationStyle = .overFullScreen
        self.titleAlert = title
        self.message = message
        self.image = image
        self.buttons = buttons
        self.imageClose = closeImage
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
//    deinit {
//        print("denit NWAlertController")
//    }
    
    
    //MARK: - Life Circle

    public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpView()
        
        self.viewContent.alpha = 0
        
    }
    //MARK: - Appear & dismiss
    
    func animationAppear(){
        self.viewContent.alpha = 0
        self.viewContent.transform = CGAffineTransform.init(translationX: 0, y: 100)
        UIView.animate(withDuration: 0.3,
                       delay: 0.0 ,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 5,
                       options: .curveEaseOut) {
            self.viewContent.alpha = 1
            self.viewContent.transform = CGAffineTransform.identity
        } completion: { (finish ) in
            
        }
    }
    func dismissWithAnimation(action:NWAlertButton?){
        UIView.animate(withDuration: 0.3) {
            self.viewContent.alpha = 0
        } completion: { (finish) in
            self.dismiss(animated: true){ [weak self] in
                if let act = action , let sw = self {
                    if sw.options.isShowTextField == true {
                        sw.alertButtonWithTextFieldAction?(act,sw.textField)
                    }else{
                        sw.alertButtonAction?(act)
                    }
                }
            }
        }
    }

    //MARK: - SETUP
    func setUpView(){
        addButtonBackground()
    }
    
    //MARK: - Layout
    func addButtonBackground(){
        self.view.addSubview(self.btnCloseBg)
        self.btnCloseBg.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        self.btnCloseBg.addTarget(self , action: #selector(self.tapToBackground(_:)), for: .touchUpInside)
        
        addContentView()
    }
    func addContentView(){
        self.view.addSubview(self.viewContent)
        self.viewContent.backgroundColor = options.backgroundContentColor
        self.viewContent.snp.makeConstraints { make in
            make.width.equalTo(options.widthOfAlert)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        self.cornerRadius(v: viewContent, size: options.cornerViewContent)
        addCloseButton()
        addImagePhoto()
        
    }
    func addCloseButton(){
        if self.imageClose != nil {
            self.viewContent.addSubview(self.btnClose)
            self.btnClose.setImage(self.imageClose, for: .normal)
            self.btnClose.snp.makeConstraints { make in
                make.width.height.equalTo(50)
                make.top.leading.equalToSuperview()
            }
            self.btnClose.addTarget(self, action: #selector(self.tapToClose(_:)), for: .touchUpInside)
        }
    }
    func addImagePhoto(){
        if self.image != nil {
            self.viewContent.addSubview(self.imvPhoto)
            self.imvPhoto.snp.makeConstraints { make in
                make.top.leading.equalToSuperview().offset(options.spacing)
                make.trailing.equalToSuperview().offset(-options.spacing)
                make.height.equalTo(options.heightOfPhoto)
            }
            self.imvPhoto.image = self.image
        }
        self.addLabels()
    }
    func addLabels(){
        self.lbTitle.text = self.titleAlert
        self.lbTitle.font = options.fontTitle
        self.lbTitle.textColor = options.colorTitle
        self.lbTitle.numberOfLines = 0
        self.lbTitle.sizeToFit()
        self.viewContent.addSubview(self.lbTitle)
        self.lbTitle.snp.makeConstraints { make in
            if self.image != nil {
                make.top.equalTo(self.imvPhoto.snp.bottom).offset(options.spacing)
            }else{
                make.top.equalToSuperview().offset(options.spacing)
            }
            make.leading.equalToSuperview().offset(options.spacing)
            make.trailing.equalToSuperview().offset(-options.spacing)
        }
        
        self.lbMessage.text = self.message
        self.lbMessage.font = options.fontMessage
        self.lbMessage.textColor = options.colorMessage
        self.lbMessage.numberOfLines = 0
        self.lbMessage.sizeToFit()
        self.viewContent.addSubview(self.lbMessage)
        self.lbMessage.snp.makeConstraints { make in
            make.top.equalTo(self.lbTitle.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(options.spacing)
            make.trailing.equalToSuperview().offset(-options.spacing)
        }
        addTextField()
    }
    func addTextField(){
        if options.isShowTextField {
            
            self.viewContent.addSubview(self.textField)
            self.textField.snp.makeConstraints { make in
                make.top.equalTo(self.lbMessage.snp.bottom).offset(8)
                make.leading.equalToSuperview().offset(options.spacing)
                make.trailing.equalToSuperview().offset(-options.spacing)
                make.height.equalTo(50)
            }
            addStackView(spacing: 58 + options.spacing)
        }else{
            addStackView(spacing: options.spacing)
        }
    }
    func addStackView(spacing:CGFloat){
        self.viewContent.addSubview(self.stackButtons)
        if self.buttons.count > 2 || self.options.buttonsVertical {
            self.stackButtons.axis = .vertical
            let heightOfSpacing = (CGFloat(buttons.count - 1) * options.spacing)
            let height = (CGFloat(buttons.count) * options.heightOfButton) + heightOfSpacing
            
            self.stackButtons.snp.makeConstraints { make in
                make.top.equalTo(self.lbMessage.snp.bottom).offset(spacing)
                make.leading.equalToSuperview().offset(options.spacing)
                make.trailing.equalToSuperview().offset(-options.spacing)
                make.height.equalTo(height)
                make.bottom.equalToSuperview().offset(-options.spacing)
            }
        }else{
            self.stackButtons.axis = .horizontal
            self.stackButtons.snp.makeConstraints { make in
                make.top.equalTo(self.lbMessage.snp.bottom).offset(spacing)
                make.leading.equalToSuperview().offset(options.spacing)
                make.trailing.equalToSuperview().offset(-options.spacing)
                make.height.equalTo(options.heightOfButton)
                make.bottom.equalToSuperview().offset(-options.spacing)
            }
        }
        self.addButtons()
    }
    func addButtons(){
        for (index,button) in buttons.enumerated() {
            let btn = self.createButton(item: button , index: index)
            self.stackButtons.addArrangedSubview(btn)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.animationAppear()
        }
    }
    func createButton(item:NWAlertButton,index:Int)->UIButton{
        let btn = UIButton(frame: .zero)
        btn.setTitle(item.title, for: .normal)
        btn.titleLabel?.font = options.fontButton
        let color = item.style == .destructive ? options.colorButtonDestructive : options.colorButtonDefault
        
        if item.isHighlight {
            btn.setTitleColor(options.colorButtonTitleActive, for: .normal)
            btn.layer.borderWidth = 0
            btn.backgroundColor = color
        }else{
            btn.backgroundColor = .clear
            btn.setTitleColor(color, for: .normal)
            self.setBorderButton(button: btn , color: color)
        }
        self.cornerRadius(v: btn , size: options.cornerButton)
        btn.tag = index + 100
        btn.addTarget(self , action: #selector(self.tapToButton(_:)), for: .touchUpInside)
        return btn
    }
    
    //MARK: - Func
    func setBorderButton(button:UIButton,color:UIColor) {
        button.layer.borderWidth = 1
        button.layer.borderColor = color.cgColor
    }
    
    func cornerRadius(v:UIView,size: CGFloat) {
        v.layer.cornerRadius = size
        v.clipsToBounds = true
    }
    
    //MARK: - Actions

    @objc func tapToButton(_ sender:UIButton){
        let tag = sender.tag - 100
        if tag < self.buttons.count {
            let button = self.buttons[tag]
            self.dismissWithAnimation(action: button)
        }
    }
    
    @objc func tapToBackground(_ sender:UIButton){
        if self.options.isAllowTapBackground {
            UIView.animate(withDuration: 0.3) {
                self.viewContent.alpha = 0
            } completion: { (finish) in
                self.dismiss(animated: true)
            }
        }
    }
    @objc func tapToClose(_ sender:UIButton){
        UIView.animate(withDuration: 0.3) {
            self.viewContent.alpha = 0
        } completion: { (finish) in
            self.dismiss(animated: true){ [weak self] in
                self?.alertCloseAction?()
            }
        }
    }
    
}

