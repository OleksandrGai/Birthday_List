//
//  SingInViewController.swift
//  List
//
//  Created by Alex Gailiunas on 31.08.2022.
//

import UIKit

class SingInViewController: UIViewController {

// MARK: - Outlets
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var singInButton: UIButton!
    
    let eyeButton = UIButton(type: .custom)
    
    
// MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailTextField.placeholder = "Email"
        self.emailTextField.becomeFirstResponder()
        
        
        self.passwordTextField.placeholder = "password"
        self.passwordTextField.isSecureTextEntry = true
        self.passwordTextField.rightViewMode = .unlessEditing
       
        self.singInButton.layer.cornerRadius = 5
        
    
// TODO: - eye
    
    eyeButton.setImage(UIImage(named: "hiden"), for: .normal)
    eyeButton.frame = CGRect(x: CGFloat(passwordTextField.frame.size.width - 20), y:CGFloat(5) , width: CGFloat(13), height: CGFloat(20))
        eyeButton.addTarget(self, action: #selector(paswordVisibility(_:)), for: .touchUpInside)
        passwordTextField.rightView = eyeButton
        passwordTextField.rightViewMode = .always
    }
    
    @objc func paswordVisibility(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            self.passwordTextField.isSecureTextEntry = false
            eyeButton.setImage(UIImage(named: "open"),  for: .normal)
        } else {
            self.passwordTextField.isSecureTextEntry = true
            eyeButton.setImage(UIImage(named: "hide"), for: .normal)
        }
    }
  

// TODO: - Normalvalidation
    
    @IBAction func singIn(_ sender: UIButton) {
        if self.emailTextField.text!.count <= 2 || self.emailTextField.text!.count <= 2 {
            let alert = UIAlertController(title: "Error!", message: "Please,enter your email and password!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default) { (action) in }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        } else {
            performSegue(withIdentifier: "list", sender: nil)
           
        }
    }
}

