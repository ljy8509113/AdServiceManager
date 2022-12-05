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
        let keychain = KeychainWrapper.standard
        var uuid: String?
        if let value = keychain.string(forKey: key) {
            uuid = value
        } else {
            uuid = UUID().uuidString
            keychain.set(uuid!, forKey: key)
        }
        return uuid ?? ""
    }
}
