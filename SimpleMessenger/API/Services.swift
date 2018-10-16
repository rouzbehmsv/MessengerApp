//
//  Services.swift
//  SimpleMessenger
//
//  Created by Rouzbeh on 10/16/18.
//  Copyright © 2018 Rouzbeh. All rights reserved.
//

import Foundation
import Scaledrone

class Services {
    
    private let scaledrone: Scaledrone
    private let messageCallback: (Message)-> Void
    
    private var room: ScaledroneRoom?
    init(member: Member, onRecievedMessage: @escaping (Message)-> Void) {
        self.messageCallback = onRecievedMessage
        //    #error("Make sure to input your channel ID and delete this line.")
        self.scaledrone = Scaledrone(
            channelID: "HFKm9LMKWFuCeYrp",
            data: member.toJSON)
        scaledrone.delegate = self
    }
}

