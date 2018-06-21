# Go Food Go-Cli App

### Class Diagram
[![Classdiagram.png](classdiagra.png)](classdiagram.png)
##### People
Class people has value x and y. It is used to determine a position of the person.
This class has 3 method.
+ move(x,y)
For moving some person to position (x,y)
+ get_loc()
Getting currently person position
+ calculatePeopleDistance(people)
Get distance between 2 person 

##### Driver
Class that inherit class people. This class is used to differentiate between a driver and a customer. This class also has extra instance variable `:name` for user name

##### Customer
Class that inherit class people. This class is used to differentiate between a driver and a customer.

##### Map 
This class is used to generate map for the application. The map consist of 3 object. Driver `(D)`, Customer `(C)` and empty block `(+)`
This class has a customer and array of drivers as instance variable. 

#### GoCli
GoCli is the class that become the interface for communicating between the client and the application. This has 3 Special method : 
+ Show Map
For showing currently map to user
+ Order Go Ride
For transporting the user to specific location with the nearest driver
+ View History
View history of all transaction on go-ride
This class also has method `get_price` for get currently price of one-block in map

### Documentation
#### Executing
For running this program, first navigate to the directory of the folder. Then executes command
`ruby go-cli.rb`
For executing this program, it has 3 ways
##### Execute without parameter
`ruby go-cli.rb`
will execute program with 20*20 Map a random customer place and generate 5 random drivers and placed randomly

##### Execute With Three parameter
`ruby go-cli.rb 45 11 11`
this will execute program with 45*45 as the input and the Customer will be placed on the 11 11 location from the input it also generate 5 random drivers placed randomly

##### Execute With Filename parameter
`ruby go-cli.rb filename.txt`
this will execute program and will loking for file with name filename.txt within its directory if the file doesn't found it will launch and error. The format of the input file should be like this
```
20
19 19
7
adi 7 7
guno 9 1
lala 19 4 
akbar 1 6
dio 15 17
sasa 1 12
pikopo 9 13
```
The first line contain n. the size of the map
The second line contain x, y for the location of starting customer
The third line is m. Number of the drivers in map.
For the next m line contain the detail of the driver. Each line has 3 value passed.
First the name of the driver, second and the third is the position of the driver

