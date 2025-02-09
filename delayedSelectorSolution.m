The solution involves using techniques like strong references (in appropriate contexts) or blocks to ensure the object is retained until after the selector is invoked.  Here's an example using a block:

```objectivec
- (void)myMethod {
    MyObject *myObject = [[MyObject alloc] init];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ 
        if (myObject) {
            [myObject mySelector];
        }
    });
}
```
This approach ensures that a check is done before calling the selector and thus prevents the crash.