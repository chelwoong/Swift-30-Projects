# 배운내용
- [AVPlayer](#avplayer)

# ScreenShot
<img src="PlayLocalVideo.gif" width="250" />

# AVPlayer
AVPlayer 는 동영상 재생 플레이어를 제공하는 객체이다.  

AVPlayer는 `AVKit`에 들어있으므로 이를 **import**해서 사용한다.  

```swift
import AVKit

let url = URL(fileURLWithPath: localPath + "v\(indexPath.row+1).mp4")
  let player = AVPlayer(url: url)
  let playerViewController = AVPlayerViewController()
  playerViewController.player = player
  present(playerViewController, animated: true) {
      player.play()
}
```
