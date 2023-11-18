//
//  SettingsViewController.swift
//  ColorizedApp
//
//  Created by Муслим Гаппаров on 14.10.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redLightLabel: UILabel!
    @IBOutlet var greenLightLabel: UILabel!
    @IBOutlet var blueLightLabel: UILabel!
    
    var color: UIColor!
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0
    
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        colorView.backgroundColor = color
        colorView.layer.cornerRadius = 10
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        
        redLightLabel.text = String(format: "%.02f", redSlider.value)
        greenLightLabel.text = String(format: "%.02f", greenSlider.value)
        blueLightLabel.text = String(format: "%.02f", blueSlider.value)
    }
    
    
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        switch sender {
        case redSlider:
            redLightLabel.text = String(format: "%.02f", redSlider.value)
        case greenSlider:
            greenLightLabel.text = String(format: "%.02f", greenSlider.value)
        default:
            blueLightLabel.text = String(format: "%.02f", blueSlider.value)
        }
            
        colorView.backgroundColor = setColor()
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setNewColor(red: red, green: green, blue: blue, alpha: alpha)
        dismiss(animated: true)
    }
    
    
    private func setColor() -> UIColor {
        let color = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return color
    }
}


