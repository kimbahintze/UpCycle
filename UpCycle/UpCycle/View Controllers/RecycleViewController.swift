//
//  RecycleViewController.swift
//  UpCycle
//
//  Created by Kimba Hintze on 6/4/18.
//  Copyright © 2018 Kim Lundquist. All rights reserved.
//

import UIKit
import FirebaseDatabase

class RecycleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var databaseRef: DatabaseReference?
    var materialsToRecycle = [HowToRecycle]()
    
    @IBOutlet weak var recycleInfoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        navigationItem.titleView = logoTitleView()
        recycleInfoTableView.dataSource = self
        
        databaseRef = Database.database().reference().child("howToRecycle")
        databaseRef?.observe(DataEventType.value, with: { (snapshot) in
            if snapshot.childrenCount > 0 {
                self.materialsToRecycle.removeAll()
                for materials in snapshot.children.allObjects as! [DataSnapshot] {
                    let materialsToRecycle = materials.value as? [String: Any]
                    let materialName = materialsToRecycle?["material"]
                    let materialInfo = materialsToRecycle?["info"]
                    let material = HowToRecycle(material: materialName as! String?, info: materialInfo as! String?)
                    self.materialsToRecycle.append(material)
                }
                DispatchQueue.main.async {
                    self.recycleInfoTableView.reloadData()
                }
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return materialsToRecycle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = recycleInfoTableView.dequeueReusableCell(withIdentifier: "howToRecycleCell", for: indexPath)
        let material = materialsToRecycle[indexPath.row]
        cell.textLabel?.text = material.material
        cell.textLabel?.font = UIFont(name: "Montserrat-Medium", size: 12)
        cell.imageView?.clipsToBounds = true
        cell.imageView?.layer.cornerRadius = 15
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRecycleDetailVC" {
            guard let destinationVC = segue.destination as? RecycleDetailViewController,
                let indexPath = recycleInfoTableView.indexPathForSelectedRow else { return }
            let materialToRecycle = materialsToRecycle[indexPath.row]
            destinationVC.howToRecycle = materialToRecycle
        }
    }
}
