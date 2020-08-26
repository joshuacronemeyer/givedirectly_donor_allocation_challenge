# Part I - Donor Product Conceptualization
Included in this repository is a PDF that describes a product for engaging and personalizing the givedirectly donor experience

# Part II - Give Directly Donor Allocation Problem
A ruby library that can allocate donations to various programs

## Running the software
You will need a ruby installed and the bundler gem. Install the dependencies with bundler and run the test suite
```
bundle install
rspec
```

## Sample inputs from the problem
You will find the sample inputs from the problem statement in the give_directly_challenge_spec.rb file. There is a v1 test and a v2 test demonstrating the software handling each scenario.

### general assumptions
The problem describes creating a function 'allocate_funding' to solve the problem. I took the liberty of naming that function allocate_donations_without_preferences! and for v2 allocate_donations_with_preferences! I have also written the software using OO principles and spread the classes across many files. This approach made it easier for me to add complexity when it was time to solve v2. Furthermore the software has a unit test suite which ensures correctness as we continue to evolve it.

### v2 assumptions
For v2 I have assumed that if a donor requests a program we will honor it. If interest in a program has outstripped the needs of that program we should be up front with donors about that, rather than coming back to them later saying they need to pick a different program, or even worse silently assigning them to an unexpected program. We want to create a great user experience and manage user expectations.


