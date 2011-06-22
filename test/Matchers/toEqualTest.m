#import "TestHelper.h"
#import "NSValue+Expecta.h"

@interface toEqualTest : SenTestCase
@end

@implementation toEqualTest

- (void)test_toEqual_nil {
  assertPass(test_expect(nil).toEqual(nil));
  assertFail(test_expect(@"foo").toEqual(nil), @"foo.m:123 expected: nil/null, got: foo");
}

- (void)test_Not_toEqual_nil {
  assertPass(test_expect(@"foo").Not.toEqual(nil));
  assertFail(test_expect(nil).Not.toEqual(nil), @"foo.m:123 expected: not nil/null, got: nil/null");
}

- (void)test_toEqual_object {
  NSObject *foo = [NSObject new], *bar = [NSObject new];
  assertPass(test_expect(foo).toEqual(foo));
  assertFail(test_expect(foo).toEqual(bar), ([NSString stringWithFormat:@"foo.m:123 expected: %@, got: %@", bar, foo]));
  [foo release];
  [bar release];
}

- (void)test_Not_toEqual_object {
  NSObject *foo = [NSObject new], *bar = [NSObject new];
  assertPass(test_expect(foo).Not.toEqual(bar));
  assertFail(test_expect(foo).Not.toEqual(foo), ([NSString stringWithFormat:@"foo.m:123 expected: not %@, got: %@", foo, foo]));
  [foo release];
  [bar release];
}

- (void)test_toEqual_NSString {
  assertPass(test_expect(@"foo").toEqual(@"foo"));
  assertFail(test_expect(@"foo").toEqual(@"bar"), @"foo.m:123 expected: bar, got: foo");
}

- (void)test_Not_toEqual_NSString {
  assertPass(test_expect(@"foo").Not.toEqual(@"bar"));
  assertFail(test_expect(@"foo").Not.toEqual(@"foo"), @"foo.m:123 expected: not foo, got: foo");
}

- (void)test_toEqual_SEL {
  assertPass(test_expect(@selector(foo)).toEqual(@selector(foo)));
  assertFail(test_expect(@selector(foo)).toEqual(@selector(bar:)), @"foo.m:123 expected: @selector(bar:), got: @selector(foo)");
}

- (void)test_Not_toEqual_SEL {
  assertPass(test_expect(@selector(foo)).Not.toEqual(@selector(bar:)));
  assertFail(test_expect(@selector(foo)).Not.toEqual(@selector(foo)), @"foo.m:123 expected: not @selector(foo), got: @selector(foo)");
}

- (void)test_toEqual_Class {
  assertPass(test_expect([NSString class]).toEqual([NSString class]));
  assertFail(test_expect([NSString class]).toEqual([NSArray class]), @"foo.m:123 expected: NSArray, got: NSString");
}

- (void)test_Not_toEqual_Class {
  assertPass(test_expect([NSString class]).Not.toEqual([NSArray class]));
  assertFail(test_expect([NSString class]).Not.toEqual([NSString class]), @"foo.m:123 expected: not NSString, got: NSString");
}

- (void)test_toEqual_BOOL {
  assertPass(test_expect(NO).toEqual(NO));
  assertFail(test_expect(NO).toEqual(YES), @"foo.m:123 expected: 1, got: 0");
}

- (void)test_Not_toEqual_BOOL {
  assertPass(test_expect(NO).Not.toEqual(YES));
  assertFail(test_expect(NO).Not.toEqual(NO), @"foo.m:123 expected: not 0, got: 0");
}

- (void)test_toEqual_char {
  assertPass(test_expect((char)10).toEqual((char)10));
  assertFail(test_expect((char)10).toEqual((char)20), @"foo.m:123 expected: 20, got: 10");
}

- (void)test_Not_toEqual_char {
  assertPass(test_expect((char)10).Not.toEqual((char)20));
  assertFail(test_expect((char)10).Not.toEqual((char)10), @"foo.m:123 expected: not 10, got: 10");
}

- (void)test_toEqual_int {
  assertPass(test_expect((int)0).toEqual((int)0));
  assertFail(test_expect((int)0).toEqual((int)1), @"foo.m:123 expected: 1, got: 0");
}

- (void)test_Not_toEqual_int {
  assertPass(test_expect((int)0).Not.toEqual((int)1));
  assertFail(test_expect((int)0).Not.toEqual((int)0), @"foo.m:123 expected: not 0, got: 0");
}

- (void)test_toEqual_int_char {
  assertPass(test_expect((int)0).toEqual((char)0));
  assertFail(test_expect((int)0).toEqual((char)1), @"foo.m:123 expected: 1, got: 0");
}

- (void)test_Not_toEqual_int_char {
  assertPass(test_expect((int)0).Not.toEqual((char)1));
  assertFail(test_expect((int)0).Not.toEqual((char)0), @"foo.m:123 expected: not 0, got: 0");
}

- (void)test_toEqual_int_unsigned_int {
  assertPass(test_expect((int)0).toEqual((unsigned int)0));
  assertFail(test_expect((int)0).toEqual((unsigned int)1), @"foo.m:123 expected: 1, got: 0");
}

- (void)test_Not_toEqual_int_unsigned_int {
  assertPass(test_expect((int)0).Not.toEqual((unsigned int)1));
  assertFail(test_expect((int)0).Not.toEqual((unsigned int)0), @"foo.m:123 expected: not 0, got: 0");
}

- (void)test_toEqual_int_long_long {
  assertPass(test_expect((int)0).toEqual(0ll));
  assertFail(test_expect((int)0).toEqual(1ll), @"foo.m:123 expected: 1, got: 0");
}

- (void)test_Not_toEqual_int_long_long {
  assertPass(test_expect((int)0).Not.toEqual(1ll));
  assertFail(test_expect((int)0).Not.toEqual(0ll), @"foo.m:123 expected: not 0, got: 0");
}

- (void)test_toEqual_float {
  assertPass(test_expect(0.1f).toEqual(0.1f));
  assertFail(test_expect(0.1f).toEqual(0.2f), @"foo.m:123 expected: 0.2, got: 0.1");
}

- (void)test_Not_toEqual_float {
  assertPass(test_expect(0.1f).Not.toEqual(0.2f));
  assertFail(test_expect(0.1f).Not.toEqual(0.1f), @"foo.m:123 expected: not 0.1, got: 0.1");
}

- (void)test_toEqual_double {
  assertPass(test_expect(0.1).toEqual(0.1));
  assertFail(test_expect(0.1).toEqual(0.2), @"foo.m:123 expected: 0.2, got: 0.1");
}

- (void)test_Not_toEqual_double {
  assertPass(test_expect(0.1).Not.toEqual(0.2));
  assertFail(test_expect(0.1).Not.toEqual(0.1), @"foo.m:123 expected: not 0.1, got: 0.1");
}

- (void)test_toEqual_float_double {
  assertPass(test_expect(0.1f).toEqual(0.1));
  assertFail(test_expect(0.1f).toEqual(0.2), @"foo.m:123 expected: 0.2, got: 0.1");
}

- (void)test_Not_toEqual_float_double {
  assertPass(test_expect(0.1f).Not.toEqual(0.2));
  assertFail(test_expect(0.1f).Not.toEqual(0.1), @"foo.m:123 expected: not 0.1, got: 0.1");
}

- (void)test_toEqual_pointer {
  int num = 1, num2 = 1;
  int *a = &num, *b = &num2;
  assertPass(test_expect(a).toEqual(&num));
  assertPass(test_expect(a).Not.toEqual(b));
}

- (void)test_toEqual_nullPointer {
  int *nullPointer = NULL;
  assertPass(test_expect(nullPointer).toEqual(NULL));
}

@end