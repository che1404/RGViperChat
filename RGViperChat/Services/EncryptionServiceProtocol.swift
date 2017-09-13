//
//  EncryptionServiceProtocol.swift
//  RGViperChat
//
//  Created by Roberto Garrido on 13/9/17.
//  Copyright © 2017 robertogarrido.com. All rights reserved.
//

import Foundation

protocol EncryptionServiceProtocol: class {
    func encrypt(text: String) -> Result<String>
    func decrypt(text: String) -> Result<String>
}
