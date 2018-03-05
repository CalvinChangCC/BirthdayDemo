//
//  BirthdayInfoTableViewController.swift
//  Birthday
//
//  Created by Calvin Chang on 05/03/2018.
//  Copyright © 2018 Sapphire Info. All rights reserved.
//

import UIKit

let SEGUE_TO_BIRTHDAYINPUT_IDENTIFIER = "identifierToBirthdayInput"

class BirthdayInfoTableViewController: UITableViewController, BirthdayInputViewControllerDelegate {
    

    // MARK: - Private property
    fileprivate var birthdayList = Array<BirthdayData>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return birthdayList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "reuseIdentifier")
        }

        // Configure the cell...
        cell?.textLabel?.text = birthdayList[indexPath.row].name
        cell?.detailTextLabel?.text = birthdayList[indexPath.row].birthdayString
        
        return cell!
    }

    @IBAction func addButtonTouchUp(_ sender: Any) {
        performSegue(withIdentifier: SEGUE_TO_BIRTHDAYINPUT_IDENTIFIER, sender: self)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SEGUE_TO_BIRTHDAYINPUT_IDENTIFIER {
            (segue.destination as! BirthdayInputViewController).delegate = self
        }
    }
    
    // MARK :- BirthdayInputViewControllerDelegate
    func saveBirthday(viewController: BirthdayInputViewController, birthdayData: BirthdayData) {
        birthdayList.append(birthdayData)
    }

}
