//
//  LoginScreenController.swift
//  VK_Lite_1
//
//  Created by Александр Филиппов on 31.03.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import UIKit

class LoginScreenController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    private let networkingService = NetworkingService()
    
    //MARK: - Lifecycle Contrllrs
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkingService.sendAlamofireRequest(city: "Санкт-Петербург")
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(tapGR)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    //MARK: - Actions
    @IBAction func loginButtonPressed(_ sender: UIButton) {

        if usernameInput.text == "",
            passwordInput.text == "" {
           //performSegue(withIdentifier: "Show Main Screen", sender: sender)
        } else {
            showLoginError()
        }
    }
    
    //MARK: - Private API
    @objc private func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo as NSDictionary?
        let keyboardSize = (info?.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func keyboardWasHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func hideKeyboard() {
        scrollView.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier == "Show Main Screen" else {return true}
        
        if usernameInput.text == "",
            passwordInput.text == "" {
                return true
           } else {
            showLoginError()
            return false
           }
    }
    
    private func showLoginError() {
        let loginAlert = UIAlertController(title: "Error", message: "Login/password is incorrect", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            self.passwordInput.text = ""
        }
        
        loginAlert.addAction(action)
        
        present(loginAlert, animated: true)
    }    
}
