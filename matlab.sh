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
"s" square markers
"x" cross/x markers

"-" solid line
"--" dashed line
":" dotted line
"-." dash-dotted line

"c" cyan color

axis() # lowerbound and upperbound of x-y axis 
xlim(lowerbound,upperbound) # set x axis lowerbound and upperbound
ylim(lowerbound,upperbound) # set y axis lowerbound and upperbound


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