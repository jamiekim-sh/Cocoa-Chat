//
//  K.swift
//  Cocoa Chat
//
//  Created by Jamie Kim  on 8/31/20.
//  Copyright © 2020 Jamie Kim . All rights reserved.
//

import Foundation

struct K{
    static let appName = "🍫Cacao Chat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let signupSegue = "SignupToChat"
    static let signinSegue = "SigninToChat"
    
    struct Colors {
        static let mainYellow = "MainYellow"
        static let lightYellow = "LightYellow"
        static let chocolate = "Chocolate"
        static let mainPistachio = "MainPistachio"
        static let lightPistachio = "LightPistachio"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let userField = "user"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
