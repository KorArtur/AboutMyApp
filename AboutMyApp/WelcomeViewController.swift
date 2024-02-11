//
//  WelcomeViewController.swift
//  AboutMyApp
//
//  Created by Карина Короткая on 10.02.2024.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    @IBOutlet private var userNameLabel: UILabel!
    
    var currentUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = "Welcome \(currentUser?.login ?? "")!"
    }
}
