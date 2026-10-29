# 패션 에이전트 (Fashion Agent)

시각장애인을 위한 코디 도우미 앱입니다. 입고 싶은 옷을 펼쳐 놓고 폰으로 비추면, 색·무늬를 알려 주고 어울리는지와 오늘 날씨에 맞는지를 이유와 함께 음성으로 피드백합니다. 안 어울리면 옷장을 비춰 대안과 그 위치를 알려 줍니다.

## 로드맵

| 버전 | 목표 |
| --- | --- |
| v0.1 초기 모델 | 날씨 안내, 고른 옷 피드백(색·무늬·날씨), 옷장에서 대안 찾기, 꺼낸 옷 확인, 본 옷 설명을 폰에 저장 |
| v0.2 | 쌓인 옷 목록으로 바로 추천, Apple 로그인 백업, 같은 옷 합치기 |
| v0.3 | 사람 위치 인식으로 거리 안내("한 발짝 뒤로 가주세요"), 접근성 개선 |
| 이후 | 홈캠·펫캠 연동, NFC 옷걸이 태그 |

발표 마감: 2026-11-20

## 기술 스택

- 앱: Flutter (아이폰 우선, Android·웹은 이후)
- 음성 안내: flutter_tts
- 카메라: camera
- 날씨: Open-Meteo (API 키 없음)
- 옷 분석: 비전 LLM (앱 → `server/` 프록시 → LLM, 형식은 [server/README.md](server/README.md))
- 저장: shared_preferences (옷 설명만, 사진은 저장 안 함)

## 구조

```
lib/
  models/     Garment, ClothesScan, OutfitFeedback, Weather
  services/   음성, 날씨, 카메라, 비전 AI(진짜/가짜), 옷 저장
  styling/    색 조합·날씨·위치 규칙 (AI가 아닌 규칙으로 판단)
  session/    단계별 흐름(상태 머신)
  screens/    화면 하나, 위·아래 두 개의 큰 버튼
server/       비전 프록시 (API 키 보관)
```

화면은 상태만 그리고, 판단은 `styling/` 규칙이 합니다. 비전 AI는 옷의 색·무늬 같은 사실만 돌려줍니다.

## 시작하기

```bash
git clone https://github.com/fashion-agent-team/fashion-agent.git
cd fashion-agent
git checkout develop
flutter pub get
flutter run                                  # 가짜 비전 AI로 실행
flutter run --dart-define=FAKE_CAMERA=true   # 카메라 없는 시뮬레이터
flutter run --dart-define=VISION_URL=https://<프록시 주소>
flutter test
```

## 브랜치 전략

GitFlow를 사용합니다. 자세한 규칙은 [docs/GITFLOW.md](docs/GITFLOW.md)를 보세요.
