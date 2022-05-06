//
//  ContactsViewController.swift
//  Contacts
//
//  Created by Dmitry Maslennikov on 30/04/2022.
//  Copyright © 2022 Dmitry Maslennikov. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {
    
    let contactsTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(ContactTableViewCell.self, forCellReuseIdentifier: "contactCell")
        return table
    }()
    
    private var contacts = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupNavigation()
        setupViews()
        setupConstraints()
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        contactsTableView.reloadData()
    }
    
    private func setupNavigation() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    }
    
    @objc private func addButtonTapped() {
        
    }

    private func setupViews() {
        view.addSubview(contactsTableView)
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            contactsTableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            contactsTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            contactsTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            contactsTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor)
        ])
    }
    
    private func setupTableView() {
        contactsTableView.dataSource = self
        contactsTableView.delegate = self
    }
}

extension ContactsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contactsTableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell
        cell.fullName.text = contacts[indexPath.row]
        cell.accessoryType = .detailButton
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            contacts.remove(at: indexPath.row)
            contactsTableView.reloadData()
        }
    }
}
