//
//  NookService.swift
//  NOOK
//
//  Created by HANAN on 23/04/1443 AH.
//


import Firebase


struct NookService {
    
    static let shared = NookService()
    
    func uploadNook(caption: String, completion: @escaping(Error?, DatabaseReference) -> Void){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let values = [ "uid": uid,
                      "timestamp": Int(NSDate().timeIntervalSince1970),
                      "likes": 0,
                      "renook": 0 ,
                       "caption": caption] as [String : Any]
        
        let ref = REF_NOOKS.childByAutoId()
        //update nook
       ref.updateChildValues(values) { (err ,ref) in
            guard let nookID = ref.key else {return}
            REF_USER_NOOKS.child(uid).updateChildValues([nookID:1], withCompletionBlock: completion)
        }
    }
    
    func fetchNook(completion: @escaping ([Nook]) -> Void) {
        var nooks = [Nook]()
        
        REF_NOOKS.observe(.childAdded) { snapshot in
            guard let dictionary = snapshot.value as? [String: Any] else {return}
            guard let uid = dictionary["uid"] as? String else { return }
            let nookID = snapshot.key
            
            UserService.shared.fatchUser(uid: uid) { user in
                let nook = Nook(user: user, nookID: nookID, dectionary: dictionary)
                nooks.append(nook)
                completion(nooks)
            }
            
        }
        
    }
    
    func fetchNooks(forUser user: User, completion: @escaping([Nook]) -> Void) {
       var nooks = [Nook]()
        
        REF_USER_NOOKS.child(user.uid).observe(.childAdded) { snapshot in
            let nookID = snapshot.key
            
            REF_NOOKS.child(nookID).observeSingleEvent(of: .value) { snapshot in
                guard let dictionary = snapshot.value as? [String: Any] else {return}
                guard let uid = dictionary["uid"] as? String else { return }
                
                UserService.shared.fatchUser(uid: uid) { user in
                    let nook = Nook(user: user, nookID: nookID, dectionary: dictionary)
                    nooks.append(nook)
                    completion(nooks)
                }
                
            }

        }
        
    }
}
