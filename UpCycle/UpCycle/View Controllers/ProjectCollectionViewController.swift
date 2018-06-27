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

class ProjectCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var databaseRef: DatabaseReference?
    var posts = [Post]()
    
    // MARK: Outlets
    @IBOutlet weak var viewProjectsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        databaseRef = Database.database().reference()
        loadData()
        viewProjectsCollectionView.dataSource = self
        viewProjectsCollectionView.delegate = self
        navigationController?.isNavigationBarHidden = false
        navigationItem.titleView = logoTitleView()
    }
    
    override func viewDidLayoutSubviews() {
        viewProjectsCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = viewProjectsCollectionView.dequeueReusableCell(withReuseIdentifier: "customProjectCell", for: indexPath) as! ProjectBasicInfoCollectionViewCell
        let post = posts[indexPath.row]
        cell.projectTitle.text = post.projectTitle
        cell.projectImage.sd_setImage(with: URL(string: posts[indexPath.row].projectPicURLAsString))
        cell.projectTitle.textColor = darkerGreen
        cell.projectTitle.font = UIFont(name: MontserratMedium, size: 11)
        cell.projectTitle.textColor = UIColor.black
        cell.projectTitle.textAlignment = .center
        cell.projectImage.clipsToBounds = true
        cell.projectImage.layer.cornerRadius = 15
        cell.projectImage.layer.borderColor = darkerGreen.cgColor
        cell.projectImage.layer.borderWidth = 1
        return cell
    }
    
    func loadData() {
        guard let postRef = databaseRef?.child("posts") else { return }
        postRef.observe(.childAdded) { (postSnapshot) in
            if let postData = postSnapshot.value as? NSDictionary {
                guard let projectPicURL = postData["projectPicURLAsString"] as? String,
                    let projectTitle = postData["projectTitle"] as? String,
                    let projectInstructions = postData["projectInstructions"] as? String,
                    let userID = postData["userID"] as? String,
                    let postID = postData["postID"] as? String else { return }
                let post = Post(projectPicURLAsString: projectPicURL, userID: userID, projectTitle: projectTitle, projectInstructions: projectInstructions, postID: postID)
                if let flags = postData["flags"] as? Int {
                    post.flags = flags
                }
                self.posts.append(post)
                if let postFlags = post.flags {
                    if postFlags == 3 {
                        guard let index = self.posts.index(of: post) else { return }
                        self.posts.remove(at: index)
                    }
                }
                self.viewProjectsCollectionView.reloadData()
            }
        }
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if Auth.auth().currentUser != nil {
            let postVC = sb.instantiateViewController(withIdentifier: "PostVC")
            self.present(postVC, animated: true, completion: nil)
        } else {
            let signUpVC = sb.instantiateViewController(withIdentifier: "SignUpVC")
            present(signUpVC, animated: true, completion: nil)
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toProjectDetailVC" {
            guard let destinationVC = segue.destination as? ProjectDetailViewController,
                let cell = sender as? ProjectBasicInfoCollectionViewCell,
                let indexPath = viewProjectsCollectionView.indexPath(for: cell) else { return }
            let post = posts[indexPath.row]
            destinationVC.postImage = cell.projectImage.image
            destinationVC.post = post
        }
    }
}
