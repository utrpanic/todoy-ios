import Foundation

protocol UserDefaultsProtocol {
    func bool(forKey defaultName: String) -> Bool
    func integer(forKey defaultName: String) -> Int
    func float(forKey defaultName: String) -> Float
    func double(forKey defaultName: String) -> Double
    func string(forKey defaultName: String) -> String?
    func data(forKey defaultName: String) -> Data?
    func object(forKey defaultName: String) -> Any?
    func set(_ value: Any?, forKey defaultName: String)
}

extension UserDefaults: UserDefaultsProtocol {
    
    static var todoy: UserDefaultsProtocol {
        let bundleId = Bundle.main.bundleIdentifier!
        return UserDefaults(suiteName: "group.\(bundleId)")!
    }
}
