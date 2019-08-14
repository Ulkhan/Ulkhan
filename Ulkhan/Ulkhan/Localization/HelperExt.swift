//
//  HelperExt.swift
//  Ulkhan
//
//  Created by Ulxan Emiraslanov on 8/5/19.
//  Copyright © 2019 Ulxan Emiraslanov. All rights reserved.
//

import UIKit


public extension String {
    /**
     "key".localize() will give localized string
 */
    func localize(_ comment: String = "N/A") -> String {
        let localizationManager = LocalizationManager.shared
        let text = localizationManager.localizedStringForKey(key: self)
        return text
    }
}


// extension UILabel: Localizable {
//    @IBInspectable
//    public var localizeText: String? {
//        get {
//            return nil
//        }
//        set(key) {
//            text = key?.localize()
//        }
//    }
//}
//    
//extension UIButton: Localizable {
//    @IBInspectable
//    public var localizeLabel: String? {
//        get {
//            return nil
//        }
//        set(key) {
//            setTitle(key?.localize(), for: .normal)
//        }
//    }
//}
//
//
//extension UITextField: LocalizeabeAndPlaceHolder {
//    @IBInspectable
//    public var localizeText: String? {
//        get { return nil }
//        set(key) {
//            text = key?.localize()
//        }
//    }
//    
//    @IBInspectable
//    public var LocalizePlaceHolder: String? {
//        get { return nil }
//        set(key) { placeholder = key?.localize() }
//    }
//}


    
