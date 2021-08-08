# spacex_bloc

A Flutter project that uses SpaceX GraphQL API and searches for missions.

- The user must be able to type a text to search into the SpaceX missions
- The search must be done by calling the GraphQL query ***launches*** filtering by the ***mission_name*** field exposed by this public backend:
https://api.spacex.land/graphql/
- The user should see, as a result of the performed search, a list of items composed by the ***mission_name*** and ***details*** fields as returned by the server.
- The search should start only for search text longer than 3 characters

## Installing

- Install Google Flutter 2.2.3+
- Clone or download the master branch of this repository
- Run "flutter pub get" to install packages
- Run the project on emulator or real device
