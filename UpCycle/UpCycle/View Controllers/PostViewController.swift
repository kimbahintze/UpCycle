//
//  PostViewController.swift
//  UpCycle
//
//  Created by Kimba Hintze on 6/4/18.
//  Copyright © 2018 Kim Lundquist. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase

class PostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var postProjectImage: UIImageView!
    @IBOutlet weak var postProjectTitleLabel: UITextField!
    @IBOutlet weak var postInstructionsTextView: UITextView!

    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postProjectImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleProjectImage)))
        postProjectImage.isUserInteractionEnabled = true
    }

    @objc func handleProjectImage() {
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    // choose an image from the library
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
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
  
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("canceled picker")
        dismiss(animated: true, completion: nil)
    }
    
    // save or cancel the post
    @IBAction func savePost(_ sender: Any) {
    }
    
    @IBAction func cancelUpload(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // access camera
    @IBAction func takePicture(_ sender: Any) {
    }
    
}
