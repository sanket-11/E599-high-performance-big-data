Contains Files for Writing data from log file to DB as well as query modules that were suggested in the course.

mongo-java-driver-3.7.1.jar is the jar file that would have to be included in Java build path to run the following files as intended.

Read_From_Log_to_DB.java - this file contains a function called write_to_db that writes data from log files and filters them before uploading data into intended collections.


------------------ The following files have to be included together included.--------- 
mongoclienttest.java - Contains the function calls to all the functions in DriverService.java, RaceService.java, and TrackService.java

IndycarDBClient.java - Connectes mongoclienttest with the files mentioned below

DriverService.java -Contains the functions for DriverService module

RaceService.java - Contains the functions for RaceService Module

TrackService.java - Contains the functions for TrackService Module
