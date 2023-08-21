//
//  AuthMeneger.swift
//  RouletteApp
//
//  Created by Igor Kononov on 20.08.2023.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class FirebaseMeneger: ObservableObject {
    static let shared = FirebaseMeneger()
    
    @AppStorage("userLogined") var userLogined = false
    @Published var nameCreated = ""
    @Published var showAlertName = false
    @Published var laderUsers: [UserModel] = []
    @Published var currentUser: UserModel? {
        didSet {
            currentUserCheker()
        }
    }
    
    private var db = Firestore.firestore()
    
    init() {
        if userLogined {
            Task {
                do {
                    try await fetchUserData()
                } catch {
                    print(error)
                }
            }
        }
    }
    
    func signInAnanonimuslu() async throws {
        do {
            let authDataResult = try await Auth.auth().signInAnonymously().user
            
            do {
                let documentSnapshot = try await db.collection("users").document(authDataResult.uid).getDocument()
                
                if documentSnapshot.exists {
                    // User document already exists, no need to create
                } else {
                    guard nameCreated != "" else {
                        DispatchQueue.main.async {
                            self.showAlertName = true
                        }
                        return
                    }
                    DispatchQueue.main.async {
                        self.showAlertName = false
                    }
                    try await db.collection("users").document(authDataResult.uid).setData(
                        ["id": authDataResult.uid, "name": nameCreated, "userPoints": 2000, "winGames": 0 , "payedGames": 0]
                    )
                    DispatchQueue.main.async {
                        self.nameCreated = ""
                    }
                }
                try await fetchUserData()
            } catch {
                print("Error fetching/creating user document: \(error.localizedDescription)")
            }
        } catch {
            print("Error signing in anonymously: \(error)")
        }
    }
    
    func changeBalanceAndWinRate(_ currentUser: UserModel) {
        db.collection("users").document(currentUser.id).setData(
            [ "id": currentUser.id, "name": currentUser.userName, "userPoints": currentUser.moneyBalance, "winGames": currentUser.winGames , "payedGames": currentUser.payedGames]
        )
    }
    
    func deleteAccount() {
        let user = Auth.auth().currentUser
        
        if let uid = user?.uid {
            db.collection("users").document(uid).delete { error in
                if let error = error {
                    print("Error deleting user document: \(error.localizedDescription)")
                } else {
                    print("User document deleted successfully.")
                    user?.delete { authError in
                        if let authError = authError {
                            print("Error deleting user account: \(authError.localizedDescription)")
                        } else {
                            print("User account deleted successfully.")
                            DispatchQueue.main.async {
                                self.currentUser = nil
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func fetchUserData() async throws {
        if let uid = Auth.auth().currentUser?.uid {
            db.collection("users").document(uid).addSnapshotListener { documentSnapshot, error in
                if let error = error {
                    print("Error fetching document: \(error.localizedDescription)")
                    return
                }
                
                guard let document = documentSnapshot else {
                    print("Document does not exist")
                    return
                }
                
                if document.exists {
                    if let data = document.data() {
                        let email = data["email"] as? String
                        let userName = data["name"] as? String
                        let userPoints = data["userPoints"] as? Int
                        let winGames = data["winGames"] as? Int
                        let payedGames = data["payedGames"] as? Int
                        
                        DispatchQueue.main.async {
                            self.currentUser = UserModel(
                                id: uid,
                                email: email,
                                userName: userName ?? "no name",
                                moneyBalance: userPoints ?? 2000,
                                winGames: winGames ?? 0,
                                payedGames: payedGames ?? 0
                            )
                        }
                    }
                } else {
                    print("Document does not exist")
                }
            }
        }
    }
    
    private func currentUserCheker() {
        print(currentUser)
        DispatchQueue.main.async {
            if self.currentUser == nil {
                self.userLogined = false
            } else {
                self.userLogined = true
            }
        }
    }
    
    func getLeaderUsers() async throws {
        do {
            let querySnapshot = try await db.collection("users").getDocuments()
            
            for document in querySnapshot.documents {
                let data = document.data()

                if let id = data["id"] as? String,
                   let userName = data["name"] as? String,
                   let userPoints = data["userPoints"] as? Int {
                    let email = data["email"] as? String
                    let winGames = data["winGames"] as? Int
                    let payedGames = data["payedGames"] as? Int
                    
                    let newUser = UserModel(
                        id: id,
                        email: email,
                        userName: userName,
                        moneyBalance: userPoints,
                        winGames: winGames ?? 0,
                        payedGames: payedGames ?? 0
                    )
                    
                    if let existingIndex = laderUsers.firstIndex(where: { $0.id == id }) {
                        // Update existing user data
                        laderUsers[existingIndex] = newUser
                    } else {
                        // Add new user
                        laderUsers.append(newUser)
                    }
                }
            }
        } catch {
            print("Error fetching leader users: \(error.localizedDescription)")
        }
    }
}
