//
//  MultiPartMedia.swift
//  Ulkhan
//
//  Created by Ulxan Emiraslanov on 8/9/19.
//  Copyright © 2019 Ulxan Emiraslanov. All rights reserved.
//

import Foundation

public struct Media {
    let name: String
    let fileName: String
    let data: Data
    let mimeType: String
    
    public init(data: Data, withName name: String, fileName: String, mimeType: String) {
        self.data = data
        self.name = name
        self.mimeType = mimeType
        self.fileName = fileName
        
    }
    
}
