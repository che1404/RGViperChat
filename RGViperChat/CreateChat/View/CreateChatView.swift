//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation
import UIKit

class CreateChatView: UIViewController, CreateChatViewProtocol {
    @IBOutlet weak var tableView: UITableView!

    var presenter: CreateChatPresenterProtocol?

    var displayData: UsersDisplayData?

    override func viewDidLoad() {

        tableView.delegate = self
        tableView.dataSource = self

        presenter?.viewWasLoaded()
    }

    func show(usersDisplayData: UsersDisplayData) {
        displayData = usersDisplayData
        tableView.reloadData()
    }

    // MARK: User actions

    @IBAction func buttonCancelTapped(_ sender: Any) {
        presenter?.buttonCancelTapped()
    }
}

extension CreateChatView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if let selectedUser = displayData?.userDisplayItems[indexPath.row] {
            presenter?.userSelected(user: selectedUser)
        }
    }
}

extension CreateChatView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = displayData {
            return data.userDisplayItems.count
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if let userDisplayItem = self.displayData?.userDisplayItems[indexPath.row] {
            cell.textLabel?.text = userDisplayItem.username
        }
        return cell
    }
}
