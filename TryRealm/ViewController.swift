//
//  ViewController.swift
//  TryRealm
//
//  Created by YoNa on 2021/03/05.
//

import UIKit
import RealmSwift

class ViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldAge: UITextField!
    @IBOutlet weak var saveRealmButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    let realm  = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textFieldName.placeholder = "氏名を入力してください"
        textFieldAge.placeholder = "年齢を入力してください"

        saveRealmButton.layer.cornerRadius = 22
        
    }
    
    @IBAction func saveUserButtonAction(_ sender: Any) {
        let  user = User()
        user.name = textFieldName.text!
        user.age = Int(textFieldAge.text!)!
        
        try! realm.write{
            realm.add(user)
        }
        textFieldName.text = ""
        textFieldAge.text = ""
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let userData = realm.objects(User.self)
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let userData = realm.objects(User.self)
        cell.textLabel!.text = "\(userData[indexPath.row].name)"
        cell.detailTextLabel!.text = String("\(userData[indexPath.row].age)際")
        return cell
    }
}

