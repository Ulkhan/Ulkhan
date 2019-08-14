//
//  OptionalExtension.swift
//  Ulkhan
//
//  Created by Ulxan Emiraslanov on 8/5/19.
//  Copyright © 2019 Ulxan Emiraslanov. All rights reserved.
//

import Foundation

extension Optional where Wrapped == String {
    /**
     Gives safeValue without using optional binding
     - parameter defaultValue : is "" by default
     - returns: if variable has value returns value, else returns default value(empty String "" or given value)
     */
    public func safeValue(_ defaultValue: String = "") -> String {
        switch self {
        case .some(let value):
            return value
        case _:
            return defaultValue
        }
    }
}


extension Optional where Wrapped == Int {
    /**
     Gives safeValue without using optional binding
     - parameter defaultValue : is 0 by default
     - returns: if variable has value returns value, else returns default value(0 or given value)
     */
    public func safeValue(_ defaultValue: Int = 0) -> Int {
        switch self {
        case .some(let value):
            return value
        case .none:
            return defaultValue
        }
    }
}


extension Optional where Wrapped == Bool {
    /**
     Gives safeValue without using optional binding
     - parameter defaultValue : is false by default
     - returns: if variable has value returns value, else returns default value(false or given value)
 */
    public func safeValue(_ defaultValue: Bool = false) -> Bool {
        switch self {
        case .some(let value):
            return value
        case _:
            return defaultValue
        }
    }
    
}
