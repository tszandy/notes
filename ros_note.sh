ROS Command

ROS List Command

rostopic list # list the active topics on the terminal

rosparam list # list parameter names

rosnode list # list current ros node

rosservice list # print information about active services

ROS Package

roscd #cd that use in ros system.

catkin_create_pkg ${package_name} ${depend1} ${depend2} ${depend3} # create package with dependency

rospack depends1 ${work_space_name} # print direct dependency

rospack depends ${work_space_name} # print all dependency

ROS Nodes

roscore # first thing you should run when using ROS

rosnode list # list current ros node

rosnode info ${node} # gave us some info about ${node}

rosrun ${package_name} ${node_name} # run package ${package_name} on node ${node_name}

rosrun ${package_name} ${node_name} __name:=${specific name} # run package ${package_name} on node ${node_name} with specific name ${specific name}

rosnode ping ${specific name} # ping to node with ${specific name}

rosrun rqt_graph rqt_graph

ROS topic

rostopic list # list the active topics on the terminal

rostopic -h # list all available sub-commands for rorstopic.

rostopic echo auto_complete # find option that can run under echo

rostopic echo /turtle1/cmd_vel # look at command velocity data published by the turtle_teleop_key

rostopic list -h # find out which argument the list sub-command needs.

rostopic list -v # display a verbose list of topics to publish to and subscribe to.

rostopic type ${topic} # return message type of ${topic} being published

rostopic type /turtle1/cmd_vel # get geometry_msgs/Twist

rosmsg show geometry_msgs/Twist

rostopic pub ${topic} ${msg_type} ${args} # 

rostopic pub /turtle1/cnd_vel geometry_msgs/Twist -r 1 —‘[2.0, 0.0, 0.0]’ ‘[0.0, 0.0, -1.8]’

rostopic hz ${topic} # reports the rate at which data is published.

rosrun rqt_plot rqt_plot # displays a scrolling time plot of the data published on topics.

ROS service and rosparam

rosservice list # print information about active services

rosservice call # call the service with the provided args

rosservice type # print service type

rosservice find # find services by service type

rosservice uri # print service ROSRPC uri

rosparam set # set parameter

rosparam get # get parameter

rosparam load # load parameters from file 
rosparam load params.yaml copy_turtle

rosparam dump # dump parameters to file
rosparam dump params.yaml

rosparam delete # delete parameter

rosparam list # list parameter names

rqt_console and roslaunch

rosrun rqt_console rqt_console

rosrun rqt_logger_level rqt_logger_level

roslaunch ${package_name} ${file_name} # ros launch package for file

rosed

rosed ${package_name} ${filename}
allows you to directly edit a file within a package by using the package name rather than having to type the entire path to the package.
ex: rosed roscpp <tab><tab>

ROS msg and srv
msg files are simple text files that describe the fields of a ROS message
The field types you can use are:
* int8, int16, int32, int64 (plus uint*)
* float32, float64
* string
* time, duration
* other msg files
* variable-length array[] and fixed-length array[C]

Here is an example of a msg that uses a Header, a string primitive, and two other msgs :

  Header header
  string child_frame_id
  geometry_msgs/PoseWithCovariance pose
  geometry_msgs/TwistWithCovariance twist

srv files are just like msg files, except they contain two parts: a request and a response. The two parts are separated by a '---' line. Here is an example of a srv file:

int64 A
int64 B
---
int64 Sum

Creating a msg

roscd beginner_tutorials
mkdir msg
echo "int64 num" > msg/Num.msg

create a more complex file by adding multiple elements, one per line, like this:
string first_name
string last_name
uint8 age
uint32 score

 Open package.xml, and make sure these two lines are in it
  <build_depend>message_generation</build_depend>
  <exec_depend>message_runtime</exec_depend>

add the message_generation dependency to generate messages in CMakeLists.txt:
find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  message_generation
)

export the message runtime dependency.
catkin_package(
  ...
  CATKIN_DEPENDS message_runtime ...
  ...)

replace the stand in Message*.msg files with your .msg file, such that it looks like this:

add_message_files(
  FILES
  Num.msg
)

we make sure that CMake knows when it has to reconfigure the project after you add other .msg files.
generate_messages(
  DEPENDENCIES
  std_msgs
)

Using rosmsg

rosmsg show ${message type}
Ex: rosmsg show beginner_tutorials/Num
Ex: rosmsg show Num

Creating a srv

roscp ${package_name} ${file_to_copy_path} ${copy_path}
Ex: roscp rospy_tutorials AddTwoInts.srv srv/AddTwoInts.srv

Unless you have done so already, open package.xml, and make sure these two lines are in it.
  <build_depend>message_generation</build_depend>
  <exec_depend>message_runtime</exec_depend>

add the message_generation dependency to generate messages in CMakeLists.txt:
find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  message_generation
)

replace the placeholder Service*.srv files for your service files:
add_service_files(
  FILES
  AddTwoInts.srv
)

Using rossrv

rossrv show ${service type}
Ex: rossrv show beginner_tutorials/AddTwoInts

rossrv show AddTwoInts	
Output:
[beginner_tutorials/AddTwoInts]:
int64 a
int64 b
---
int64 sum

[rospy_tutorials/AddTwoInts]:
int64 a
int64 b
---
int64 sum

Common step for msg and srv
add any packages you depend on which contain .msg files that your messages use (in this case std_msgs), such that it looks like this:

generate_messages(
  DEPENDENCIES
  std_msgs
)

Getting Help

rosmsg -h
* You should see a list of different rosmsg subcommands. Commands:
*   rosmsg show     Show message description
*   rosmsg list     List all messages
*   rosmsg md5      Display message md5sum
*   rosmsg package  List messages in a package
*   rosmsg packages List packages that contain messages

Rosdep

rosdep install ${package}


