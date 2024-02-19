//
//  String+Extension.swift
//  YatayMenu
//
//  Created by Ahmet Karamanoğlu on 18.02.2024.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
