//
//  ViewController.swift
//  BlurApp
//
//  Created by Oleg Koptev on 29.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    var blurEffectView: UIVisualEffectView?
    
    @IBAction func signInPressed(sender: AnyObject) {
        print("You pressed sign in")
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    func addUnderline(textField: UITextField!) {
        let border = CALayer();
        let borderWidth: CGFloat = 1;
        border.borderColor = UIColor.lightGray.cgColor;
        border.frame = CGRect(x: 0, y: textField.frame.size.height - borderWidth, width: textField.frame.size.width, height: textField.frame.size.height)
        border.borderWidth = borderWidth;
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let selectedImageIndex = Int(arc4random_uniform(3))
        backgroundImageView.image = UIImage(named: "Image\(selectedImageIndex + 1)")
        backgroundImageView.frame = view.bounds
        
        let blurEffect = UIBlurEffect(style: .light)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView?.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView!)
               
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        emailTextField.keyboardType = .emailAddress
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        passwordTextField.keyboardType = .asciiCapable
        passwordTextField.isSecureTextEntry = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addUnderline(textField: emailTextField)
        addUnderline(textField: passwordTextField)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        blurEffectView?.frame = view.bounds
        backgroundImageView.frame = view.bounds
    }


}

