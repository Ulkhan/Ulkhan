//
//  LocalizationManager.swift
//  Ulkhan
//
//  Created by Ulxan Emiraslanov on 8/5/19.
//  Copyright © 2019 Ulxan Emiraslanov. All rights reserved.
//

import UIKit

public class LocalizationManager: NSObject {
    
    var bundle: Bundle!
    
    public class var shared: LocalizationManager {
        struct Singleton {
            static let instance: LocalizationManager = LocalizationManager()
        }
        return Singleton.instance
    }
    
    override init() {
        super.init()
        bundle = Bundle.main
    }
    
    public func localizedStringForKey(key: String, comment: String = "N/A") -> String {
        return bundle.localizedString(forKey: key, value: comment, table: nil)
        
    }
    
    
    public func localizedImagePathForImg(imagename:String, type:String) -> String {
        guard let imagePath =  bundle.path(forResource: imagename, ofType: type) else {
            return ""
        }
        return imagePath
    }
    
    //MARK:- setLanguage
    // Sets the desired language of the ones you have.
    // If this function is not called it will use the default OS language.
    // If the language does not exists y returns the default OS language.
    public func setLanguage(languageCode:String) {
        var appleLanguages = UserDefaults.standard.object(forKey: "AppleLanguages") as! [String]
        appleLanguages.remove(at: 0)
        appleLanguages.insert(languageCode, at: 0)
        UserDefaults.standard.set(appleLanguages, forKey: "AppleLanguages")
        UserDefaults.standard.synchronize() //needs restrat
        
        if let languageDirectoryPath = Bundle.main.path(forResource: languageCode, ofType: "lproj")  {
            bundle = Bundle.init(path: languageDirectoryPath)
        } else {
            resetLocalization()
        }
    }
    
    //MARK:- resetLocalization
    //Resets the localization system, so it uses the OS default language.
    public func resetLocalization() {
        bundle = Bundle.main
    }
    
    //MARK:- getLanguage
    // Just gets the current setted up language.
    public func getLanguage() -> String {
        let appleLanguages = UserDefaults.standard.object(forKey: "AppleLanguages") as! [String]
        let prefferedLanguage = appleLanguages[0]
        if prefferedLanguage.contains("-") {
            let array = prefferedLanguage.components(separatedBy: "-")
            return array[0]
        }
        return prefferedLanguage
    }
    
}



