//
//  StartViewController.swift
//  ColorizedApp
//
//  Created by Муслим Гаппаров on 16.11.2023.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
}

class StartViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        let color = view.backgroundColor
        settingsVC.color = color
        settingsVC.delegate = self
    }
}

extension StartViewController: SettingsViewControllerDelegate {
    func setNewColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
