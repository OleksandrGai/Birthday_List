//
//  ListTableViewController.swift
//  List
//
//  Created by Alex Gailiunas on 31.08.2022.
//

import UIKit

let identefeier = "cell"


class ListTableViewController: UITableViewController {
    
// MARK: - Outlets
    
    var contactInf = [ContactInf]()
    
    
// MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handelAddContacts))
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identefeier)
    }

// MARK: - Acton
    
     @objc func handelAddContacts () {

             if let controller = storyboard?.instantiateViewController(identifier: "AddListViewController") as? AddListViewController {
             controller.delegate = self
             controller.modalTransitionStyle = .crossDissolve
             controller.modalPresentationStyle = .fullScreen
             present(controller, animated: true, completion: nil)
         }
    }
    
// MARK: - Tabel View Cells
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactInf.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identefeier, for: indexPath)
        cell.textLabel?.text = "\(contactInf[indexPath.row].fullName):age -\(contactInf[indexPath.row].age), sex -\(contactInf[indexPath.row].sex), birthday -\(contactInf[indexPath.row].date), link:\(contactInf[indexPath.row].messenger)"
        return cell
    }
}

// MARK: - AddContactDelegate

extension ListTableViewController : AddContactDelegate {

func addContact(contact: ContactInf) {
    
    self.dismiss(animated: true) {
        self.contactInf.append(contact)
        self.tableView.reloadData()
        }
    }
}
