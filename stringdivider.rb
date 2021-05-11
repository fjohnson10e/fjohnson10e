=begin
This creates a Ruby definition which adds the 
division operator to the standard string 
class. When dividing a string by an integer, 
the operator produces an array of strings. 
The size of the array is the given integer, 
and contents of the array are parts of the 
string that, when concatenated in order, 
produce the original string.
=end

# reopen the string class
String.class_eval do
  # add a definition of the method /.
  def /(number)
    begin
      #check dividing a string by a negative or zero number, or dividing by a value which is not an integer is undefined.
      if number<=0
        return "You can't divide a string by a negative or zero number. Try again."
      end
      #Declare array of strings
      strings=[]
      # if the length of  the input string mod number <> 0
      if (self.length % number)!=0
        # calculate the number of parts of the left part of the input string
        part1Number = (number/2)+1
        # calculate the number of parts of right part of the input string
        part2Number=number-part1Number
        # calculate the number the lettes in the first parts
        part1Length = (self.length / number)+1
        # calculate the number the lettes in the second parts
        part2Length = (self.length-part1Length*part1Number)/part2Number
        # set current part to 0
        currentPart=0
        # get the parts for the left part of the input string
        while(currentPart<part1Number)
          strings<<self[currentPart * part1Length, part1Length]
          currentPart+=1
        end
        # get the parts for the right part of the input string
        startLetterPostion=currentPart * part1Length
        currentPart+=1
        while(currentPart<=(part1Number+part2Number))
          strings<<self[startLetterPostion, part2Length]
          currentPart+=1
          startLetterPostion=currentPart * part2Length
        end
      else
        # calculate the number of parts for the input string
        partLength = self.length / number
        i=0
        # get the parts of the input string
        while(i<number)
          strings<<self[i * partLength, partLength]
          i+=1
        end
      end
      # return all values in array
      return strings
    rescue SyntaxError => e
      puts ("")
    end
  end
end
