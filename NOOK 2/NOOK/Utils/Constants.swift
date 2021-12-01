//
//  Constants.swift
//  NOOK
//
//  Created by HANAN on 22/04/1443 AH.
//

import Firebase

let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")


let STORAGE_REF = Storage.storage().reference()
let STORAGE_PROFILE_IMAGES = STORAGE_REF.child("profile_images")
let REF_NOOKS = DB_REF.child("nooks")
let REF_USER_NOOKS = DB_REF.child("user-Nooks")
let REF_USER_FOLLOWERS = DB_REF.child("user-followers")
let REF_USER_FOLLOWING = DB_REF.child("user-following")
