//
//  EncryptionService.swift
//  RGViperChat
//
//  Created by Roberto Garrido on 29/5/17.
//  Copyright © 2017 robertogarrido.com. All rights reserved.
//

import Foundation

class EncryptionService: EncryptionServiceProtocol {
    func decrypt(text: String) -> Result<String> {
        var decryptedText = ""
        for unicodeScalar in text.unicodeScalars {
            decryptedText.append(Character(UnicodeScalar(unicodeScalar.value - 1)!))
        }
        return .success(decryptedText)
    }

    func encrypt(text: String) -> Result<String> {
        var encryptedText = ""
        for unicodeScalar in text.unicodeScalars {
            encryptedText.append(Character(UnicodeScalar(unicodeScalar.value + 1)!))
        }
        return .success(encryptedText)
    }
}
