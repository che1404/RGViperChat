//
//  Result.swift
//  RGViperChat
//
//  Created by Roberto Garrido on 23/5/17.
//  Copyright © 2017 robertogarrido.com. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T?)
    case failure(Error)
}
