//
//  ServicesProtoocol.swift
//  CMB
//
//  Created by Sreynaet.NHAN on 29/5/26.
//

import Foundation

protocol ApiServiceProtocol {
    func fetchTodos() async throws -> [Todo]
    func fetchTodoById(_ id: Int) async throws -> Todo
}
