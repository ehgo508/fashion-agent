# 패션 에이전트 (Fashion Agent)

시각장애인을 위한 코디 도우미 앱입니다. 오늘의 날씨와 기온을 확인하고, 음성 안내에 따라 찍은 앞모습·뒷모습 사진을 AI로 분석해 상의·하의·신발의 색 조합을 음성으로 추천합니다.

## 로드맵

| 버전 | 목표 |
| --- | --- |
| v0.1 초기 모델 | 날씨·기온 조회, 음성 안내 촬영(앞/뒤), 입은 옷 색 분석과 색 조합 추천 |
| v0.2 | 디지털 옷장: 내 옷을 등록하고 그 안에서 추천 |
| v0.3 | 사람 위치 인식으로 거리 안내("한 발짝 뒤로 가주세요"), 접근성 개선 |
| 이후 | 홈캠·펫캠 연동, NFC 옷걸이 태그 |

발표 마감: 2026-11-20

## 기술 스택

- 앱: Flutter (iOS, Android, 웹)
- 음성 안내: flutter_tts
- 카메라: camera
- 날씨: 기상청 단기예보 API 또는 OpenWeatherMap
- 옷 분석: 이미지 이해 AI API

## 시작하기

```bash
git clone https://github.com/ehgo508/fashion-agent.git
cd fashion-agent
git checkout develop
flutter create --org com.fashionagent --platforms=android,ios,web .   # 처음 한 번만, 플랫폼 폴더 생성
flutter pub get
flutter run
```

`flutter create .`는 기존 `lib/`와 `pubspec.yaml`을 덮어쓰지 않고 android, ios, web 폴더만 만들어 줍니다. 처음 생성한 사람이 `feature/platform-setup` 브랜치로 올려 주세요.

## 브랜치 전략

GitFlow를 사용합니다. 자세한 규칙은 [docs/GITFLOW.md](docs/GITFLOW.md)를 보세요.
