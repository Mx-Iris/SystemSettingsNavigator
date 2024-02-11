//
//  ViewController.swift
//  Example-UIKit
//
//  Created by JH on 2024/2/12.
//

import UIKit
import SystemSettingsNavigator

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func navigate(_ sender: UIButton) {
        try? SystemSettingsNavigator.shared.navigate(to: .privacySecurity(.appManagement), completion: nil)
    }
}

