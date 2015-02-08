## Airport Challenge

**Week 1 Makers Academy challenge:**

Imagine you're writing software to control the flow of planes at an airport.
The planes can land and take off provided that the weather is sunny.
Occasionally it may be stormy, in which case no planes can land or take off.


**Current bugs**

- Airport 1 can make a plane landed at airport 2 take off. The plane is still listed in the array in airport 2 despite being flying. (An airport should only be able to control planes that are landed at it or are flying)

- A plane is able to be at more than one airport simultaneously.

- A plane can be landed multiple times in an airport. (An airport should not be able to tell a non flying plane to land)


**Questions**

- In airport_spec, the example 'should let two planes take off' passed immediately and did not seem necessary. Are you only supposed to write tests that initially fail?

- I was unable to test 'should be stormy 20% of the time'. Is this a problem?

- The integration spec seems very clumsy. Is it necessary and is there a way of making it more elegant?


**Further work to do**

- clean up methods (landing and take off)

- move weather into a class or module

- review class responsibilities