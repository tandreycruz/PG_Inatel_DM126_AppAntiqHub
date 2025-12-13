//
//  LoginType.swift
//  App_AntiqHub
//
//  Created by user288577 on 12/12/25.
//


import Foundation
import CryptoKit

struct LoginType {
    let username: String
    let passwordHash: String
    init(username: String, password: String)
    {
        self.username = username
        self.passwordHash = LoginType.sha256(password)
    }

    public static func sha256(_ input: String) -> String {
        let data = Data(input.utf8)
        let digest = SHA256.hash(data: data)
        return digest.map { String(format: "%02x", $0) }.joined()
    }
}
