//
//  HXBKeychain.swift
//  HXB
//
//  Created by lxz on 2018/6/29.
//  Copyright © 2018年 lixiangzhou. All rights reserved.
//

import UIKit

import KeychainAccess

let HXBKeychain = HXBKeychainClass.shared

extension hxb {
    struct keychain {
        static let token = "token" + (HXBKeychain[hxb.keychain.mobile] ?? "")
        static let mobile = "mobile"
        static let url = "url"
    }
}

struct HXBKeychainClass {
    
    static let shared: Keychain = {
        return Keychain(service: hxb.net.baseUrl)
            .synchronizable(true)
            .accessibility(.afterFirstUnlock)
    }()
    
}

// MARK: -
extension HXBKeychainClass {
    subscript(key: String) -> Any? {
        get {
            return HXBKeychainClass.shared[key]
        }
    }
    
    subscript(key: String) -> String? {
        get {
            return (try? HXBKeychainClass.shared.get(key)).flatMap { $0 }
        }
        
        set {
            if let value = newValue {
                do {
                    try HXBKeychainClass.shared.set(value, key: key)
                } catch {}
            } else {
                do {
                    try HXBKeychainClass.shared.remove(key)
                } catch {}
            }
        }
    }
    
    subscript(string key: String) -> String? {
        get {
            return self[key]
        }
        
        set {
            self[key] = newValue
        }
    }
    
    subscript(data key: String) -> Data? {
        get {
            return (try? HXBKeychainClass.shared.getData(key)).flatMap { $0 }
        }
        
        set {
            if let value = newValue {
                do {
                    try HXBKeychainClass.shared.set(value, key: key)
                } catch {}
            } else {
                do {
                    try HXBKeychainClass.shared.remove(key)
                } catch {}
            }
        }
    }
    
    subscript(attributes key: String) -> Attributes? {
        get {
            return (try? HXBKeychainClass.shared.get(key) { $0 }).flatMap { $0 }
        }
    }
}

