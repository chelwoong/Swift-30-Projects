# 배운내용

- [Swift Timer](#swift-timer)
- [Button Toggle](#button-toggle)
- [Selector](#selector)

# Swift Timer

### NSDate

날짜에 연결되는 특정 시점의 표현이다. reference semantics 또는 다른 Foundation 관련 동작이 필요할 때 사용한다. 

### Timer

swift는 자체적으로 Timer를 제공한다. 

### scheduledTimer

Timer에 내장되어 있는 함수로 타이머의 간격을 설정한다. 
```swift
Timer.scheduledTimer(
                timeInterval: interval,
                target: self,
                selector: #selector(updateMainTimer),
                userInfo: nil,
                repeats: true
            )
```
timerInterval은 말 그대로 시간 간격,

설정한 간격만큼 selector를 실행한다. 이때 selector의 함수는 파라미터가 없거나 `updateMainTimer(_:)`와 같이 사용해 한 개만 전달해야 한다. 이때 전달할 파라미터는 userInfo에 넣는다.

### invalidate()

타이머를 정지시킨다!
```swift
Timer.invalidate()
```

### timer.tolerance

앱에서 모든 타이머는 매 초마다 정확한 1초 간격으로 시간을 보내고자 한다. 

자연히 앱에서 타이머의 개수가 많아지면 앱의 반응이 느려지고 에너지 사용량 또한 많아진다. 타이머에 허용 오차(tolerance)를 주는 것은 이러한 악영향을 줄여준다. 현재 앱 같이 타이머가 2개뿐이고 단순히 시간을 기록하는 앱에서는 괜찮지만, 타이머를 계속해서 만들어야 하는 앱이라면 timer.tolerance 를 0.1로 설정해보자. 눈에  딱 보이지는 않지만, 사용자 반응 측면에서는 매우 효율적이다. 

### RunLoop

RunLoop는 event processing loop이다.  

발생하는 이벤트를 예약하고 관리한다. 즉 놀땐 놀고 일할 땐 일하게 해주는 녀석이다. 

앱을 실행하면 system은 자동으로 Thread를 생성한다. 이것이 main Thread이다. 각 Thread에는 필요에 따라 자동으로 생성된 RunLoop를 가지고 있다.

그래서 갑자기 왜 뜬금없이 Thread 이야기냐고 ..?  

바로 이 RunLoop를 잘 관리함으로써 Thread를 효율적으로 관리할 수 있기 때문이다.  

따로 RunLoop를 설정해주지 않으면 각 Timer는 main Thread에 의해서 관리된다. 하지만 알다시피 main Thread는 매우 바쁘다. 사용자 인터페이스 그리기, 사용자 터치 관리 등을 담당하고 있다. 따라서 모두 main Thread에 의해 관리된다면, UI에 따라 응답하지 않고 예기치 않게 동작할 수 있다.

대표적인 예시가 테이블을 reload할 때이다. 테이블을 reload하기 위해 잡아당기고 있을 때, Timer UI는 멈춰있다. 하지만 다시 reload를 하면 그 멈춰있는 시간 동안에 여전히 Timer는 돌아가고 있어 몇 초를 훌쩍 뛰어넘어 다시 동작한다. 이를 방지하기 위해 RunLoop의 mode를 common으로 설정해보자.

**RunLoop Mode**

RunLoop Mode는 터치나 클릭과 같은 인풋과 타이머를 관찰할 수 있는 것들의 집합이다.

- default: NSConnectionObjects가 아닌 input을 처리한다.
- common: source, timer, observers를 정의할 수 있는 run loop를 관리한다.
- tracking: 반응형 UI를 처리한다.

```swift
RunLoop.current.add(Timer, forMode: .common)
```

# Button Toggle

이번 프로젝트 에서는 isRunning 변수 하나만으로 구현할 수가 있었다.   

하지만 `enum`을 사용해서 구현하는 것이 더 효율적일 듯하다.  

추후에 수정해봐야겠다.    

# Selector

앞서 타이머의 scheduledTimer를 사용할 때 `#selector`를 사용하였다.  

`#selector`에 의해 호출되는 함수는 반드시 `@objc`를 명시해줘야 한다. objective-C에서 노출되기 위함인데 이때는 **파라미터를 전달할 수가 없다.**  

이에대한 해결책으로 @objc함수에서 다른 함수를 호출하는 방식으로 구현하였다.  

다른 더 좋은 방법이 있을까?   

# 회고

간단한 타이머 하나를 만드는 것도 여러 방법이 있었다.   

여러 방법을 찾아봤는데 이번에 방법이 그래도 많이들 사용하시는 방법인 것 같아 사용했다.  

Timer 자체에 대해 익힐 수 있는 좋은 시간들이었다. 생각없이 사용하던 selector에 대해서도 좀 더 이해하게 되었다.  

정말 만드는 것보다 **잘** 만드는 것이 정말 어렵다..
