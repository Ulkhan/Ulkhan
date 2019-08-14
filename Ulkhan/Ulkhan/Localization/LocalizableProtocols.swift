//
//  LocalizableProtocols.swift
//  Ulkhan
//
//  Created by Ulxan Emiraslanov on 8/8/19.
//  Copyright © 2019 Ulxan Emiraslanov. All rights reserved.
//

import Foundation

//MARK: - Localizable protocol
public protocol Localizable {
    var localize: String? { get set }
}

public protocol LocalizeabeAndPlaceHolder: Localizable {
    var placeHolder: String? { get set }
}
