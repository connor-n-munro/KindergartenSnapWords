# Kindergarten Snap Words
### Connor Munro and Ron Gunczler

App used to help learn "sight" words and aid reading skills, currently for kindergarten-level English learners


## Features:

- About page overlay on demand from title page
- Scrollable list selection page
- 15 sample word lists
 
 
 ## To be implemented:
- Full list view (intermediary)
- Add lists with words
- Record sounds
 
 ## Fixed bugs:
- Screen resizing issue fixed and constraints updated
- Repeating words issue fixed
	* This issue was related to the initialization of each list. Because each list of words was initialized using `repeat` on the same instance, it was creating a list of references to the same `SnapWord`. A change to one was a change to all, so we made a clearer initialization.
- Ignoring the last element of each `SnapWordList` in the `SnapWordViewController` fixed, led to following comments
	* A lot of boolean-returning functions need to be rewritten, as they check expected values rather than actual values (check whether a flag automatically marked true is true [`hasSound`] or if a parameter's index is an index [`wordExists`])

## Remaining bugs:
- See comments under last resolved bug
- Sounds do not work on Ron's computer, possibly due to pathing issues--might be related to `hasSound`
- Using "Return to Main Screen" or "<Your Snap Word Lists" causes a crash and the error `Thread 1: EXC_BAD_ACCESS (code=1, address=0x48)` to appear on line 13 of `AppDelegate.swift` on Ron's computer immediately after successfully returning to relevant view
- Attempting to play sound files causes a crash and the error `Thread 1: EXC_BAD_ACCESS (code=1, address=0x48)` to appear on line 243 of `SnapWordViewController.swift` on Ron's computer and audio does not play
