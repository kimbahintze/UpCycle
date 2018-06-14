//
//  ReuseViewController.swift
//  UpCycle
//
//  Created by Kimba Hintze on 6/4/18.
//  Copyright © 2018 Kim Lundquist. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import SDWebImage

class ReuseViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var databaseRef: DatabaseReference!
    var posts = [Post]()
    
    
    
    // MARK: Outlets
    @IBOutlet weak var viewProjectsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        viewProjectsCollectionView.dataSource = self
        viewProjectsCollectionView.delegate = self
        //        NotificationCenter.default.addObserver(self, selector: #selector(reloadCollectionView), name: ReuseViewController, object: nil)
    }
    override func viewDidLayoutSubviews() {
        viewProjectsCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = viewProjectsCollectionView.dequeueReusableCell(withReuseIdentifier: "customProjectCell", for: indexPath) as! CustomProjectCollectionViewCell
        let post = posts[indexPath.row]
        cell.projectTitle.text = post.projectTitle
        cell.projectImage.sd_setImage(with: URL(string: posts[indexPath.row].projectPicURLAsString))
        return cell
    }
    
    func loadData() {
        if let uid = Auth.auth().currentUser?.uid {
            let postRef = databaseRef.child("posts")
            postRef.observe(.childAdded) { (postSnapshot) in
                let postID = postSnapshot.key
                if let postData = postSnapshot.value as? NSDictionary {
                    guard let projectPicURL = postData["projectPicURLAsString"] as? String,
                        let projectTitle = postData["projectTitle"] as? String,
                        let projectInstructions = postData["projectInstructions"] as? String,
                        let userID = postData["userID"] as? String else { return }
                    self.posts.append(Post(projectPicURLAsString: projectPicURL, userID: userID, projectTitle: projectTitle, projectInstructions: projectInstructions))
                    self.viewProjectsCollectionView.reloadData()
                }
            }
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
