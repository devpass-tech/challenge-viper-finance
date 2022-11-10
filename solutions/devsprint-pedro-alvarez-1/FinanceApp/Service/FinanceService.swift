//
//  FinanceService.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

class FinanceService {

    func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) {

        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/home_endpoint.json")!

        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in

            guard error == nil else {
                completion(nil)
                return
            }

            guard let data = data else {
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let homeData = try decoder.decode(HomeData.self, from: data)
                completion(homeData)
            } catch {
                print(error)
                completion(nil)
            }
        }

        dataTask.resume()
    }

    func fetchActivityDetails(_ completion: @escaping (ActivityDetails?) -> Void) {

        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/activity_details_endpoint.json")!

        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in

            guard error == nil else {
                completion(nil)
                return
            }

            guard let data = data else {
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let activityDetails = try decoder.decode(ActivityDetails.self, from: data)
                completion(activityDetails)
            } catch {
                print(error)
                completion(nil)
            }
        }

        dataTask.resume()
    }

    func fetchContactList(_ completion: @escaping ([Contact]?) -> Void) {

        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/contact_list_endpoint.json")!

        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in

            guard error == nil else {
                completion(nil)
                return
            }

            guard let data = data else {
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let contactList = try decoder.decode([Contact].self, from: data)
                completion(contactList)
            } catch {
                print(error)
                completion(nil)
            }
        }

        dataTask.resume()
    }

    func transferAmount(_ completion: @escaping (TransferResult?) -> Void) {

        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/transfer_successful_endpoint.json")!

        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in

            guard error == nil else {
                completion(nil)
                return
            }

            guard let data = data else {
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let transferResult = try decoder.decode(TransferResult.self, from: data)
                completion(transferResult)
            } catch {
                print(error)
                completion(nil)
            }
        }

        dataTask.resume()
    }

    func fetchUserProfile(_ completion: @escaping (UserProfile?) -> Void) {

        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/user_profile_endpoint.json")!

        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in

            guard error == nil else {
                completion(nil)
                return
            }

            guard let data = data else {
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let userProfile = try decoder.decode(UserProfile.self, from: data)
                completion(userProfile)
            } catch {
                print(error)
                completion(nil)
            }
        }

        dataTask.resume()
    }

}
