rvm # ruby version managerment software

# debian 11 install ruby version manager
sudo apt update
sudo apt install curl
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -
curl -sSL https://get.rvm.io | bash -s stable

# install ruby
https://rubyinstaller.org/downloads/

irb # interactive ruby test ruby command

puts "string"  # print string and switch to new line
print "string" # print string 
gets # take input from user

variable = Array[1,2,3]

hashtable = {
    "key_1"=>"value_1",
    "key_2"=>"value_2"
}

1.to_s # convert number to string

def functionName(variable_1,variable_2)
    puts(variable_1+variable_2)
end

def functionName(variable)
    return variable
end

if condition_1
    brock_code_1
elsif condition_2
    brock_code_2
else
    brock_code_3
end

case case_var
when match_var_1
    brock_code_1
when match_var_2
    brock_code_2
when match_var_3
    brock_code_3
when match_var_4
    brock_code_4
else
    brock_code_5
end


class ClassName
    sttr_accessor :var_1, :var_2, :var_3
    def initialize(var_4, var_5, var_6)
        @var_1 = var_4
        @var_2 = var_5
        @var_3 = var_6
    end
end
class_1 = ClassName.new(data_1,data_2,data_3)
