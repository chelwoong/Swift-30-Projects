# 배운내용

- [Button setImage](#button-setimage)
- [Button popover](#button-popover)
- [Pass data back to controller using delegate](#pass-data-back-to-controller-using-delegate)
- [Date Picker](#date-picker)
- [UINavigation Controller handling](#uinavigation-controller-handling)
- [TableView Editing](#tableview-editting)

# Screen Shot
![todo.gif](todo.gif)

# Button setImage

button.imageView.image = image 라고 원초적으로 생각했으나..  

`setImage()` 를 이용한다. 

# Button popover

![popover](/Images/popover.png)

이런 popover는 일반적인 segue의 push로는 할 수 없다.  

`popoverPresentationController` 를 사용해야 하는데, 현재 뷰 컨트롤러를 관리하는 가장 가까운 팝업 표시 컨트롤러이다. 

원리는 간단하다. 

segue를 준비하는 **prepare**에서 `popoverPresentationController`를 불러 

→ delegate를 사용하겠다고 하고

→ popover될 위치를 지정한다. 

```swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let popoverController = segue.destination.popoverPresentationController, let button = sender as? UIButton {
        popoverController.delegate = self
        popoverController.sourceRect = button.bounds
    }
}
```

popover의 크기는 **popover controller**의 `viewWillLayoutSubviews()` 에서 설정한다. 

```swift
override func viewWillLayoutSubviews() {
    preferredContentSize = CGSize(width: self.view.bounds.width, height: 200)
}
```

# Pass data back to controller using delegate

popover를 띄우고 거기에 emoji까지 만들었으니 이제 emoji를 선택해서 버튼을 emoji로 바꾸면 된다.  

하지만.. segue를 통해서 데이터를 전달?, 직접 controller를 가져와서 해당 데이터를 저장?  

문제는 IBOutlet에는 그렇게 넣을 수 없다는 것이 문제, 

찾아보니 방법은 크게 3가지가 있다. `Notification`, `Callback`, `Delegate`  

([참고]([https://www.youtube.com/watch?v=ekQ0pqzc9Kg&list=PLHDMmeIMXj8VErZQxkeUnBadPaFxEL4kl&index=5](https://www.youtube.com/watch?v=ekQ0pqzc9Kg&list=PLHDMmeIMXj8VErZQxkeUnBadPaFxEL4kl&index=5)))  

이번엔 `Delegate`를 사용해 구현하였다.   

delegate는 [마기님]([https://magi82.github.io/ios-delegate/](https://magi82.github.io/ios-delegate/))의 표현을 빌리자면 *어떤 객체가 해야 하는 일을 부분적으로 확장해서 대신 처리* 해주는 녀석이라고 생각할 수 있겠다.  

delegate가 필요하면 불러와 구현하고, 다른 쪽에선 delegate에 값을 전달한다.  

좀 더 구체적으로 알아보자.

1. Delegate Protocol을 만든다.  

프로토콜은 blueprint, 그저 설계도다. 
```swift
protocol PopoverDelegate {
  func setButtonImage(_ image: UIImage)
}
```
2. delegate를 만든다.

내 일을 대신 처리해줄 delegate를 만들어야 다른 곳에서 불러 사용할 수 있다.

`PopoverController` 에서 만들어 줘야 다른 쪽에서 사용할 수 있다.

만들고 함수에 값까지 넘겨주면 된다. 
```swift
// MARK: - Variables and Properties
var emojiDelegate: PopoverDelegate?

... 

// MARK: - Actions
@IBAction func emojiTapped(_ sender: Any) {
  ...
  emojiDelegate?.setButtonImage(image)

}
```
3. Delegate를 구현한다.

delegate의 구현은 당연히 필요한 쪽에서 한다. 이번 프로젝트에서는

`AddTodoViewController` 에서 delegate가 버튼의 image를 바꿔줬으면 한다.  

필요하면, 구현하자.
```swift
extension AddTodoViewController: PopoverDelegate {
    func setButtonImage(_ image: UIImage) {
        imageSelectButton.setImage(image, for: .normal)
    }
}
```
구현했으면 도와달라고 요청하자.
```swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let popoverController = segue.destination as? PopoverViewController, let button = sender as? UIButton {
        popoverController.emojiDelegate = self
        ...
    }
}
```

# UINavigation Controller handling

navigation controller를 사용할 때, Push, Pop, Presenting, Dismiss 등은 왜 어떻게 사용하는지 알아보자.  

1. **Modal로 띄웠을 때는 dismiss**

```swift
// UIViewController에서 Modal을 띄웠을 때
let vc = TestViewController()
vc.dismiss(animated: true, completion: nil)

// UINavigationController에서 Modal을 띄웠을 때
navigationController?.dismiss(animated: true, completion: nil)
```
2. **Push했을 땐 Pop**


Navigation Controller는 UIViewController를 stack에 보관하기 때문에, UIViewController는 modal로도, push로도 할 수 있다. UIViewController가 Push 되었다면 **반드시 pop 시켜주자.** 
```swift
// push된 UIViewController는 pop시킨다.
navigationController?.popViewController(animated: true)

// stack안에 push된 특정 UIViewController를 pop 시킬 때
let vc = TestViewController()
navigationController?.popToViewController(vc, animated: true)

// rootViewController로 pop시킬 때 (stack의 첫번째 UIViewController)
navigationController?.popToRootViewController(animated: true)
```
3. UIViewController가 modal로도 push로도 present될 수 있지만, 결국 다른 UIViewController를 present하는 것이다. 따라서 UIViewController는 오직 dismiss될 수 밖에 없다.
(2번처럼 navigationController의 스택에 안에 있고, UINavigationController가 pop처리하고 있는 경우가 아니라면) 따라서 UIViewController는 **popViewController**를 호출할 수 없다.

4. `PresentingViewController`는 UIViewController, UINavigationController에서 모두 사용할 수 있다. **presentingViewController.dismiss(animated: completion)**를 호출하면 부모 ViewControler가 present한 모든 것이 사라진다. 3개의 ViewController를 갖고 있는 NavigationController에서 **presentingViewController.dismiss(animated: completion)**를 호출하면 3개의 뷰컨과 NavigationContrller가 모두 dismis된다.

5. 유사하게 Apple은 UIViewController, UINavigationController에서 `PresentedViewController`를 제공한다. presentedViewController.dismiss(animated: completion)을 호출하면 자식뷰컨(presented된 현재 뷰컨)이 dismiss된다. 

# TableView Editing

tableView 자체적으로 editing style을 제공한다.  

먼저 셀을 삭제하는 방법부터 알아보자. 
```swift
func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
        todoes.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}
```
이렇게 하면 셀을 왼쪽으로 slide시킨 뒤 `Delete` 를 눌러 삭제할 수 있다. 

또한 editButtonItem도 제공한다. 

`viewDidLoad(_:)`에 다음을 추가시키면  navigationBar에 Edit버튼을 만들 수 있다. 

```swift
self.navigationItem.leftBarButtonItem = self.editButtonItem
```

**하지만 이렇게만 하면 Edit/Done 토글만 될 뿐 제대로 동작하지 않는다. setEditing을 override 해줘야 한다.**    

단순히 tableView.setEditing만 해주면 이번엔 토글이 작동하지 않는다.. 버튼의 이름을 바꿔줘 토글도 같이 시켜주자.
```swift
override func setEditing(_ editing: Bool, animated: Bool) {
    if editing && !tableView.isEditing {
        tableView.setEditing(true, animated: animated)
        self.editButtonItem.title = "Done"
    } else {
        tableView.setEditing(false, animated: animated)
        self.editButtonItem.title = "Edit"
    }
}
```

셀의 순서를 바꿔주기 위해서는 다음 함수를 만들어줘야한다. 

```swift
func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {

}
```

찾아봤을 때는 주어진 indexPath를 사용해 temp cell을 만들어 놓고 해당 인덱스를 삭제 후 temp cell을 다시 끼워넣는 방식으로 내부에 구현하는 걸 봤는데, 이제는 기본적으로 제공해 주는지 따로 구현하지 않더라도 제대로 동작했다. 

참고  

[마기님블로그](https://magi82.github.io/ios-delegate/)  

[Mark Moeykens](https://www.youtube.com/watch?v=ekQ0pqzc9Kg&list=PLHDMmeIMXj8VErZQxkeUnBadPaFxEL4kl&index=5)  

[Zedd님 블로그](https://zeddios.tistory.com/291)  

[Navigation handling](https://medium.com/@felicity.johnson.mail/pushing-popping-dismissing-viewcontrollers-a30e98731df5)
