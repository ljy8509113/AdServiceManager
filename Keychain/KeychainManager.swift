//
//  KeychainManager.swift
//  AdFramework
//
//  Created by Murf on 2022/11/28.
//

import Foundation

class KeychainManager {
    class func getUUID() -> String {
        let key = "custom_idfa_uuid"
        if let value = KeychainWrapper.standard.string(forKey: key) {
            return value
        } else {
            let uuid = UUID().uuidString
            KeychainWrapper.standard.set(uuid, forKey: key)
            return uuid
        }
    }
}
