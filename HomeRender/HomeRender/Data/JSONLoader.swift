import Foundation

enum JSONLoaderError: Error {
    case failedToLoadFile(String)
    case failedToDecodeFile(String, Error)
}

enum JSONLoader {
    static func load<T: Decodable>(_ fileName: String) throws -> T {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            throw JSONLoaderError.failedToLoadFile(fileName)
        }

        do {
            let data = try Data(contentsOf: url)
            
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw JSONLoaderError.failedToDecodeFile(fileName, error)
        }
    }
}
