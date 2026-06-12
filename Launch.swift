//
//  Launch.swift
//  await
//
//  Created by Amandine on 12/04/26.
//
import Foundation

struct Launch: Codable, Identifiable {
    let id: String
    let name: String
    let success: Bool?
    let details: String?
}
