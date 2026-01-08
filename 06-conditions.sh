
#!/bin/bash 
echo "enter a number:"
read number
if [ $number -ge 10 ]
then 
    echo "the number is greater than or equal to 10"
else 
    echo "the number is less than 10"
fi