# GoodAsWoongsiPhone

# ScreenShot
![ScreenShot](./GoodAsWoongsiPhone.gif)

# 배운내용

- [TableView](#tableview)
- [이미지뷰 동그랗게 만들기](#creating-circular-imageview)
- [contentMode](#contentmode)
- [segue를 통한 데이터 전달](#segue를-통한-데이터-전달)
- [button title 수정하기](#button-title-수정하기)

# TableView

### TableView 구조화

기본적인 MVC모델을 사용해본다. 

    Model
      - Memory
    
    Controller
      - AboutViewController
      - FullMemoryViewController
      - MemoryTableViewController
    
    View
      - MemoryTableViewCell

### extension TableView

tableView나 collectionView는 extension으로 처리해서 코드를 깔끔하게 관리하자.  

tableView를 사용하기 위한 기본 extension은 `UITableViewDataSource`, `UITableViewDelegate`

  

`UITableViewDataSource`는 필수적으로 두 개의 함수를 구현해야만 한다.

→ **셀의 개수**와 **셀을 만드는 함수!**

```swift
extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    }
}

```

`UITableViewDelegate` 는 tableView의 일을 대신 처리해주는 아이.

```swift
extension TableViewController: UITableViewDelegate {

}
```

# Creating Circular imageView

이미지 뷰 동그랗게 만들기

```swift
func setToRound(imageView: UIImageView) {
    let radius = imageView.frame.height / 2
    imageView.layer.cornerRadius = radius
}
```  
  
# contentMode

contentMode란 UIView 의 propertiy이다. doc를 보면 bound가 변함에 따라 어떻게 content를 어떻게 할 지 결정할 때 사용된다고 나와있다.   

 `scaleToFill`, `scaleAspectFit`, `scaleAspectFill` 를 살펴보자.

### scaleToFill

정의를 살펴보면, **The option to scale the content to fit the size of itself by changing the aspect ratio of the content if necessary.** 라고 되어있다. 

즉, 자체의 비율을 바꾸더라도 해당 content를 꽉 채우게 된다. 

> 모든 뷰의 기본값은 이 scaleToFill 이다.

그림을 살펴보면 이렇게 된다. 

[scaleToFill](https://lh3.googleusercontent.com/CXva4S72pHktdoLCTXt5hQJyeLB-QRsvEffIENfrcGB3MdQL7cNKITeK8IZXdcTPiHbopD7uTk3j4l2Ee15HIXCbTkDSp-2r8CahQBiBNwTUT4JIm_CuPVRqDeu8rIWLqkCWvmMrUoqb-RZ0XbB-xwG1K4jccbucUv6NmqCs6T2Tda04JXVZlw3gb86YQDE3Yiae4LZAbuo1oF61TTbSBNy9VD7Xo8iwT5zcusvWWFTnNyBUWgMiMJoqjQgqlVrGdYLzTsIBAJwfZbzV7WhsX9EXNQN_Sw0XCSn2Q6srfmEySNHV8djBfeJem7qsO0Dq63MUjQYN0RYwx1bsX6g9UR8R9NK99Rox8ruGrWThIRRxK8WjtRU9WLHFWgLhjVgK5THHyiyYY9w_XEu-W98QnGXxkQS4_ZHsXEh5q8Jm60MA0IDKBkLdTHYjNdflE87P4danETyb9Kfk8AGB1xHoQB1sWo_PZCSpZwO5d6C-l3uHWnicj6fT_H0vxyqWiCb-5HJ9Nx8Cz5XOdoHqRREFiGgEyE0FH9Ir7V4rNx5X8vWtOjrgCQwWARuw64Q7vZoGawqpa-ZOPS4i9OTyD86b_vSbeR9aYqwLBs1jw5fR2oC9uXuQiWwJakMq0oWkvI4_v0HQz9P2DtqsGIXnNu23tfZ0VRqrl9M=w728-h534-no)

### scaleAspectFit

aspect의 사전적 정의를 살펴보면 좀 더 이해가 쉬운데, aspect는 측면, 방향, 외관 등의 뜻이다. 즉 scaleAspectFit은 글자 그대로 모양을 알맞게 맞춘다는 뜻으로 생각할 수 있다.

마찬가지로 정의부터 살펴보자. **The option to scale the content to fit the size of the view by maintaining the aspect ratio. Any remaining area of the view’s bounds is transparent.**

즉, 비율은 유지하고 나머지 부분은 여백으로 남겨둔다.  

[scaleAspectFit](https://lh3.googleusercontent.com/vnyP5ArSiY2N-Y01nxxczTgmwlQolf0QVDAff_Q_pbaH9Kv_e9Wp0PVX56YQWi__XCZIijXoO0qUzytQEGVWBVHsGizR6ZLydpiU80X50uJK9ebdjDdHz-euRnTEQ2iu1JNKMRUZe_lEcKDoZAUjYLgXoTV0I7k991LHMaMegz-bOKE44aygQ47v9tn55KX-wyK1J7Le9cNe2CCz9hAs89xmE3bWt_ZgyjoBnjYh-wvBc55GkIvdP9m65Lg2HPQr4Z_tLE3sTyqncKzFYzoVYfCj4lrW9BDgg6aPKm7aCbaXGa9YA2YOYNzNUKQfd1WTRoFaMiH8FFhGQRWFnNjsqCoghojaCaAZ477556GDW5J-RPZ2OqtaNmqg-1T3Wf-xmqEP7P2FnTjIVkLE0UaviVRSf3-A8qcFNZoSOphJM2H31N-tek1-xVltuV58XB7ZlArSek5nwOiV4JuLSBpFSmBnViRq-Cc_or1OsO39RTVcT0fVxNIgvupU8pBro_e9eBXrAKrvoVgfZuZxevKwzpmmmASVGoA6vgi7ucgFpx-Z7lcszteUpWA7xXm_TeHWie3paiZ10MEz4cBDKqCWFo22HCceW09161MCqRo5blDFNOmL6bgtQBohw0KfCZ8EcgemLEeRjpZT5wqEhT5t3T_s1W13I30=w734-h534-no)

### scaleAspectFill

앞의 scaleAspectFit과 이름부터 유사하다.  

차이는 Fit과 Fill인데, 앞의 scaleAspectFit을 제대로 이해했다면, 말 그대로 비율은 유지하지만 가득 채운다라는 느낌을 바로 이해할 수 있다.

역시 정의를 보면, **The option to scale the content to fill the size of the view. Some portion of the content may be clipped to fill the view’s bounds.**  

 즉, 비율을 유지하면서 화면을 가득 채운다. 이 경우 가득 채우기 위해 이미지 자체가 잘릴 수 있다. 
 
[scaleAspectFill](https://lh3.googleusercontent.com/mZiE_5vj1E3Noq5zzgZe9jdFoUJK7RH4IL5Q9lkyxUNq3b34kd3aa5qaTJRjM3JBxhHgC7SWWSpYnkbhLQwVIuq60Y9qrPuv8eyoDENnPB-VtYeH7M6w3cOd4A_xyFPxblDw7Sszm5N1hoEK5Xfn8Y4VbSShlq24cNm3pqSZXfDX9-xyv8t9GLqDbepyjKmUxFNtu9QKpupj298XtEsJdienAo4DNg59o_iCbB4zVPeVh3QuBLFkEI9q6MrbTxGf4rtHFSaC-ZomCXY7-_V_qToG6UUyG9532IZMnMW5joMbnlkX8kZhv-eh2P4aiGYu3NVW3OHG4Rqx3Pa454SLHZBC0lTOv1pZ8wPd9eHYQHDVB3CmPFhkWE77GCANxEhUlWxNHexhtU9Dz1d9mbYR-HkqX_1J1RmgXFz-dBhfBgI2uznRtwOEgVaFsdy22Ge6XENLFsMt7j2dIIdJ_cP3r8rhO3dLSJpuYsWQz1ApkoytF5OKOG837vGEtdZaAJMdk6hxteLxHWzvcvHsArEc6p3-DBMTzA9Y4lxDGirrYsRIyDT16fpFWvBg6uITNAKqxOLATH0pK0iGS-r-3Q1_PWs_jrwvqRei9PAOZRaJIRrSnMRFTIgDJW4vKaRTU_57DhDMgQM2yKbx0eRScgmlVCSVTXP1HAY=w732-h530-no)

여기까지 이해했다면 다음 사진을 보면 그 차이를 명확하게 이해할 수 있을 것이다. 

[contentModes](https://lh3.googleusercontent.com/UIF3HOes18GU2zfq-6LWs1w4ODDnYCvwdvhTdISS4ywxw5Zh8hiib_mzKJcgyKOiCN-Hnzw3-xVW45UON-W16KLbSrMaeCauuMiMVSj1DfiHf32AvJlWizEtYtdI1QX6SL9IH4bJj-2yMDUK2JJYC2rcvyKyp_PKHdQxE3Fy_LxZTJGlPgN-FfowmFFxN5RSbVLxA17d1LuAJQPKUHsvCiYDvKu71aufVE17NFSWHKLeK9EkGdOjduu5n9j_J-850U40Q1pmXuRH_zDGirB5BCdiKNvFoJxdG1zqpp_kozc5KMI43Mn2XpqsBMu628r2zyt8BmTaG8HQoZC-Js0LgZEWIidBgijJrFBy_mcoyW0WjulKKL4yfHqtRSCqbk9JuvEKNI1d7afdjdOLSv89UDfg8SCmX69hpJjOk-Ld7LFqAkWvuLljzrbweb0Pa0hq6Y2yPhDwLbc4pPMag4yujMHiLQh7zZQnYdmi21u5iGLqibMKgsjooxGxJqzERCPh1o5twLKMycvllDn5TTy9qNdwx9JGpNE20KzKhusvb3N7xGSpXmFW0SUJtlGkKWWCcdhxiIG7DNK2eOcOphJdl8TKuBJsO03dKZZrfCZirawEQc9e-bWr5PV3WAMcFCRuwlLY8C5cFM0aGgsyW6qTfBRJ8kEcI1M=w930-h1160-no)  


# segue를 통한 데이터 전달

segue는 사전적인 의미로 **뒤따르다** 라는 뜻이 있다. 말 그대로 내 뒤를 이어 올 녀석에게 미리 조치를 취해주는 녀석을 segue라고 생각할 수 있겠다. 

뷰 컨트롤러를 생성하면 다음과 같은 segue가 주석처리되어 생성되어 있는 모습을 볼 수 있다.

```swift
//In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  // Get the new view controller using segue.destination.
  // Pass the selected object to the new view controller.

}
```

친절한 주석을 해석해보면 앞서 유추한대로 controller를 navigation하기 전에 미리 준비를 할 수 있는 녀석이라고 써있다. 또 파라미터인 segue를 사용해 새로운 view controller를 가져와 값을 넘겨주라는 설명을 볼 수 있다.  

이때 sender는 말 그대로 전달해주는 녀석으로 이번 프로젝트에서는 tableViewCell이 되겠다. 

```swift
// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  // Get the new view controller using segue.destination.
  // Pass the selected object to the new view controller.
            
  guard let nextViewController: FullMemoryViewController = segue.destination as? FullMemoryViewController else {
      return
  }
            
  guard let cell: MemoryTableViewCell = sender as? MemoryTableViewCell else {
      return
  }

  nextViewController.rememberLabel = cell.memoryLabel
  nextViewController.memoryImageView = cell.memoryImageView
}
```

따라서 다음과 같은 식으로 다음 목적지인 newViewController와 cell을 가져와 사용하였다. 

> 이때 주의해야 할 것은 destination controller에는 아직 view가 load되지 않은 상황이기 때문에 바로 IBOutlet과 같은 view에 값을 넣으면 안된다. 아직은 변수에만 값을 넣어줄 수 있다.

따라서 위와 같이 변수에 값을 먼저 할당하고 destination controller에서는 viewWillAppear에서 view에 값을 할당해주자.  



# button title 설정하기

글자 그대로 button의 `setTitle()`을 사용해 글자를 설정한다. 버튼의 상태 또한 설정해줄 수 있다.
