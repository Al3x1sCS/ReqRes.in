//
//  UserPages.swift
//  APIReqRes
//
//  Created by user216592 on 4/7/22.
//

import Foundation

class UserPages: Codable {
   var page: Int?
        /*"per_page": 6,
        "total": 12,
        "total_pages": 2,*/
    
    var  data: [UserModel]
}
