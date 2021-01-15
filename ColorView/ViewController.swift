//
//  ViewController.swift
//  ColorView
//
//  Created by Владислав Мокров on 24.11.2020.
//

import UIKit

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTF: UITextField!
    @IBOutlet weak var greenTF: UITextField!
    @IBOutlet weak var blueTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addToolBar(textField: redTF)
        addToolBar(textField: greenTF)
        addToolBar(textField: blueTF)
        
        //Setup Sliders
        //red
        redSlider.value = 0
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.minimumTrackTintColor = .red
        //green
        greenSlider.value = 0
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.minimumTrackTintColor = .green
        //blue
        blueSlider.value = 0
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.minimumTrackTintColor = .blue
        
        //valuesOfLabels
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        
        //valuesOfTextFields
        redTF.text = String(format: "%.2f", redSlider.value)
        greenTF.text = String(format: "%.2f", greenSlider.value)
        blueTF.text = String(format: "%.2f", blueSlider.value)
        
        colorView.layer.cornerRadius = 10
    }
    
    
    
    func colorViewEnter() { colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(1))
    }
    
    @IBAction func redActionSlider(_ sender: UISlider) {
        redLabel.text = String(format: "%.2f", redSlider.value)
        redTF.text = String(format: "%.2f", redSlider.value)
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(1))
    }
    @IBAction func greenActionSlider(_ sender: UISlider) {
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        greenTF.text = String(format: "%.2f", greenSlider.value)
        colorViewEnter()
    }
    @IBAction func blueActionSlider(_ sender: UISlider) {
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        blueTF.text = String(format: "%.2f", blueSlider.value)
        colorViewEnter()
    }
    
    @IBAction func actionRedTF(_ sender: UITextField) {
        if redTF.text != nil {
        redSlider.value = redTF.text!.floatValue
        colorViewEnter()
            }
        }
    
    @IBAction func actionGreenTF(_ sender: UITextField) {
        if redTF.text != nil {
        greenSlider.value = greenTF.text!.floatValue
        colorViewEnter()
            }
    }
    
    @IBAction func actionBlueTF(_ sender: UITextField) {
        if redTF.text != nil {
        blueSlider.value = blueTF.text!.floatValue
            colorViewEnter()
            }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

extension ViewController: UITextFieldDelegate{
    func addToolBar(textField: UITextField){
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = .systemGreen
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.donePressed))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelPressed))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()

        textField.delegate = self
        textField.inputAccessoryView = toolBar
    }
    @objc func donePressed(){
        view.endEditing(true)
    }
    @objc func cancelPressed(){
        view.endEditing(true) // or do something
    }
}
