Basically, _Dart is **not** single-class-single-file like how Java works_. Yes, it does support Object Oriented Programming (in kinda different way).  

Dart _supports variables and functions defined in global space_.  
You can see this with the `main()` method which are declared outside any class.  

Also, global variables (and static class variables) _**are lazy evaluated**_ so the value are first defined when you are trying to use them. So your runtime are not going to slow down even if there are a bunch of global variables there are not used.
