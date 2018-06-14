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
    
    
    // var index: Int = 0

    var baseURL = URL(string: "https://upcycle-1528217976799.firebaseio.com/")
//    
//    enum NotificationKey {
//        static let reloadCollectionView = Notification.Name("reloadCollectionView")
//    }
//    
//    var posts: [Post] = [] {
//        didSet {
//            NotificationCenter.default.post(name: NotificationKey.reloadCollectionView, object: nil)
//        }
//    }
//   
//    private func fetchPosts(completion: @escaping() -> Void) {
//        Database.database().reference().child("posts").observeSingleEvent(of: .value) { (snapshot) in
//            if let postDictionary = snapshot.value as? [String: Any] {
//                var fetchedPost: [Post] = []
//                postDictionary.forEach({ (key, value) in
//                    guard let postDict = value as? [String: Any] else { completion(); return }
//                    guard let newPost = Post(
//                })
//            }
//        }
//    }
    
}

