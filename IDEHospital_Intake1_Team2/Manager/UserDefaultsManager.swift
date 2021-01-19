//
//  UserDefaultsManager.swift
//  IDEHospital_Intake1_Team2
//
//  Created by Divo Ayman on 12/12/20.
//

import Foundation

class UserDefaultsManager {
    
    // MARK:- Singleton
    private static let sharedInstance = UserDefaultsManager()
    
    class func shared() -> UserDefaultsManager {
        return UserDefaultsManager.sharedInstance
    }
    
    var token: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.token)
        }
        get {
            guard UserDefaults.standard.object(forKey: UserDefaultsKeys.token) != nil else {
                return nil
            }
            return UserDefaults.standard.string(forKey: UserDefaultsKeys.token)!
        }
    }
    
    var docID: Int? {
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.docID)
        }
        get {
            guard UserDefaults.standard.object(forKey: UserDefaultsKeys.docID) != nil else {
                return nil
            }
            return UserDefaults.standard.integer(forKey: UserDefaultsKeys.docID)
        }
    }
}
