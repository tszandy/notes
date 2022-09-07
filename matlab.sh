# help of command
help command

# return shape of matrix of vector
size(matrix/vector)

# matrix fill with 1 of shape (m,n)
variable_name = ones(m,n)

# matrix fill with 0 of shape (m,n)
variable_name = zeros(m,n)

# uniform distribution of number from 0 to 1 of shape (m,n)
variable_name = rand(m,n)

# normal distrbution of 0 mean 1 variance of shape (m,n)
variable_name = randn(m,n)

# uniform selection of integer of min 0, max Max and shape (m,n)
variable_name = randi(Max,m,n)

# uniform selection of integer of min Min, max Max and shape (m,n)
variable_name = randi([Min,Max],m,n)

# view distribution of data
histogram(variable_name)

# define M matrix, V Vector

# reshape matrix data to vector data
result = M(:)

# reshape matrix data or vector to matrix of 2xn
resule = reshape(M,2,[])
resule = reshape(V,2,[])

# matrix operation 
*
/
^

# elementwise operation
.*
./
.^

# round number to n decimal place
round(number,n)


# return a same shape matrix that indicate nan value with 1
isnan(matrix)

# number non-zero
nnz(matrix)
numnan = nnz(isnan(matrix))

# average of matrix with nan deleted
mean(matrix,"omitnan")


# matlab visualizing 
plot(data)
plot(data,Line_property,PropertyName,PropertyValue)
stairs(data)
stem(data)
area(data)
scatter(data,marksize,color)
pie(data)

surf(data) # plot matrix in 3d graph with surface 
mesh(data) # plot matrix in 3d graph
contour(data) # contour of a graph visualize 3d in 2d, use to create geometric map.

yline(scaler) # horizontal line
xline(scaler) # vertical line

xticks(label_index)
xticklabels(label_vector)
xlabel(string)
ylabel(string)
title(string)
legend(string_list)
legappend(string_list) # append to current legend
PropertyName: ["MarkerSize","MarkerFaceColor","Color","MarkerEdgeColor","LineWidth"]
"o" circular markers
"*" star markers
"." point markers
"s" square markers
"x" cross/x markers

"-" solid line
"--" dashed line
":" dotted line
"-." dash-dotted line

"c" cyan color

axis() # lowerbound and upperbound of x-y axis 
xlim([lowerbound,upperbound]) # set x axis lowerbound and upperbound
ylim([lowerbound,upperbound]) # set y axis lowerbound and upperbound


& # logical operator and
| # logical operator or
~ # logical operator Not
== # logical operator Equal to
~= # logical operator Not Equal to

any # return 1 if any of matrix is nonzero
all # return 1 if all of matrix is nonzero
find # return indices of logical matrix that have value nonezero
nnz # count number of nonzero

# readtable of data
data = readtable(filename)
data = readtable(filename,"TextType","String")

# write tabledata file 
writetable(tableData,"fileName.csv")
writetable(tableData,"fileName.txt","delimiter","\t")

# description of data
summary(data)

# create table of data
tableData = table(variable1,variable2)
tableData = table(variable1,variable2,"VariableNames",String_list)

# convery matrix of vector to table
tableData = array2table(Matrix)
tableData = array2table(Matrix,"VariableNames",String_list)

# sort data by a variable
sortedTableData = sortrows(tableData, "SortingVariable")
sortedTableData = sortrows(tableData, "SortingVariable","descend")
sortedTableData = sortrows(tableData, ["SortingVariable1","SortingVariable2"],"descend")

# move table variable
data = movevars(data,"variable_name","After",1)

# remove table variable
data = removevars(data,"variable_name")

# rename table variable
data = renamevars(data,"variable_name","new_variable_name")

# subtable
data = data([subindex1],[subindex2])

# subarray from table
data = data{[subindex1],[subindex2]}

# add column of data
tableData{:,"new_data_name"} = new_col_data

# flip a matrix in certain dim, or flip a vector
flip(vector)
flip(matrix,dim)

# join table 
newTableData = join(tableData1,tableData2)

# get type of a variable
class(variable)

# string
"abc"

# array of char
'abc'

# change hearder name of third column of a table
table.Properties.VariableNames{3} = 'newName'

# create datetime Dec 1 ,2021
datetime("01-Dec-2021")

# create datetime 01-Dec-2021 12:11:35
datetime(2021,12,1,12,11,35)

# get duration between two datetime
datetime2 - datetime1

# get calendarDuration between two datetime
between(datetime1,datetime2)

# create a variable contain 1 calendar month
variable = calmonths(1)
calyears
calmonths
caldays

# sort vector 
sort(vector)

# convert string array to categorical array
categorical(string_array)

# check how much memory variable use
whos variable_name

# get unique catogories of categorical array
categories(categorical_array)

# convert table column from string array to categorical array
table.col = categorical(table.col)

# print summary of col variable in table
summary(table.col)

# merge categorical vars to a new categorical var
mergecats(categorical_array,[cats_var1,cats_var2],new_cats_var)

# normalize date to 0 mean and 1 variance
normalized_date = normalize(date,dim)

# create correlation matrix graph
plotmatrix(data)

# calculate correlation coefficient of data
corrcoef(data)

# fit a nth degree polynomial to xdata,ydata
c = polyfit(xdata,ydata,n)

# predict the y value by nth degree polynomial
predict_y = polyval(c,xdata)

# centering and scaleing fitting
[coefficient,S,centering_scaling] = polyfit(xdata,ydata,n)
predict_y = polyval(coefficient,xdata,S,centering_scaleing)

# list MATLAB programming keywords
iskeyword

# display warnning message
warning(message)

# display message
disp(message)

if condition
    command
end

if condition
    command_1
else
    command_2
end

if condition
    command_1
elseif
    command_2
else
    command_3
end

switch variable
    case c1
        command_1
    case c2
        command_2
    otherwise
        command_3
end

# number of element in vector, matrix
numel(vector/matrix)

while condition
    command_1
end

# determine function and variable which have high priority
which variable_name/function_name

# display all instance of function or variable name.
which variable_name/function_name -all

# clear variable from workspace
clear variable_name

figure_variable = figure("Name","figure_name")
axes_variable = axes("XLim",[a,b],"YLim",[c,d])
plot_variable = plot(data)

plot_variable.Color
axes_variable.XLim

# Object Hierarchy
Root->Figure->Axes->Plot_Objects

# get children object
plot_variable = axes_variable.children

# search object
plot_variable = findobj("Type","line")

# get current figure
gcf

# get current axes
gca

#plot subplot
ax1 = subplot(2,1,1)
ax2 = subplot(2,1,2)
plot_variable = plot(ax2,data)

# user interface controls
Root->Figure->UI_Controls

Button = uicontrol("Style","pushbutton","String","button_name")
EditBox = uicontrol("Style","edit","String","default_string")

Button.Position
Button.Units # Normalized, Pixels

# script play execute function_variable when button is pushed
Button.Callback = function_variable(variable_1,variable_2)

# sound function play data y with sample frequency fs
sound(y,fs)

pAx= polaraxes()
pAx.RTick
pAx.ThetaTickLabel

# timer
timer_variable = timer("ExecutionMode","fixedRate","Period",1)
timer_variable.TimerFcn = {@callback,input_variable}
start(timer_variable)
stop(timer_variable)
delete(timer_variable)

# excute callback when figure is delete
figure_variable = figure()
figure_variable.DeleteFcn = {@callback,input_variable}
