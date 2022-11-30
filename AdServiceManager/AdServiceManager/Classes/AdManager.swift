//
//  AdManager.swift
//  AdServiceManager
//
//  Created by Murf on 2022/11/30.
//

import UIKit
import AppTrackingTransparency
import AdSupport

open class AdManager: NSObject {
    public static let shared = AdManager()
    
    public func start() {
        
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                print("status : \(status)")
                switch status {
                case .authorized:
                    let idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
                    print("idfa: \(idfa)")
                    break
                case .restricted, .denied:
                    let uuid = KeychainManager.getUUID()
                    print("uuid: \(uuid)")
                    break
                case .notDetermined:
                    break
                    
                default:
                    break
                }
            }
        } else {
            // Fallback on earlier versions
            let uuid = KeychainManager.getUUID()
            print("uuid: \(uuid)")
        }
    }
    
    public func openOfferwall(viewContrller: UIViewController) {
        let vc = OfferwallListViewController(nibName: "OfferwallListViewController", bundle: Bundle(for: OfferwallListViewController.self))
        
        let navigationController = UINavigationController(rootViewController: vc)
        viewContrller.present(navigationController, animated: true)
        
    }
}
