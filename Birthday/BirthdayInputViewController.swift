//
//  BirthdayInputViewController.swift
//  Birthday
//
//  Created by Calvin Chang on 05/03/2018.
//  Copyright © 2018 Sapphire Info. All rights reserved.
//

import UIKit

protocol BirthdayInputViewControllerDelegate {
    
    func saveBirthday(viewController :BirthdayInputViewController, birthdayData: BirthdayData)
}

class BirthdayInputViewController: UIViewController {

    // MARK: - Public
    internal var delegate : BirthdayInputViewControllerDelegate?
    
    // MARK: - Private/filePrivate
    @IBOutlet fileprivate weak var nameInputTextField: UITextField!
    
    @IBOutlet fileprivate weak var dateInputDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureBirthdayInputView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Configure
    fileprivate func configureBirthdayInputView() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(self.saveButtonTouchUp(sender:)))
    }
    
    @objc fileprivate func saveButtonTouchUp(sender: AnyObject) {
        guard delegate != nil else {
            return
        }
        
        let birthdayData = BirthdayData()
        birthdayData.name = nameInputTextField.text!
        birthdayData.birthday = dateInputDatePicker.date
        
        
        delegate?.saveBirthday(viewController: self, birthdayData: birthdayData)
        navigationController?.popViewController(animated: true);
    }
}
