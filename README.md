개발환경

타겟 디바이스 및 기준 사이즈: iPhone 13
미니멈 배포버전: iOS 15.0
Xcode 14.1 (Pods 호환 문제로 Project Format은 Xcode 13.0 Compatible로 설정)
iOS 개발 명세

디자인 패턴: MVC
UI: Storyboard
언어: Swift
라이브러리 (CocoaPods, SPM)
IQKeyboardManager: 텍스트필드 키보드 등 제어 
Alamofire: 네트워크 통신 
Toast: 토스트 메시지 
그 외 추후 추가
작업 시 주의사항

작업파일 
Cocoapods 으로 작업했으므로 *.xcworkspace 파일을 열어 작업
시작 스토리보드 설정 
Info.Plist에서 Scene Configuration > Application Session Role > Item 0 > Storyboard Name 에서 본인이 작업하고 있는 스토리보드 이름 (예를 들어 Auth.storyboard라면 Auth 입력)을 넣어 빌드 시 바로 확인할 수 있도록 하기.
PARASOL 프로젝트 아이콘 클릭 > Targets 탭의 wowmate > Build Settings 탭 클릭 > UIKit Main Storyboard File Base Name에도 작업하고 있는 스토리보드 이름을 동일하게 입력
팀 설정 
Signing & Capabilities 에러가 있을 경우 Team을 None으로 설정해서 빌드하면 됩니다.

