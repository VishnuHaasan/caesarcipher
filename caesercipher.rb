def character?(char)
  char.ord >=65 && char.ord<=90;
end;
def upcase?(char)
  character?(char);
end;
def downcase?(char)
  char.ord >=97 && char.ord <=122;
end;
def cipher(word,shift)
  res = String.new;
  list = word.split("");
  list.each do |character|
    if character?(character)
      shiftnum = character.ord + shift%26;
      if shiftnum > 90
        shiftnum = 64 + shiftnum-90;
      elsif shiftnum < 65
        shiftnum = 90 + 65 - shiftnum;
      end
      res << shiftnum.chr;
    else  
      res << character;
    end;
  end;
  return res;
end;
word = gets.chomp;
testing = word.upcase;
shift = gets.chomp.to_i;
res = cipher(testing,shift);
i = 0;
result = Array.new;
while i<word.length do
  if upcase?(word[i])
    result.push(res[i].upcase) 
  elsif downcase?(word[i])
    result.push(res[i].downcase) 
  else
    result.push(res[i]); 
  end;
  i+=1;
end;
puts result.join('');
