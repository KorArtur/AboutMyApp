//
//  PersonViewController.swift
//  AboutMyApp
//
//  Created by Карина Короткая on 14.02.2024.
//

import UIKit

final class PersonViewController: UIViewController {
    
    @IBOutlet private var personNameLabel: UILabel!
    @IBOutlet private var personSurnameLabel: UILabel!
    @IBOutlet private var personPatronymicLabel: UILabel!
    
    var currentUser: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        personNameLabel.text = currentUser?.person.name
        personSurnameLabel.text = currentUser?.person.surname
        personPatronymicLabel.text = currentUser?.person.patronymic
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let bioVC = segue.destination as? BiographyViewController
        bioVC?.currentUser = currentUser
    }
}
