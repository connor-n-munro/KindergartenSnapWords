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

## Remaining bugs:
- Between lines 128 and 133 in `SnapWordList.swift`, the words in each wordlist lose scope or something after being initialized and the whole list is repopulated with only the last element.
