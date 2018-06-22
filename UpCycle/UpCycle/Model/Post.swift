//
//  Post.swift
//  UpCycle
//
//  Created by Kimba Hintze on 6/12/18.
//  Copyright © 2018 Kim Lundquist. All rights reserved.
//

import Foundation

class Post: Codable, Equatable {
    var projectPicURLAsString: String
    let userID: String
    var projectTitle: String
    var projectInstructions: String
    let postID: String
    var flags: Int?
    
    init(projectPicURLAsString: String, userID: String, projectTitle: String, projectInstructions: String, postID: String) {
        self.projectPicURLAsString = projectPicURLAsString
        self.userID = userID
        self.projectTitle = projectTitle
        self.projectInstructions = projectInstructions
        self.postID = postID
    }
    
    func returnPostAsDictionary() -> NSDictionary {
        let postDictionary: NSDictionary = [
            "projectPicURLAsString": projectPicURLAsString,
            "userID": userID,
            "projectTitle": projectTitle,
            "projectInstructions": projectInstructions,
            "postID": postID,
            "flags" : flags ?? 0
        ]
        return postDictionary
    }
}

func ==(lhs: Post, rhs: Post) -> Bool {
    return lhs.projectPicURLAsString == rhs.projectPicURLAsString && lhs.userID == rhs.userID && lhs.projectTitle == rhs.projectTitle && lhs.projectInstructions == rhs.projectInstructions 
}
