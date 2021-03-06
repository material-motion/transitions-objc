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

import MaterialMotionTransitions
import MaterialMotionCoreAnimation

class FadeInTransitionDirector: NSObject, SelfDismissingTransitionDirector {

  required init(transition: Transition) {
  }

  func setUp() {
  }

  func willBeginTransition(_ transition: Transition) {
    let values = [NSNumber(value: 0), NSNumber(value: 1)]
    let animation = Tween("opacity",
                          duration: transition.window.duration,
                          values: transition.direction == .forward ? values : values.reversed())
    transition.runtime.addPlan(animation, to: transition.foreViewController.view.layer)
  }

  static func willPresentForeViewController(_ foreViewController: UIViewController,
                                            dismisser: TransitionDismisser) {
    let tap = UITapGestureRecognizer()
    foreViewController.view.addGestureRecognizer(tap)

    // Dismiss the presented view controller when tapped.
    dismisser.dismiss(whenGestureRecognizerBegins: tap)
  }
}
