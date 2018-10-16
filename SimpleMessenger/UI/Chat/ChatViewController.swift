//
//  ChatViewController.swift
//  SimpleMessenger
//
//  Created by Rouzbeh on 10/16/18.
//  Copyright © 2018 Rouzbeh. All rights reserved.
//

import UIKit
import MessageKit
class ChatViewController: MessagesViewController {
    var name: String?
    var chatService: Services!
    var messages: [Message] = []
    var member: Member!
    override func viewDidLoad() {
        super.viewDidLoad()
        initializer()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
