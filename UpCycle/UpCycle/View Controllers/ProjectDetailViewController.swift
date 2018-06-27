//
//  ViewProjectViewController.swift
//  UpCycle
//
//  Created by Kimba Hintze on 6/4/18.
//  Copyright © 2018 Kim Lundquist. All rights reserved.
//

import UIKit
import Firebase

class ProjectDetailViewController: UIViewController {
    
    var post: Post?
    var postImage: UIImage?
    
    // MARK: - Outlets
    @IBOutlet weak var projectImage: UIImageView!
    @IBOutlet weak var projectTitleLabel: UILabel!
    @IBOutlet weak var projectInstructionsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        design()
        navigationItem.titleView = logoTitleView()
    }
    
    // MARK - Actions
    @IBAction func flagButtonTapped(_ sender: Any) {
        guard let post = post else { return }
        if post.userID != Auth.auth().currentUser?.uid {
            let alertController = UIAlertController(title: "Report as Inappropriate", message: nil, preferredStyle: .alert)
            let flagAction = UIAlertAction(title: "Yes", style: .default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(flagAction)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
            
            
            let flaggedPostRef = Database.database().reference().child("flaggedPosts").child(post.postID)
            
            let flaggedDict = ["projectPicURLAsString": post.projectPicURLAsString,
                               "userID": post.userID,
                               "projectTitle": post.projectTitle,
                               "reporterUID": Auth.auth().currentUser?.uid]
            
            flaggedPostRef.updateChildValues(flaggedDict as Any as! [AnyHashable : Any])
            
            let flagCountRef = flaggedPostRef.child("flagCount")
            flagCountRef.runTransactionBlock { (mutableData) -> TransactionResult in
                let currentCount = mutableData.value as? Int ?? 0
                mutableData.value = currentCount + 1
                return TransactionResult.success(withValue: mutableData)
            }
        } else {
            let alertController = UIAlertController(title: "Cannot flag your own post.", message: nil, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func updateViews() {
        guard let post = post,
            let postImage = postImage else { return }
        projectImage.image = postImage
        projectImage.clipsToBounds = true
        projectImage.layer.cornerRadius = 25
        projectTitleLabel.text = post.projectTitle
        projectInstructionsTextView.text = post.projectInstructions
    }
    
    func design() {
        projectTitleLabel.textColor = darkGrayColor
        projectTitleLabel.font = UIFont(name: "Montserrat-Medium", size: 14)
        projectInstructionsTextView.font = UIFont(name: "Montserrat-Thin", size: 13)
        projectInstructionsTextView.isEditable = false
        projectImage.layer.cornerRadius = 15
    }
}
