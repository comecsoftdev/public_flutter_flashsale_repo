# 내 주변의 모~든 할인 가게로
![enter image description here](https://www.comecsoft.com/images/graphic_design.png)
  
## 가게로
**가게로**는 자영업자 사장님들과 소비자들을 연결하는 앱으로 내 주변의 할인 정보를 제공합니다.

 1. 자영업자 사장님들은 수수료 없이 무료로 주변 고객에게 내 가게, 내 상품을 홍보할 수 있습니다.
 
 2. 소비자들은 근처의 할인 중인 가게를 찾아서 매력적인 가격으로 상품을 구매할 수 있습니다.

> 아직 홍보 부족으로 등록된 가게가 많지 않습니다. 열심히 홍보해서 많은 가게들이 등록되도록 하겠습니다.
  
## 공개된 소스
공개된 **가게로** 소스는 플러터(flutter)로 작성된 안드로이드 앱 소스입니다.  
실제 서비스되고 있는 소스이며, 구글 플레이스토어에서 설치해서 이용할 수 있습니다.

대부분의 소스는 공개되었으나, 아래 내용과 관련된 일부 소스들은 공개하지 않았습니다.
 (공개되지 않은 파일들은 아래 디렉토리 구조 참조)

 1. 서비스 키(Key)값을 포함하고 있는 환경변수(kakao, google, facebook등의 서비스 키값들)
 2. 앱의 주요 정보를 포함하고 있는 파일(인증서, 앱 id 등)
 3. 앱에 사용되는 이미지파일들

 ```bash
├── .private
│   ├── debug
│   │   └── .env
│   └── prod
│       └── .env
├── android
│   ├── app
│   │   └── src
│   │   │   └── main
│   │   │       └── res
│   │   │           └── values
│   │   │               └── strings.xml
│   │   ├── proguard-rules.pro
│   │   ├── google-services.json
│   │   └── flashsale.keystore
│   └── key.properties
└── assets
     └── images
``` 
   
 ## 소프트웨어 블로그
 가게로 앱에서 사용된 SW의 기술적인 내용들은 네이버 블로그로 정리를 해서 공유할 예정입니다.
 하나씩 기술 블로그가 작성되면 공유하도록 하겠습니다.
 블로그 위치는 아래 참고사이트의 **가게로 네이버 블로그** 내 '가게로 SW 기술 공유' 카테고리를 참조하세요.
  
## 참고사이트
[가게로 홈페이지](https://www.comecsoft.com)  
[가게로 구글 앱 스토어](https://play.google.com/store/apps/details?id=com.comecsoft.flashsale)  
[가게로 깃허브 앱 소스](https://github.com/comecsoftdev/public_flutter_flashsale_repo)  
[가게로 깃허브 서버 소스](https://github.com/comecsoftdev/public_python_flashsale_simple_repo)  
[가게로 네이버 블로그(앱 관련)](https://blog.naver.com/comecsoftdev/222642871326)  
[가게로 네이버 블로그(서버 관련)](https://blog.naver.com/comecsoftdev/222655625230)  
[가게로 소비자 홍보 동영상](https://youtu.be/i53kbQxKv7c)  
[가게로 판매자 홍보 동영상](https://youtu.be/7BelvWtrLaU)  


