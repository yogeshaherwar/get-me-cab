# get-me-cab

[![Simulator-Screen-Shot-i-Phone-11-2021-03-07-at-00-56-47.png](https://i.postimg.cc/L4Cdgqtj/Simulator-Screen-Shot-i-Phone-11-2021-03-07-at-00-56-47.png)](https://postimg.cc/yWZpw8rN)
[![Simulator-Screen-Shot-i-Phone-11-2021-03-07-at-00-58-33.png](https://i.postimg.cc/mgSKRtgc/Simulator-Screen-Shot-i-Phone-11-2021-03-07-at-00-58-33.png)](https://postimg.cc/HrV69W5H)

Integrated following libraries:
- [x] RxSwift: To handle asynchronous code in MVVM design pattern.
- [x] Swinject: To resolve dependencies and to split our app into loosely-coupled components.
- [x] SwinjectStoryboard: For automatic dependency injection via Storyboard.
- [x] ObjectMapper: To convert model objects (classes and structs) to and from JSON.
- [x] Kingfisher: For downloading and caching images.
- [x] GoogleMaps: To display and plot vehicle locations from received data.

Network calls are handled by native methods, we could have use Alamofire but there was just a single API call so that was not necessory to implement addition component library. 

### Procedure to run this application
1. Clone or download the project.
2. Open terminal, get inside the project directory and run "pod install" command.
3. Open GetMeCab.xcworkspace and run the project.
