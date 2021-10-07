//
//  ViewController.swift
//  DropDownDemo
//
//  Created by Dambar Bista on 10/6/21.
//

import UIKit

class ViewController: UIViewController {
    
    let navigationBar: UINavigationBar = {
        let width = UIScreen.main.bounds.width
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: width, height: 25))
        let navItem = UINavigationItem(title: "Lists")
        let addIcon = UIBarButtonItem(systemItem: .add)
        
        navItem.rightBarButtonItem = addIcon
        navBar.items = [navItem]
        
        return navBar
    }()
    
    
    let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    var isOpen: Bool = false
    
    
    var list = ["Fruites", "Vegetable"]
   // var array = [ExpandableCell(), ExpandableCell(), ExpandableCell()]
    var fruits = ["Apple", "Orange", "Banana", "Mango", "Pineapple"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(navigationBar)
        view.addSubview(tableView)
        
        setupConstraints()
        
      ///Future reference
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//            self.array[0].isExpanded = false
//            self.tableView.reloadData()
//        }
    }
    
    
    private func setupConstraints() {
        navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
        if !isOpen {
            for i in 0..<fruits.count {
                list.insert(fruits[i], at: 1+i)
                tableView.insertRows(at: [.init(row: 1+i, section: 0)], with: .fade)
            }
            
        } else {
            for _ in 0..<fruits.count {
                list.removeLast()
                print(list.last!)
                print( list.count)
                tableView.deleteRows(at: [.init(row: list.count - 1, section: 0)], with: .fade)
              
            }
        }
        
        isOpen.toggle()
    }
    
    
}
/// Future Referance
//struct ExpandableCell {
//    var isExpanded = true
//    var contents = ["A", "B", "C"]
//}

