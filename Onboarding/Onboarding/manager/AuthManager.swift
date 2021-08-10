//
//  AuthManager.swift
//  Onboarding
//
//  Created by Jiyoung Park on 2021/08/10.
//

import Foundation
import FirebaseAuth

struct AuthManager {
    
    let auth = Auth.auth()
    
    enum AuthError: Error {
        case unknownError
    }
    
    func signUpNewUser(withEmail email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        
        auth.createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                completion(.failure(error))
            } else if let user = result?.user {
                completion(.success(user))
            } else {
                completion(.failure(AuthError.unknownError))
            }
        }
    }
    
    func loginUser(withEmail email: String, password: String, completion: @escaping(Result<User, Error>) -> Void) {
        
        auth.signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                completion(.failure(error))
            } else if let user = result?.user {
                completion(.success(user))
            } else {
                completion(.failure(AuthError.unknownError))
            }
        }
    }
    
    func logoutUser() -> Result<Void, Error> {
        
        do {
            try Auth.auth().signOut()
            return .success(())
        } catch(let error) {
            return .failure(error)
        }
    }
}