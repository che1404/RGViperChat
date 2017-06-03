//
//  UsersDisplayDataMapperSpec.swift
//  RGViperChat
//
//  Created by Roberto Garrido on 28/5/17.
//  Copyright © 2017 robertogarrido.com. All rights reserved.
//

import Quick
import Nimble
import Cuckoo
@testable import RGViperChat

class UsersDisplayDataMapperSpec: QuickSpec {
    var usersDisplayDataMapper: UsersDisplayDataMapper!

    override func spec() {
        beforeEach {
            self.usersDisplayDataMapper = UsersDisplayDataMapper()
        }

        context("When mapping users into users display data") {
            beforeEach {
                self.usersDisplayDataMapper.mapUsersIntoUsersDisplayData(withUsers: [User(username: "Roberto1", userID: "userID1"), User(username: "Roberto2", userID: "userID2")])
            }

            it("Generates 2 user data items") {
                expect(self.usersDisplayDataMapper.mappedUsersDisplayData.userDisplayItems.count) == 2
            }

            it("Contains a user data item with username Roberto1") {
                expect(self.usersDisplayDataMapper.mappedUsersDisplayData.userDisplayItems).to(containElementSatisfying({ displayDataItem -> Bool in
                    return displayDataItem.username == "Roberto1" && displayDataItem.userID == "userID1"
                }))
            }

            it("Contains a user data item with username Roberto2") {
                expect(self.usersDisplayDataMapper.mappedUsersDisplayData.userDisplayItems).to(containElementSatisfying({ displayDataItem -> Bool in
                    return displayDataItem.username == "Roberto2" && displayDataItem.userID == "userID2"
                }))
            }
        }

        afterEach {
            self.usersDisplayDataMapper = nil
        }
    }
}
