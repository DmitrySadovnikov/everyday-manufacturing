## The program for finding the distance between points

```bash
bundle install
ruby lib/run.rb
```

Output:
```bash
4 Ian Kehoe
5 Nora Dempsey
6 Theresa Enright
11 Richard Finnegan
12 Christina McArdle
13 Olive Ahearn
15 Michael Ahearn
26 Stephen McArdle
28 Charlie Halligan
29 Oliver Ahearn
30 Nick Enright
31 Alan Behan
39 Lisa Ahearn
```
Run codestyle check:
```bash
rubocop
```

Run tests:
```bash
rspec
```

To solve the problem, I used pure Ruby, the speed of the program, in this case, is higher than when using the framework.
The formula for finding the distance between points took from here:

```bash
https://en.wikipedia.org/wiki/Great-circle_distance
```

I checked the correctness of writing the program on this site
```bash
https://www.distance.to/53.1489345,-6.8422408/53.74452,-7.11167
```

For example, I took the coordinates from Oliver Ahearn (latitude = 53.74452, longitude = -7.11167)

The result of my program: 68.59 km

Result www.distance.to: 68.61 km

There is a small error in the calculations, perhaps this is due to the radius of the earth (For my program, I took a radius of 6371.23 km)