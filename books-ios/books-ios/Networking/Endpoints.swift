//
//  Endpoints.swift
//  books-ios
//
//  Created by Henrique Barbosa on 05/07/21.
//

import UIKit

struct Endpoint {
    var url: URL?
    var host: String = "https://books.ioasys.com.br"
    init() {
        url = URL(string: host)
    }
    init(withHost: String) {
        url = URL(string: withHost)
    }
    init(withPath: Path) {
        self.url = URL(string: host)
        url?.appendPathComponent(withPath.rawValue)
    }
    init(withPath: String) {
        self.url = URL(string: host)
        url?.appendPathComponent(withPath)
    }
}
