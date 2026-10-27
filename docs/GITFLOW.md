# GitFlow 규칙

## 브랜치

| 브랜치 | 용도 | 만드는 곳 | 합치는 곳 |
| --- | --- | --- | --- |
| `main` | 발표·배포용 안정 버전 | - | - |
| `develop` | 다음 버전 개발 통합 | - | - |
| `feature/<기능>` | 기능 하나 개발 | `develop` | `develop` |
| `release/<버전>` | 버전 마무리(버그 수정, 버전 번호) | `develop` | `main`, `develop` |
| `hotfix/<버전>` | `main`의 급한 버그 수정 | `main` | `main`, `develop` |

예: `feature/weather`, `feature/guided-capture`, `feature/outfit-analysis`, `release/0.1.0`

## 작업 순서

1. `develop`에서 `feature/<기능>` 브랜치를 만든다.
   ```bash
   git checkout develop && git pull
   git checkout -b feature/weather
   ```
2. 작업 후 푸시하고 `develop`으로 PR을 연다. 팀원 1명 이상 리뷰 후 머지한다.
3. 버전 기능이 다 모이면 `release/0.1.0`을 만들어 다듬고, `main`과 `develop`에 머지한 뒤 `v0.1.0` 태그를 단다.

## 커밋 메시지

`<타입>: <내용>` 형식으로 쓴다.

- `feat`: 새 기능
- `fix`: 버그 수정
- `docs`: 문서
- `refactor`: 동작 변경 없는 코드 정리
- `chore`: 설정, 빌드

예: `feat: 오늘 기온 음성 안내 추가`
