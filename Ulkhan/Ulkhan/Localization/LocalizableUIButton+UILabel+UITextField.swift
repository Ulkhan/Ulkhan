//
//  LocalizableUIButton+UILabel+UITextField.swift
//  Ulkhan
//
//  Created by Ulxan Emiraslanov on 8/8/19.
//  Copyright © 2019 Ulxan Emiraslanov. All rights reserved.
//

import UIKit


class LocalizableButton: UIButton {
    @IBInspectable
        public var localizeTitle: String? {
            get {
                return nil
            }
            set(key) {
                setTitle(key?.localize(), for: .normal)
            }
        }
}


class LocalizableLabel: UILabel {
        @IBInspectable
        public var localizeText: String? {
            get {
                return nil
            }
            set(key) {
                text = key?.localize()
            }
        }
}


class LocalizableTextField: UITextField {
    @IBInspectable
        public var localizeText: String? {
            get { return nil }
            set(key) {
                text = key?.localize()
            }
        }
    
        @IBInspectable
        public var LocalizePlaceHolder: String? {
            get { return nil }
            set(key) { placeholder = key?.localize() }
        }
}
