//
//  ChatViewController.swift
//  Cocoa Chat
//
//  Created by Jamie Kim  on 8/29/20.
//  Copyright © 2020 Jamie Kim . All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    //create a reference
    let db = Firestore.firestore()
    
    var messages: [Message] = [
       // Message(user: "", body: "")
    
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        //UX; get rid of back button on chat controller
        title = K.appName
        navigationItem.hidesBackButton = true
        //register tabelview 
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        //pull up the current data in side of data
        loadMessages()
    }
    
    //hold data and hold messages
    func loadMessages(){
        //messages = []
        
        db.collection(K.FStore.collectionName)
            //sort messaged that retried from firebase
            .order(by: K.FStore.dateField)
            .addSnapshotListener{(querySnapshot, error) in
                //bug that duplicates messages - empty out after changes
                self.messages = []
                
                if let e = error{
                    print("error retriving data from firestore.")
                } else {
                    //optional binding and loop through
                    if let snapshotDocs = querySnapshot?.documents{
                    for doc in snapshotDocs{
                        let data = doc.data()
                        //conditional downcasting as? assuming there is data that are string type, then hold it to newMessage
                        if let user = data[K.FStore.userField] as? String, let messagebody = data[K.FStore.bodyField] as? String{
                        let newMessage = Message(user: user, body: messagebody) //ready to add to a new array
                            self.messages.append(newMessage)
                            //ensure fetching occurs in closure, fetch main thread, we update/reload data
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                //scroll to the very bottom of message
                                let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                //add animation when scrolling from the top to the bottom
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                            }
                                                       
                        }
                    }
                }
            }
        }
    }

    
    @IBAction func sendPressed(_ sender: UIButton) {
        //ready to send data to firestore
        //both are optional; text can be empty, user can be nil
        if let messageBody = messageTextfield.text, let messageUser = Auth.auth().currentUser?.email{
            //data dictionary
            db.collection(K.FStore.collectionName).addDocument(data: [
                K.FStore.userField: messageUser,
                K.FStore.bodyField: messageBody,
                K.FStore.dateField: Date().timeIntervalSince1970
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Data saved")
                    //main thread rather than background thread - update UI 
                    //when data saved then no longer needed so empty out old message
                    DispatchQueue.main.async {
                        self.messageTextfield.text = " "
                    }
                }
            }
        }
    }
    
    @IBAction func signoutPressed(_ sender: UIBarButtonItem) {
            let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            //elimate all except root controller: pop to root controller method
                navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
          
    }
    

}

//adopt ui table view datasource protocol; it populates table views
extension ChatViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    // get called as many as the number of cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //each line of cell
        let message = messages[indexPath.row]
         let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell // cast resuable cell as a message cell
        
        //attributes of the cells: label, text, image
        cell.label.text = message.body//"\(indexPath.row)"
        //this is a message from the current user, then make the left image hidden
        if message.user == Auth.auth().currentUser?.email{
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: K.Colors.chocolate)
            cell.label.textColor = UIColor.white
        }
        else{
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: K.Colors.lightYellow)
            cell.label.textColor = UIColor.black
        }
        
        return cell
    }
    
    
}
