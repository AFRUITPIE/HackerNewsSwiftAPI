extension String {
    func toInt() -> Int? {
        let foo = self.replacingOccurrences(of:"[^0-9]", with: "", options: .regularExpression)
        return Int(foo)
    }
}