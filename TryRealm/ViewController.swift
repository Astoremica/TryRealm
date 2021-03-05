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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textFieldName.placeholder = "氏名を入力してください"
        textFieldAge.placeholder = "年齢を入力してください"
    
        saveRealmButton.layer.cornerRadius = 22
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
}

