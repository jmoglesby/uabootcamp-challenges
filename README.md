# Algorithm Challenges
I completed these challenges as graduation requirements for the Full Stack Web
Developer Bootcamp through the University of Arizona (Trilogy Edu.).

The challenges were presented in order of increasing complexity. All solutions
presented here are my original work, and the result of my innate response to the
challenges. I purposefully avoided seeking out examples of other people's solutions
to these algorithms in order to challenge myself, and so that I could maintain the
integrity of this claim in my README 🙂

### quiz_3
quiz_3.rb (named for the sake of clarity for my bootcamp advisors) demonstrates my
ability to create a create a class in ruby, with accessible initialized attributes
and dynamic attributes, as well as class methods.

### deck_of_cards.rb
This one builds on the last by building two classes that interact - a `Card`, and 
a `Deck` of `Cards`. I utilize nested `.map` methods to generate a `Deck` by creating
an instance of each `Card` in a deck of playing cards.

### image_blur_1-3.rb
These three challenges built on eachother, starting with the creation of an `Image` class,
then implementing the ability to simulate the "blurring" of "pixels" in the `Image`,
then finally implementing the ability to simulate the "blurring" of a *range* of "pixels"
at a given Manhatten distance from the focal pixels.

### linked_list_1-2.rb
These two challenges dealt with learning how to work with an implementation of the
Linked List data structure in Ruby. I implemented the Linked List, and then wrote
methods to reverse the order of a linked list, first iteratively, then recursively.
I also wrote an algorithm to check for an infinite list using the "Tortoise and Hare"
model.

### luhn_algorithm
This directory contains my implemenation of the Luhn Algorithm (used for validating
credit cards) in ruby. I implemented the method such that it returns a boolean value
indicating if the sequence of integers passed in represents a valid credit card number.
There are also test specs validating the functionality, written with the RSpec testing
framework -- as is the case with all the following algorithm challenges.

### collatz_sequence
Within the module I created for this challenge, I've implemented a recursive algorithm for producing
the Collatz Sequence for the given number. I've also implemented an iterative method that returns
the integer between 1-1,000,000 that has the longest Collatz Sequence... it takes a few seconds
to run (at least on my machine).

### fibonacci
The Fibonacci sequence is a classic computational challenge -- I've implemented four different algorithms
for producing a Fibonacci sequence of a given length, two of which are iterative and two of which
are recursive. The most widely implemented recursive version of this algorithm is incredibly concise,
but also horribly slow to process because it has to perform two recursive calls per cycle. I discovered
I could implement a recursive algorithm that only required one recursive call per cycle by holding on
to the `previous` value of the sequence and passing it back into the method for subsequent operations --
and this version of the recursive algorithm benchmarks much faster. The usual iterative approach is to build an
array of the values, so that the `previous` value of the sequence is accessible as the last object in
the array on subsequent cycles -- while the iterative algorithm is much faster than the recursive, building
an array can still be costly with large sequences. I discovered I could apply my approach of holding on to
only the `previous` value through each loop to the iterative algorithm as well, so that I could avoid building
an array to be able to return the end result of the Fibonacci sequence. My "semi-iterative" version of this
algorithm benchmarks at up to twice as fast as the other iterative version! I was really proud of my
work on this challenge 🙂

### tree_traversal
Another compu-sci classic, I implemented the multi-child `Tree` class in my spec file, and then wrote depth-first
and breadth-first traversal algorithms in my `TreeTraversal` module. For both algorithms I use recursion, and built
a hash to use for passing and re-passing into my recursive method. At each cycle I update the hash, keeping track
of the path traveled and the nodes that have been checked as I traverse the various branch and leaf nodes of the
tree. My implementation may not be the most efficient solution to the problem, but I am proud of it because I was
able to come up with the approach on my own, without any help.

### btree_sort
This is my implementation of a Binary Tree Sorting algorithm. First I built the `BinaryTree` class, and then a
module for the sorting method. The method accepts an `array` and sorts it by first building a binary tree out
of its members. Then I traverse that binary tree to pull out the members one at a time, in sorted order, and push
them to the array that gets returned as the result of the method. This was an interesting challenge, as I realized
that unpacking a binary tree has a lot more logical cases to check than just searching for a value within a tree. I
had to put considerable thought into the order in which I made my logical checks on the members of the tree. However,
I was glad for the challenge, because I learned that this is how database indexes are typically implemented -- with
binary tree structures. It's interesting to see that you can potentially cut processing time for finding a value in 
half by building a binary tree around a median value.

### string_to_int
Here's another classic challenge, often used in interviews (or so I'm told). That being the case, I was really happy
to have been able to figure this one out on my own. In my original solution to the challenge, I used a `case` statement
to build my value with integers based on the string digit representation. Once I had solved the challenge on my own, I
watched the solution videos that demonstrated ways I could refactor to make my solution more concise. The final version
shown here is the result of that refactoring, but my original solution is still available in the git history. Some of
the things I was guided into refactoring are code patterns that I don't think I would implement in a production code-base,
as they don't strike me as being very clear in their conciseness.
