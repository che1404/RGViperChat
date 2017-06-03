//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation
import UIKit
import DZNEmptyDataSet
import FontAwesome_swift
import DGActivityIndicatorView

enum ViewState {
    case initial
    case loadingChats
    case emptyScreen
    case showingChats
}

class ChatListView: UIViewController, ChatListViewProtocol {
    var presenter: ChatListPresenterProtocol?

    var tableView: UITableView!

    var loadingView: UIView!

    var chats: [Chat] = []

    var state: ViewState = .loadingChats

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        loadingView = UIView()
        loadingView.translatesAutoresizingMaskIntoConstraints = false

        presenter?.viewWasLoaded()

        tableView.tableFooterView = UIView()
    }

    func addTableView() {
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    func addLoadingView() {
        view.addSubview(loadingView)
        loadingView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        guard let activityIndicatorView = DGActivityIndicatorView(type: .cookieTerminator, tintColor: UIColor.orange) else {
            return
        }
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.addSubview(activityIndicatorView)

        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.topAnchor.constraint(equalTo: loadingView.topAnchor).isActive = true
        activityIndicatorView.bottomAnchor.constraint(equalTo: loadingView.bottomAnchor).isActive = true
        activityIndicatorView.leadingAnchor.constraint(equalTo: loadingView.leadingAnchor).isActive = true
        activityIndicatorView.trailingAnchor.constraint(equalTo: loadingView.trailingAnchor).isActive = true

        activityIndicatorView.startAnimating()
    }

    func removeLoadingView() {
        loadingView.removeFromSuperview()
    }

    // MARK: ChatListViewProtocol implementation
    func show(chats: [Chat]) {
        self.chats = chats
        state = .showingChats

        removeLoadingView()
        addTableView()

        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)

        tableView.emptyDataSetSource = nil
        tableView.emptyDataSetDelegate = nil

        tableView.delegate = self
        tableView.dataSource = self

        tableView.reloadData()
    }

    func showEmptyScreen() {
        if state == .loadingChats {
            removeLoadingView()
            addTableView()

            UIView.animate(withDuration: 0.2, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }

        state = .emptyScreen

        tableView.delegate = nil
        tableView.dataSource = nil

        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self

        UIView.animate(withDuration: 0.5, animations: {
            self.tableView.reloadData()
        }, completion: nil)
    }

    func add(chat: Chat) {

        if !chats.contains(chat) {
            chats.append(chat)
        }

        if state == .loadingChats {
            removeLoadingView()
            addTableView()

            UIView.animate(withDuration: 0.2, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }

        state = .showingChats

        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)

        tableView.emptyDataSetSource = nil
        tableView.emptyDataSetDelegate = nil

        tableView.delegate = self
        tableView.dataSource = self

        tableView.reloadData()
    }

    func showLoadingScreen() {
        state = .loadingChats

        addLoadingView()

        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
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

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        let headerHeight: CGFloat

        switch section {
        case 0:
            // hide the header
            headerHeight = CGFloat.leastNonzeroMagnitude
        default:
            headerHeight = 21
        }

        return headerHeight
    }
}

extension ChatListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let chat = chats[indexPath.row]
        presenter?.chatSelected(chat: chat)
    }
}
