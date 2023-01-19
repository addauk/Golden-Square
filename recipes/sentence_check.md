# {{Sentence Check}} Method Design Recipe

## 1. Describe the Problem

> As a user  
> So that I can improve my grammar  
> I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby
# EXAMPLE

# `sentence_check` validates sentences with some grammar rules
valid_sentence = sentence_check(a_sentence)

a_sentence: a string (e.g. "Who are you?")
valid_sentence: a boolean value (e.g. true)

# The method doesn't print anything or have any other side-effects
```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
# EXAMPLE

sentence_check("Who are you?") => true
sentence_check("who am I?") => false
sentence_check("This shouldn't work") => false
sentence_check("also shouldn't work") => false
sentence_check("invalid sentence.") => false
sentence_check("Valid sentence.") => true
sentence_check("should say false!") => false
sentence_check("SHOULD SAY TRUE!") => true
sentence_check("!?") => false
sentence_check("A") => false
sentence_check("") => false

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
