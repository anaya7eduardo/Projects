//
//  main.m
//  PlaygroundToObjC
//
//  Created by Eduardo Anaya on 12/24/21.
//

#import <Foundation/Foundation.h>

/*
//Declare a (C-Style) Func
int add(int num1, int num2) {
    return num1 + num2;
}

//Declare a (Obj-C) Func
//func add(num1: Int, num2: Int) -> Int {
//    return num1+num2;
//}
*/

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        /*
        NSLog(@"Hello, World!");
        
        //Use Our Add Function
        int result = add(10, 12);
        //NSLog(@"The result of addition is %i", result);
        // \%i <- we used this formatter due it's an integer
        //int is on the stack
        
        //Declare a String
        //NS -> Next Step
        //NSString is an object that allocates
        //memory on the Heap (a place _buffer_ in memory)
        NSString *name = @"Eduardo";
        
        NSLog(@"%@ the result of addition is %i", name, result);
        
        //Mutable String
        NSMutableString *language = [[NSMutableString alloc] initWithString: @"The Language"];
        
        //Calling an Obj-C Func
        //[instance methodName];
        //[Class methodName];
        NSLog(@"message: %@", language);
        
        //Calling Func in Obj-C
        [language appendString:@" is Objective-C."];
        
        NSLog(@"message: %@", language);
        
        //Array
        NSArray *programmingStacks = @[@"Objective-C", @"Swift", @"Python", @"Java"];
        
        for (NSString *language in programmingStacks) {
            //NSLog(@"The language is %@", language);
            if ([language isEqual:@"Swift"]) {
                NSLog(@"%@ is the best Language Ever!!!", language);
            }
        }
        */
        
        /*
        let target = 9
        let nums = [2,7,11,15]
        var nums2 = [0,0]
        var count = 0

        for (index1, x) in nums.enumerated() {
            for (index2, y) in nums.enumerated() {
                if index1 != index2 && count <= 0{
                    if x+y == target {
                        print(nums)
                        //print("[\(index1),\(index2)]")
                        nums2 = [index1,index2]
                        count += 1
                    }
                }
            }
        }
        print(nums2)
        */
        NSNumber *target = [NSNumber numberWithInt:9];
        NSArray *nums = [NSArray arrayWithObjects:[NSNumber numberWithInt:2], [NSNumber numberWithInt:7], [NSNumber numberWithInt:11], [NSNumber numberWithInt:15], nil];
        NSMutableArray *nums2 = [NSMutableArray array];
        NSInteger count = 0;
        
        for (int x = 0; x < [nums count]; x++) {
            for (int y = 0; y < [nums count]; y++) {
                if ( !(x&&y) && (count <= 0) ) {
                    if ( ( [nums[x] intValue] + [nums[y] intValue] ) == [target intValue] ) {
                        NSLog(@"%@", nums);
                        [nums2 addObject: [NSNumber numberWithInt: x]];
                        [nums2 addObject: [NSNumber numberWithInt: y]];
                        count+=1;
                    }
                }
            }
        }
        NSLog(@"[%@,%@]", nums2[0], nums2[1]);
        //NSLog(@"%@", nums2);
        
    }
    return 0;
}
