//
//  BiographyViewController.swift
//  AboutMyApp
//
//  Created by Карина Короткая on 14.02.2024.
//

import UIKit

final class BiographyViewController: UIViewController {
    
    @IBOutlet private var biographyLabel: UILabel!
    
    var currentUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        biographyLabel.text = currentUser?.person.biography
    }
}
