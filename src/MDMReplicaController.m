/*
 Copyright 2016-present The Material Motion Authors. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "MDMReplicaController.h"

@implementation MDMReplicaController {
  NSHashTable *_disabledElements;
}

- (instancetype)init {
  self = [super init];
  if (self) {
    NSPointerFunctionsOptions options = (NSPointerFunctionsWeakMemory | NSPointerFunctionsObjectPointerPersonality);
    _disabledElements = [NSHashTable hashTableWithOptions:options];
  }
  return self;
}

- (nullable id)createReplica:(nonnull id)element {
  if ([_disabledElements containsObject:element]) {
    return nil;
  }
  return [_delegate createReplica:element];
}

- (void)disableReplicationForElement:(nonnull id)element {
  [_disabledElements addObject:element];
}

@end
