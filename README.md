# event_handeler
## handel custom events just like JavaScript with some features and limitations 


event handeler is built to be used with your any function call,like if you run a function and on function end you will ``` dispatchCustomEvent``` and it will notify its all listeners with ```addCustomEventListener```

- dispach custom events with value also
- listen to it and get the value in a callback function
- ✨Magic ✨

## Features

- it can be used with your any function its very simple to use no need for any overhead of provider
- simple data passing and listen for changes and act according to it in another file/class.
- its a standalone function so you can use it any where no need for extras setup
- it will marge with your any function and give it a new life who can emmit changes made,
- when you add listener you can select which type/event you want to listen for
- event listener can run customcallback with event value so data passing accross multiple pages made super easy .
- multiple page support can be achived by utilizing local storage of device


I am [somen das]  for any question or suggestions [Email me][df1] also if you need an App 😉	
Here is the 
## Methods
`dispatchCustomEvent(eventvalue,eventType)`
`addCustomEventListener(eventType, callback)`

`callback` have the value of `eventvalue`

## Examples

Install the dependencies and devDependencies and start.

For dispatching custom events when i add something to secureStorage
```dart 
_storage .write(key: 'filterBy', value: "clear filters").then((value) {
dispatchCustomEvent("clear filters","filterChange");
});
```

To listen to this paricular event put this in initState under any function

```dart
StreamSubscription? eventSubscription=addCustomEventListener("filterChange", (eventvalue){
print(eventvalue);//prints clear filters
//do something you want when the event happens
    
});
```
### 📌 Problems & Solutions for Using Event Listeners in Flutter Widgets

###### ❌ Problem 1: Memory Leak Due to Persistent Subscriptions
- If an event listener (`addCustomEventListener`) is used **inside the `build` method**, it **keeps listening** to events **even after the widget is removed** from the tree.
- This results in a **memory leak** because the listener is never disposed.

### ✅ Fix:
- Store the subscription in a variable and cancel it in the `dispose` method of `StatefulWidget`.

---

## ❌ Problem 2: Multiple Subscriptions on Every Rebuild
- When a Flutter widget **rebuilds**, a new event listener is added every time.
- This causes **duplicate event listeners**, leading to **multiple function calls for a single event**.

### ✅ Fix:
- Store the subscription in the **state** (`State` class) instead of the `build` method.
- Ensure **only one** listener is active at a time.
- Cancel the existing subscription before adding a new one.

#### check provided example for better understanding
---


   [GitHub Repo Url]: <https://github.com/KTBsomen/dillinger.git>
   [somen das]: <https://github.com/KTBsomen/>
   [df1]: <mailto:somen6562@gmail.com>
   


