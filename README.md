# Knights Travails
## Description
This program takes a start square and target square from a chess board and finds
the shortest path between the two for a knight. This was part of [The Odin Project](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/knights-travails).

A graph was created by creating a node for each square on the chess board and
connecting the nodes based on where a knight could move from each square. The
graph had to consider the bounds of the chess board.

The shortest path was calculated using Dijkstra's algoritm.

A live version is on [Replit.com](https://replit.com/@PlaustralCL/knightstravails#main.rb)

The code is on [Github](https://github.com/PlaustralCL/knights_travails)

## Reflections
* First time building a graph
* Translating a description of an algorithm into code
* Translating chess notation into a more code friendly format