//
//  ShowContactViewController.swift
//  Telegramme
//
//  Created by Jeya Vishnu on 10/11/20.
//

import UIKit


class ShowContactViewController: UITableViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var contactList:[Contact] = []
    let contactController:ContactController = ContactController();
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print("Running.....")
        
        self.tableView.reloadData()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        if let contacts = ContactController().retrieveAllContact() {
            contactList = contacts
        }
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Running wiilAppear.....")
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Running DidAppear.....")
        self.tableView.reloadData()
    }
    
    
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        
        let contact = contactList[indexPath.row]
        cell.textLabel!.text = "\(contact.firstName) \(contact.lastName)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            if indexPath.section == 0 {
//                self.appDelegate.contactList.remove(at: indexPath.row)
            }else{
//                self.appDelegate.contactList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.fade)
            }
            
            contactController.deleteContact(mobileno: contactList[indexPath.row].mobileNo)
            
            self.tableView.reloadData()
            
        }
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal,
                                        title: "Edit") { [weak self] (action, view, completionHandler) in
            self?.editHandler(self!.contactList[indexPath.row])
                                            completionHandler(true)
        }
        action.backgroundColor = .systemBlue
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    
    func editHandler(_ contact:Contact) {
        print("Edit is clicked")
        
        
        
        
        let storyboard = UIStoryboard(name: "Content", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "Contact") as AddContactViewController
        vc.contact = contact
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
        
        
        
    }
    
    
}
