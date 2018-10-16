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
    var chatRoom: ScaledroneRoom?
    init(member: Member, onRecievedMessage: @escaping (Message)-> Void) {
        self.messageCallback = onRecievedMessage
        //    #error("Make sure to input your channel ID and delete this line.")
        self.scaledrone = Scaledrone(
            channelID: "HFKm9LMKWFuCeYrp",
            data: member.toJSON)
        scaledrone.delegate = self
    }
    func connect() {
        scaledrone.connect()
    }
    
    func sendMessage(_ message: String) {
        chatRoom?.publish(message: message)
    }
}
extension Services: ScaledroneDelegate {
    
    func scaledroneDidConnect(scaledrone: Scaledrone, error: NSError?) {
        print("Connected to Scaledrone")
        chatRoom = scaledrone.subscribe(roomName: "observable-room")
        chatRoom?.delegate = self
    }
    
    func scaledroneDidReceiveError(scaledrone: Scaledrone, error: NSError?) {
        print("Scaledrone error", error ?? "")
    }
    
    func scaledroneDidDisconnect(scaledrone: Scaledrone, error: NSError?) {
        print("Scaledrone disconnected", error ?? "")
    }
    
}
extension Services: ScaledroneRoomDelegate {
    
    func scaledroneRoomDidConnect(room: ScaledroneRoom, error: NSError?) {
        print("Connected to room!")
    }
    
    func scaledroneRoomDidReceiveMessage(
        room: ScaledroneRoom,
        message: Any,
        member: ScaledroneMember?) {
        
        guard
            let text = message as? String,
            let data = member?.clientData,
            let member = Member(with: data)
            else {
                return
        }
        
        let message = Message(
            member: member,
            text: text,
            messageId: UUID().uuidString)
        messageCallback(message)
    }
}

