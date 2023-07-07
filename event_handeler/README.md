# event_handeler
## handel custom events just like JavaScript with some features and limitations 


event handeler is ment be used with your any function call,like if you run a function and on function end you will ``` dispatchCustomEvent``` and it will notify its all listeners with ```addCustomEventListener```

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
addCustomEventListener("filterChange", (eventvalue){
print(eventvalue);//prints clear filters
//do something you want when the event happens
    
});
```



   [dill]: <https://github.com/joemccann/dillinger>
   [GitHub Repo Url]: <https://github.com/KTBsomen/dillinger.git>
   [somen das]: <http://daringfireball.net>
   [df1]: <mailto:somen6562@gmail.com>
   


