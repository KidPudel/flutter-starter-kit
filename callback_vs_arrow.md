The **fat arrow** syntax is simply a _short hand for returning an expression_ and is similar to `(){ return expression; }`.

```dart
void main(){
    final cls = TestClass();
    cls.displayAnInt((){
       //you can create statements here and then return a value
       int num1 = 55;
       int num2 = 1;
       int sum = num1 + num2;
       return sum;
    });
   cls.displayAnInt(() => 55 + 1); // simply return an int expression
}
class TestClass{

    void displayAnInt(makeIntFunc){

       int intValue = makeIntFunc();
       print('The int value is $intValue');
    }
}
```

From the code above, You can see that multiline statement can be made when the callback function is used and then a value is returned, while the fat arrow simply has an expression with no return keyword.  

Considering your answer about fat arrows not supporting multiline statements in dart. This is quite understandable since doing () => {somtheing} would simply return a map and it would expect to see something like `() => {'name':'John', 'age':25}` and not `() => { _myTxt = "Text Changed";_myTxt = "Never Mind"; }` .
