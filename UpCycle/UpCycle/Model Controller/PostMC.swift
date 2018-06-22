//
//  PostMC.swift
//  UpCycle
//
//  Created by Kimba Hintze on 6/12/18.
//  Copyright © 2018 Kim Lundquist. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth

class PostMC {
    
    static var shared = PostMC()
    
    func flagPost(_ post: Post) {
        fetchFlagQuestionCount(post: post) { (count) in
            guard let count = count else { return }
            let postID = NSUUID().uuidString
            if count == 2 {
                Database.database().reference().child("posts/\(postID)").removeValue()
            } else {
                Database.database().reference().child("posts/\(postID)").updateChildValues(["flagCount": count + 1])
                print("posted to firebase")
            }
        }
    }
    
    private func fetchFlagQuestionCount(post: Post, completion: @escaping(Int?) -> Void) {
        let postID = NSUUID().uuidString
        Database.database().reference().child("posts/\(postID)").observeSingleEvent(of: .value) { (snapshot) in
            if let dictionary = snapshot.value as? [String:Any] {
                guard let count = dictionary["flagcount"] as? Int else { return }
                completion(count)
            } else {
                completion(nil)
            }
        }
    }
}

