//
//  MessageObject.swift
//  SimpleMessenger
//
//  Created by Rouzbeh on 10/16/18.
//  Copyright © 2018 Rouzbeh. All rights reserved.
//

import Foundation
import UIKit
import MessageKit

struct Message {
    let member: Member
    let text : String
    let messageId : String
}
struct Member {
    let name: String
    
}
extension Member {
    var toJSON: [String:Any] {
        return [
            "name": name,
        ]
    }
    
    init?(fromJSON json: Any) {
        guard
            let data = json as? [String: Any],
            let name = data["name"] as? String
            else {
                print("Couldn't parse Member")
                return nil
        }
        
        self.name = name
        
    }
}

