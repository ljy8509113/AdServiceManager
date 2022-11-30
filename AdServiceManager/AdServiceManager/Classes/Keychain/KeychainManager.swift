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
        let keychain = KeychainWrapper(serviceName: "AdIdentifier", accessGroup: "group.vlending.ad.identifier")
        if let value = keychain.string(forKey: key) {
            return value
        } else {
            let uuid = UUID().uuidString
            keychain.set(uuid, forKey: key)
            return uuid
        }
    }
}
