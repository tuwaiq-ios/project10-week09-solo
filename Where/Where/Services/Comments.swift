//
//  File.swift
//  Where
//
//  Created by ibrahim asiri on 19/04/1443 AH.
//

import UIKit
import FirebaseFirestore

class CommentsService {
    static let shared = CommentsService()
    let CommentsCollection = Firestore.firestore().collection("notes")
    
    func updateOrAddNote(comment: CommentCafe) {
        CommentsCollection.document(comment.id).setData([
            "id": comment.id,
            "content": comment.comment
        ], merge: true)
    }
    
    func listenToComments(completion: @escaping (([CommentCafe]) -> Void)) {
        CommentsCollection.addSnapshotListener { snapshot, error in
            if error != nil {
                return
            }
            
            guard let docs = snapshot?.documents else { return }
            var comments = [CommentCafe]()
            
            for doc in docs {
                let data = doc.data()
                guard
                    let id = data["id"] as? String,
                    let comment = data["content"] as? String
                else {
                    continue
                }
                
                comments.append(CommentCafe(id: id, comment: comment))
            }
            
            completion(comments)
        }
    }
}
