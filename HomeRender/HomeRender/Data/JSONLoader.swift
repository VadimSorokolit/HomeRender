import Foundation

enum JSONLoader {
	static func load<T: Decodable>(_ fileName: String) -> T {
		guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
			fatalError("Missing json file: \(fileName).json")
		}

		do {
			let data = try Data(contentsOf: url)
			return try JSONDecoder().decode(T.self, from: data)
		} catch {
			fatalError("Failed to decode \(fileName).json: \(error)")
		}
	}
}
