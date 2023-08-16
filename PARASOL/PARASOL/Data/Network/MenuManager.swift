//
//  MenuManager.swift
//  PARASOL
//
//  Created by Jini on 2023/08/14.
//

import Foundation
import Moya

class MenuManager {
    private init() {}
    static let shared = MenuManager()
    lazy var provider = MoyaProvider<MenuAPI>()
    
    func user_getRentalList(completion: @escaping (Result<RentalListModel, Error>) -> Void ) {
        provider.request(.rentalList) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(RentalListModel.self, from: data.data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func sellUmbrella(id: Int, completion: @escaping (Result<[String : Any], Error>) -> Void ) {
        provider.request(.sellUmbrella(id: id)) { result in
            switch result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data.data, options: []) as? [String : Any] {
                    completion(.success(json))
                }
            case .failure(let Error):
                completion(.failure(Error))
            }
        }
    }
    
    func user_getSellRecord(completion: @escaping (Result<SellRecordModel, Error>) -> Void ) {
        provider.request(.sellRecord) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(SellRecordModel.self, from: data.data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func editShopInfo(editShopInfoData: EditInfoModel, completion: @escaping (Result<[String : Any], Error>) -> Void ) {
        provider.request(.editInfo(param: editShopInfoData)) { result in
            switch result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data.data, options: []) as? [String : Any] {
                    completion(.success(json))
                }
            case .failure(let Error):
                completion(.failure(Error))
            }
        }
    }
    
    /*func upLoadPhoto(image: UIImage, completion: @escaping (Result<[String : Any], Error>) -> Void ) {
        provider.request(.uploadPhoto(image: image)) { result in
            switch result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data.data, options: []) as? [String : Any] {
                    completion(.success(json))
                }
            case .failure(let Error):
                // 업로드 실패 시 처리
                completion(.failure(Error))
            }
        }
    }*/
    
    
    
    
    
}


/*
 
 @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     picker.dismiss(animated: true, completion: nil)

     if let selectedImage = info[.originalImage] as? UIImage {
         // 이미지 업로드 요청
         uploadImage(selectedImage)
     }
 }

 func uploadImage(_ image: UIImage) {
     MoyaProvider<MenuAPI>().request(.uploadPhoto(image: image)) { result in
         switch result {
         case .success(let response):
             // 업로드 성공 시 처리
             if let uploadedImageURL = response.url {
                 let picView = UIImageView(image: image)
                 picView.contentMode = .scaleAspectFill
                 picView.clipsToBounds = true
                 picView.layer.cornerRadius = 20
                 picView.setDimensions(height: 107, width: 129)
                 
                 self.picsStackView.addArrangedSubview(picView)
             }
         case .failure(let error):
             // 업로드 실패 시 처리
             print("Image upload error: \(error)")
             // ...
         }
     }
 }

 
 */
