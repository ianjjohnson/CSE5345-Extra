# Extra Credit Assignment

This assignment is optional.

If you attempt it, it will not negatively affect your grade.

It may, however, improve your overall grade by up to ten percentage points.

### Grading works like this:

**This assignment** will be graded out of 100:

60 for a working program

20 for elegant code

10 for good-looking code

10 for the rest :)

Copying code from other students will be penalized.

If this grade is less than 61, I will ignore it.

If it is 61 or more, I will calculate an percentage adjustment to your
final course grade using the formula

    percent adjustment = ( grade on this assignment - 60 ) / 4.0

For example, if you score a 90 on this assignment, you'll receive a
7.5% adjustment ([90-60]/4) to your final course grade.

At the end of the semester, this adjustment (which will be greater
than zero and less than or equal to 10) will be added to your course
percentage grade (maxing out at 100%)

# The Problem: "I'm Thinking of a Number"

    14∙59∙57≻ mix run -e "Extra.Guesser.play"
    I'm thinking of a number between 1 and 100
        IS IT 50?
    high
        IS IT 25?
    low
        IS IT 37?
    high
        IS IT 31?
    high
        IS IT 28?
    low
        IS IT 29?
    yes!
        THE NUMBER IS 29

This is the output of running an Elixir application. It implements the
"thinking of a number" game itself (the nonindented output) and a
client that tries to guess the number (the indented upper case
output).

The game server is implemented as a supervised OTP server. The low and
high numbers are supplied to it as parameters by the `worker` call
when the supervisor is defined.

The guesser is a separate module. When you invoke its `play` function,
it starts a new game on the GameServer. The GameServer responds with
the low and high values. The guesser then uses these to produce a
series of guesses. Each time, it asks the GameServer if the guess is
correct. The server responds with either `:low`, `:high`, or
`:correct`.

(There is an optimal guessing strategy which is _O(log n)_,
where _n_ is _high - low_.)

Both the game server and the guesser use `IO.puts` to log what they are
doing, as shown above.

This repository provides the project skeleton, along with the
top-level supervisor (`lib/extra.ex`). The rest is up to you.

To give you an idea of the expected effort, my solution is just over
50 total lines of code (excluding blank lines).

You might find `:rand.uniform/1` useful: http://erlang.org/doc/man/rand.html#uniform-1




