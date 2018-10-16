//
//  ViewController.swift
//  SimpleMessenger
//
//  Created by Rouzbeh on 10/16/18.
//  Copyright © 2018 Rouzbeh. All rights reserved.
//

import UIKit
import Lottie
class ViewController: UIViewController {
    var animationView:LOTAnimationView!
    var tap: UITapGestureRecognizer!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        initializer()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}
extension ViewController:UITextFieldDelegate{
    func initializer()  {
        enterButton.addTarget(self, action: #selector(gotoChat), for: .touchUpInside)
        nameTextField.delegate = self
        enterButton.isEnabled = false
        enterButton.isHidden = true
        buttonCustomizer()
        gradiantAdder()
        loadingAnimationWithLottie()
    }
    func gradiantAdder() {
        let gradient = CAGradientLayer()
        
        gradient.frame = view.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.blue.cgColor]
        
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    func buttonCustomizer()  {
        enterButton.layer.cornerRadius = 5.0
        enterButton.setTitleColor(UIColor.white, for: .normal)
        enterButton.backgroundColor = self.navigationController?.navigationBar.backgroundColor
        enterButton.layer.borderWidth = 2.0
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        enterButton.isEnabled = true
        enterButton.isHidden = false
        view.addGestureRecognizer(tap)
    }
    @objc  func dismissKeyboard() {
        view.endEditing(true)
    }
    func loadingAnimationWithLottie() {
        animationView = LOTAnimationView(name: "rate_us")
        //        animationView.backgroundColor = UIColor.lightGray
        animationView.frame = CGRect (x: self.view.frame.size.width/4, y: 70, width: self.view.frame.size.width/2, height: self.view.frame.size.width/2)
        self.view.addSubview(animationView)
        animationView.play{ (finished) in
            
            // Do Something
        }
        animationView.loopAnimation = true
    }
    @objc func gotoChat(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
        newViewController.name = nameTextField.text
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}

