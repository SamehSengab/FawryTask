//
//  UserDefault.swift
//  NewsTaskFawry
//
//  Created by Sameh Sengab on 05/11/2022.
//

import Foundation

enum UserDeaufltKeys: String {
    case isFirstLogin
}
extension UserDefaults {
    func setLoginValue(value: Bool) {
        setValue(value, forKey: UserDeaufltKeys.isFirstLogin.rawValue)
    }
    func getLoginValue() -> Bool {
        register(defaults: [UserDeaufltKeys.isFirstLogin.rawValue: true])
        return bool(forKey: UserDeaufltKeys.isFirstLogin.rawValue)
    }
}
