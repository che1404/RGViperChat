//
// Created by Roberto Garrido
// Copyright (c) 2017 Roberto Garrido. All rights reserved.
//

import Foundation
import UIKit
import JSQMessagesViewController
import FontAwesome_swift

class ChatView: JSQMessagesViewController, ChatViewProtocol {
    var presenter: ChatPresenterProtocol?

    var jsqMessages = [JSQMessage]()

    var outgoingBubbleImageView: JSQMessagesBubbleImage!
    var incomingBubbleImageView: JSQMessagesBubbleImage!

    @IBOutlet weak var barButtonItemBack: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Bubble colors
        let messagesBubbleImageFactory = JSQMessagesBubbleImageFactory()
        incomingBubbleImageView = messagesBubbleImageFactory?.incomingMessagesBubbleImage(with: UIColor.orange)
        outgoingBubbleImageView = messagesBubbleImageFactory?.outgoingMessagesBubbleImage(with: UIColor.gray)

        // Avatar images: Since we have no avatars, set the view size to zero, so we don't see a blank space instead
        collectionView!.collectionViewLayout.incomingAvatarViewSize = CGSize.zero
        collectionView!.collectionViewLayout.outgoingAvatarViewSize = CGSize.zero

        // Back button appearance
        barButtonItemBack.image = UIImage.fontAwesomeIcon(name: .arrowLeft, textColor: UIColor.white, size: CGSize(width: 20, height: 20))
        barButtonItemBack.tintColor = UIColor.white

        // Hide the attachment accessory button
        inputToolbar.contentView.leftBarButtonItem = nil

        presenter?.viewWasLoaded()
    }

    func showChatTitle(title: String) {
        navigationItem.title = title
    }

    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        presenter?.didPressSend(withMessageText: text, date: date, senderID: senderId, senderDisplayName: senderDisplayName)
    }

    func add(message: Message) {
        jsqMessages.append(JSQMessage(senderId: message.senderID, senderDisplayName: message.senderDisplayName, date: message.date, text: message.text))
        finishReceivingMessage(animated: true)
    }

    func dofinishSendingMessage() {
        finishSendingMessage(animated: true)
    }

    func playMessageSuccessfullySentSound() {
        JSQSystemSoundPlayer.jsq_playMessageSentSound()
    }

    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return jsqMessages[indexPath.row]
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jsqMessages.count
    }

    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        if jsqMessages[indexPath.row].senderId == self.senderId {
            return outgoingBubbleImageView
        } else {
            return incomingBubbleImageView
        }
    }

    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        return nil
    }

    @IBAction func barButtonBackTapped(_ sender: Any) {
        presenter?.backButtonTapped()
    }
}
