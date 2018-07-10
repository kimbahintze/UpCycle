//
//  PostViewController.swift
//  UpCycle
//
//  Created by Kimba Hintze on 6/4/18.
//  Copyright © 2018 Kim Lundquist. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class PostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    
    @IBOutlet weak var postProjectImage: UIImageView!
    @IBOutlet weak var postProjectTextField: UITextField!
    @IBOutlet weak var postInstructionsTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var addLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    
    var storageRef: StorageReference!
    var databaseRef: DatabaseReference!
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storageRef = Storage.storage().reference()
        databaseRef = Database.database().reference()
        design()
        postProjectImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleProjectImage)))
        postProjectImage.isUserInteractionEnabled = true
        postInstructionsTextView.delegate = self
    }
    
    // Choose an image from the library
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedImageFromPicker = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            selectedImageFromPicker = originalImage
        }
        if let selectedImage = selectedImageFromPicker {
            postProjectImage.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleProjectImage() {
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("canceled picker")
        dismiss(animated: true, completion: nil)
    }
    
    // save or cancel the post
    @IBAction func savePost(_ sender: Any) {
        // get userId
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        // get postId
        let postID = NSUUID().uuidString
        
        // load the image into storage
        let post = storageRef.child("posts").child(postID)
        
        // title and instructions
        guard let postTitle = postProjectTextField.text, !postTitle.isEmpty else { return }
        guard let postInstructions = postInstructionsTextView.text, !postInstructions.isEmpty else { return }
        guard let postImage = postProjectImage.image else { return }
        
        // get image from imageview
        if let imageData = UIImagePNGRepresentation(postImage) {
            post.putData(imageData, metadata: nil) { (metadata, error) in
                if error != nil {
                    print(error!)
                    return
                }
                post.downloadURL(completion: { (url, error) in
                    if error != nil {
                        print(error!)
                        return
                    }
                    
                    if let imageURL = url?.absoluteString {
                        self.databaseRef.observeSingleEvent(of: .value, with: { (snapshot) in
                            _ = snapshot.value as? NSDictionary
                            print("creating new post")
                            
                            let projectPicURLAsString = imageURL
                            
                            let newPost = Post(projectPicURLAsString: projectPicURLAsString, userID: userID, projectTitle: postTitle, projectInstructions: postInstructions, postID: postID)
                            
                            // store post in the dictionary
                            let postRef = self.databaseRef.child("posts").child(postID)
                            postRef.updateChildValues(newPost.returnPostAsDictionary() as! [AnyHashable: Any])
                            self.dismiss(animated: true, completion: nil)
                        })
                    }
                })
            }
            
        }
    }
    
    @IBAction func cancelUpload(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // access camera
    @IBAction func takePicture(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.allowsEditing = false
            picker.sourceType = UIImagePickerControllerSourceType.camera
            picker.cameraCaptureMode = UIImagePickerControllerCameraCaptureMode.photo
            picker.modalPresentationStyle = .fullScreen
            present(picker, animated: true, completion: nil)
        } else {
            noCameraAvailable()
        }
    }
    
    func noCameraAvailable() {
        let alert = UIAlertController(title: "No Camera Available", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.dismiss(animated: true, completion: nil)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func design() {
        postProjectImage.layer.cornerRadius = 15
        postProjectTextField.font = UIFont(name: MontserratMedium, size: 15)
        postInstructionsTextView.font = UIFont(name: MontserratThin, size: 13)
        saveButton.titleLabel?.font = UIFont(name: MontserratMedium, size: 15)
        cancelButton.titleLabel?.font = UIFont(name: MontserratMedium, size: 15)
        logoutButton.titleLabel?.font = UIFont(name: MontserratMedium, size: 15)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        postInstructionsTextView.text = ""
    }
}

extension PostViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case postProjectTextField:
            postProjectTextField.resignFirstResponder()
            postInstructionsTextView.becomeFirstResponder()
            break
        case postInstructionsTextView:
            break
        default:
            break
        }
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}


