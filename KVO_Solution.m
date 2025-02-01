The solution involves removing the observer in the `-dealloc` method or when the observation is no longer required. Here's how to modify the code:

```objectivec
@interface MyClass : NSObject
@property (nonatomic, strong) NSString *observedProperty;
@end

@implementation MyClass
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    // Handle KVO notification
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"observedProperty"]; // Remove observer
    [super dealloc];
}

- (void)startObserving:(MyObservedClass *)observedObject {
    [observedObject addObserver:self forKeyPath:@"observedProperty" options:NSKeyValueObservingOptionNew context:NULL];
}

- (void)stopObserving:(MyObservedClass *)observedObject {
    [observedObject removeObserver:self forKeyPath:@"observedProperty"];
}
@end
```
This ensures the observer is always removed, preventing crashes.