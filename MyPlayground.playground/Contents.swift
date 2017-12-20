//: Playground - noun: a place where people can play

import UIKit

let defaults = UserDefaults.standard
defaults.set(0.22, forKey: "volume")
defaults.set(true, forKey: "musicon")
defaults.set("gian", forKey: "playername")
defaults.set(Date(), forKey: "AppLastOpenedByUser")
let arrayDefaults = [1,2,3]
defaults.set(arrayDefaults, forKey: "myArray")
let dictionaryDefaults = ["name":"gianrico","surname":"gambino"]
defaults.set(dictionaryDefaults, forKey: "myDict")

let volume = defaults.float(forKey: "volume")
let appLastOpen = defaults.object(forKey: "AppLastOpenedByUser")
let myArray = defaults.array(forKey: "myArray")
let myDict = defaults.dictionary(forKey: "myDict")
 
