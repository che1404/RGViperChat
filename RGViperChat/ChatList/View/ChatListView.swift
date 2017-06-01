//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation
import UIKit
import DZNEmptyDataSet
import FontAwesome_swift

class ChatListView: UIViewController, ChatListViewProtocol {
    var presenter: ChatListPresenterProtocol?

    @IBOutlet weak var tableView: UITableView!

    var chats: [Chat] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewWasLoaded()

        tableView.tableFooterView = UIView()
    }

    // MARK: ChatListViewProtocol implementation

    func showEmptyScreen() {
        tableView.delegate = nil
        tableView.dataSource = nil

        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self

        UIView.animate(withDuration: 0.5, animations: {
            self.tableView.reloadData()
        }, completion: nil)
    }

    func add(chat: Chat) {

        tableView.emptyDataSetSource = nil
        tableView.emptyDataSetDelegate = nil

        tableView.delegate = self
        tableView.dataSource = self

        tableView.reloadData()

        chats.append(chat)

        tableView.insertRows(at: [IndexPath(row: tableView.numberOfRows(inSection: 0), section: 0)], with: UITableViewRowAnimation.left)

        tableView.reloadData()
    }

    func show(chats: [Chat]) {
        self.chats = chats

        tableView.emptyDataSetSource = nil
        tableView.emptyDataSetDelegate = nil

        tableView.delegate = self
        tableView.dataSource = self

        tableView.reloadData()
    }

    // MARK: User actions

    @IBAction func buttonLogoutTapped(_ sender: Any) {
        presenter?.buttonLogoutTapped()
    }

    @IBAction func buttonCreateChatTapped(_ sender: Any) {
        presenter?.buttonCreateChatTapped()
    }
}

extension ChatListView: DZNEmptyDataSetSource {
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return UIImage.fontAwesomeIcon(name: .users, textColor: UIColor.orange, size: CGSize(width: 150, height: 150))
    }

    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: "You have no chats!")
    }

    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: "You can create one by tapping on top right button")
    }
}

extension ChatListView: DZNEmptyDataSetDelegate {

}

extension ChatListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let chat = chats[indexPath.row]
        cell.textLabel?.text = chat.displayName
        return cell
    }
}

extension ChatListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let chat = chats[indexPath.row]
        presenter?.chatSelected(chat: chat)
    }
}
