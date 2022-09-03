//
//  ViewController.swift
//  List
//
//  Created by Alex Gailiunas on 31.08.2022.
//

import UIKit

// MARK: - AddContactDelegate

protocol AddContactDelegate {
    func addContact (contact: ContactInf)
}

// MARK: - Outlets

class AddListViewController: UIViewController {

    var delegate : AddContactDelegate?
    
var sexx = ["Male", "Fimale"]
    
var agee = [String]()
    
    @IBOutlet weak var fullNameTextField1: UITextField!
    
    @IBOutlet weak var messengerTextField1: UITextField!
    
    @IBOutlet weak var sexTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var dataTextField: UITextField!
    
// MARK: - PICKERSVIEW
    
    let pickerViewSex  = UIPickerView()
    let pickerViewAge  = UIPickerView()
    let pickerViewDate = UIDatePicker()
    
    
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fullNameTextField1.autocapitalizationType = .words
        
// MARK: - PICKERSVIEW delegate, datasorce
        
        pickerViewSex.delegate   = self
        pickerViewSex.dataSource = self
        pickerViewSex.tag = 1
        
        sexTextField.inputView = pickerViewSex
        
        pickerViewAge.delegate   = self
        pickerViewAge.dataSource = self
        pickerViewAge.tag = 2
        
        ageTextField.inputView = pickerViewAge
        
        for num in 1..<100 {
            agee.append(String(num))
        }
        
        createDatePicker()
    }
    
// MARK: - Action
    @IBAction func fullNameTextField(_ sender: UITextField) {
    }

    @IBAction func messengerTextField(_ sender: UITextField) {
    }

    @IBAction func sexTextField(_ sender: Any) {
    }

    @IBAction func ageTextField(_ sender: Any) {
    }
    
    @IBAction func dateTextField(_ sender: Any) {
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        
        

        guard let fullName = fullNameTextField1.text, fullNameTextField1.hasText else {
            print("No text")
            return
        }
        guard let messenger = messengerTextField1.text, messengerTextField1.hasText else {
            print("No text")
            return
        }
        
        guard let sex = sexTextField.text, sexTextField.hasText else {
            print("No text")
            return
        }
        
        guard let age = ageTextField.text, ageTextField.hasText else {
            print("No text")
            return
        }
        
        guard let date = dataTextField.text, dataTextField.hasText else {
            print("No text")
            return
        }
        
        let contactInf = ContactInf(fullName: fullName, messenger: messenger, sex: sex, age: age, date: date)
        print(contactInf.self)
        
        delegate?.addContact(contact: contactInf)
        
    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
// MARK: - PICKERSVIEW DATA
        
    func createToolbar () -> UIToolbar {
        let toolBar = UIToolbar()
            toolBar.sizeToFit()
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonPressed))
            toolBar.setItems([doneButton], animated: true)
            return toolBar
        }
        
        func createDatePicker() {
            pickerViewDate.datePickerMode = .date
            pickerViewDate.preferredDatePickerStyle = .wheels
            dataTextField.inputView = pickerViewDate
            dataTextField.inputAccessoryView = createToolbar()
        }
        
        @objc func doneButtonPressed (){
            let datePickerFormat = DateFormatter()
            datePickerFormat.dateStyle = .medium
            datePickerFormat.timeStyle = .none
            
            dataTextField.text = datePickerFormat.string(from: pickerViewDate.date)
            self.view.endEditing(true)
        }
}

// MARK: - PICKERSVIEW delegate, datasorce Extantion

extension AddListViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return sexx.count
        case 2:
            return agee.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return sexx[row]
        case 2:
            return agee[row]
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            sexTextField.text = sexx[row]
            sexTextField.resignFirstResponder()
        case 2:
            ageTextField.text = agee[row]
            ageTextField.resignFirstResponder()
        default:
            break
        }
    }
    
    
}
