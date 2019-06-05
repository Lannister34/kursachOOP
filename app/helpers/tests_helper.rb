module TestsHelper 
 def test_completed?(user)
  if !user.tests.nil?
   if user.tests.kind_of?(Array)
    user.tests.each do |test|
     if test == @test.id
      return true
     end
    end
   else
    if user.tests.to_i == @test.id
     return true
    end
   end
  end
 return false
 end
end
