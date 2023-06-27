//
//  ViewController.swift
//  setting
//
//  Created by Code Mafia on 23/05/23.
//

import UIKit

struct SettingItem {
    let name: String
    let icon: String
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var settings = [
        "General",
        "Accessibility",
        "Privacy",
        "",
        "Password",
        "",
        "Safari",
        "News",
        "Maps",
        "Shortcuts",
        "Health",
        "Siri & Search",
        "Photos",
        "Game Centre",
        "",
        "Developer"
    ]
    
    var items: [SettingItem] = [
        SettingItem(name: "General", icon: "General"),
        SettingItem(name: "Accessibility", icon: "Accessibility"),
        SettingItem(name: "Privacy", icon: "Privacy"),
        SettingItem(name: " ", icon: "abc"),
        SettingItem(name: "Password", icon: "Passwords"),
        SettingItem(name: " ", icon: "abc"),
        SettingItem(name: "Safari", icon: "Safari"),
        SettingItem(name: "News", icon: "News"),
        SettingItem(name: "Maps", icon: "Maps"),
        SettingItem(name: "Shortcuts", icon: "Shortcuts"),
        SettingItem(name: "Health", icon: "Health"),
        SettingItem(name: "Siri & Search", icon: "Siri"),
        SettingItem(name: "Photos", icon: "Photos"),
        SettingItem(name: "Game Centre", icon: "Game Centre"),
        SettingItem(name: " ", icon: "abc"),
        SettingItem(name: "Developer", icon: "Developer")
    ]
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "Settings"
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
    {
        let header:UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView

        header.textLabel!.textColor = UIColor.black
        header.textLabel!.font = UIFont.boldSystemFont(ofSize: 35)
        header.textLabel!.frame = header.frame
        header.textLabel!.textAlignment = NSTextAlignment.natural
    }
    

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let myCell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        
        
        myCell.setupCell(item: items[indexPath.row])
        
        return myCell
    }
       
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    
}

// Approach 1: To set the cell element data directly in the view controllr
//        myCell.myLabel.text = items[indexPath.row].name
//        myCell.myImageView.image = UIImage(named: items[indexPath.row].icon)



// Approach 2:  To set the cell inside the tableviewCell and pass the setting item from here
