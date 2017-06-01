//
//  UsersDisplayDataMapper.swift
//  RGViperChat
//
//  Created by Roberto Garrido on 28/5/17.
//  Copyright © 2017 robertogarrido.com. All rights reserved.
//

import Foundation

class UsersDisplayDataMapper {
    var mappedUsersDisplayData: UsersDisplayData = UsersDisplayData()

    func mapUsersIntoUsersDisplayData(withUsers users: [User]) {
        for user in users {
            mappedUsersDisplayData.userDisplayItems.append(UserDisplayItem(username: user.username, userID: user.userID))
        }
    }
}
